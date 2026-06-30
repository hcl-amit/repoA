mock_provider "azurerm" {}

run "unit_validate_subnet_configuration" {
  command = plan

  # Resource mapping validation
  assert {
    condition     = azurerm_subnet.subnet.name == var.name
    error_message = "Subnet name did not match as expected."
  }

  assert {
    condition     = azurerm_subnet.subnet.resource_group_name == var.resource_group_name
    error_message = "Resource Group name did not match as expected."
  }

  assert {
    condition     = azurerm_subnet.subnet.virtual_network_name == var.virtual_network_name
    error_message = "Virtual Network name did not match as expected."
  }

  assert {
    condition     = toset(azurerm_subnet.subnet.address_prefixes) == toset(var.address_prefixes)
    error_message = "Address prefixes did not match as expected."
  }

  assert {
    condition     = toset(azurerm_subnet.subnet.service_endpoints) == toset(var.service_endpoints)
    error_message = "Service endpoints did not match as expected."
  }

  # Naming convention validation
  assert {
    condition     = can(regex("^snet-[a-z0-9]+-(dev|test|stage|prod)-[a-z0-9]+-[0-9]{3}$", var.name))
    error_message = "Subnet name does not follow naming convention."
  }

  assert {
    condition     = length(var.name) <= 80
    error_message = "Subnet name exceeds allowed length."
  }

  # Address Prefix Validation
  assert {
    condition     = length(var.address_prefixes) > 0
    error_message = "At least one address prefix must be provided."
  }

  # Private Endpoint Policies Validation
  assert {
    condition = contains([
      "Disabled",
      "Enabled",
      "NetworkSecurityGroupEnabled",
      "RouteTableEnabled"
    ], var.private_endpoint_network_policies)

    error_message = "Invalid private endpoint network policies configuration."
  }

  # Outbound Access Validation
  assert {
    condition     = var.default_outbound_access_enabled == true || var.default_outbound_access_enabled == false
    error_message = "Invalid value for default outbound access."
  }

  # Private Link Service Validation
  assert {
    condition     = var.private_link_service_network_policies_enabled == true || var.private_link_service_network_policies_enabled == false
    error_message = "Invalid private link service network policy value."
  }

  # Service Endpoint Policy Validation
  assert {
    condition = length(var.service_endpoint_policy_ids) == 0 || alltrue([
      for id in var.service_endpoint_policy_ids :
      can(regex("^/subscriptions/.*/resourceGroups/.*/providers/Microsoft.Network/serviceEndpointPolicies/.*$", id))
    ])
    error_message = "One or more service endpoint policy IDs are invalid."
  }

  # Delegation Validation
  assert {
    condition = length(var.delegations) == 0 || alltrue([
      for d in var.delegations :
      length(d.delegation_name) > 0 &&
      length(d.service_delegation.service_delegation_name) > 0
    ])
    error_message = "Delegation configuration is invalid."
  }

  # Delegation Mapping Check
  assert {
    condition = length(var.delegations) == 0 || (
      azurerm_subnet.subnet.delegation[0].name == var.delegations[0].delegation_name
    )
    error_message = "Subnet delegation did not match as expected."
  }
}