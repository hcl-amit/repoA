mock_provider "azurerm" {}

run "unit_validate_virtual_network_configuration" {

  command = plan

  # Resource mapping validation

  assert {
    condition     = azurerm_virtual_network.virtual_network.name == var.virtual_network_name
    error_message = "Virtual Network name did not match as expected."
  }

  assert {
    condition     = azurerm_virtual_network.virtual_network.resource_group_name == var.virtual_network_resource_group_name
    error_message = "Resource group name did not match as expected."

  }

  # FIXED location comparison
  assert {
    condition     = lower(azurerm_virtual_network.virtual_network.location) == lower(replace(var.virtual_network_location, " ", ""))
    error_message = "Location did not match as expected."
  }

  assert {
    condition     = contains(azurerm_virtual_network.virtual_network.address_space, var.virtual_network_address_space[0])
    error_message = "Address space did not match as expected."
  }


  assert {
    condition     = azurerm_virtual_network.virtual_network.dns_servers == var.virtual_network_dns_servers
    error_message = "DNS servers did not match as expected."
  }

  assert {
    condition     = azurerm_virtual_network.virtual_network.tags["ManagedBy"] == "terraform"
    error_message = "Tags did not match as expected."
  }

  # Naming convention validation

  assert {
    condition     = can(regex("^vnet-[a-z0-9]+-(dev|test|stage|prod)-[a-z0-9]+-[0-9]{3}$", var.virtual_network_name))
    error_message = "Invalid naming convention."
  }

  assert {
    condition     = length(var.virtual_network_name) <= 80
    error_message = "Virtual Network name too long."
  }

  # Address space validation

  assert {
    condition     = length(var.virtual_network_address_space) > 0
    error_message = "At least one address space must be defined."
  }

  # DNS validation

  assert {
    condition = length(var.virtual_network_dns_servers) == 0 || alltrue([
      for ip in var.virtual_network_dns_servers :
      can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", ip))
    ])
    error_message = "Invalid DNS server IP."
  }

  # DDOS validation

  assert {
    condition = (
      var.ddos_protection_plan_id == null && var.ddos_protection_enable == false
      ) || (
      var.ddos_protection_plan_id != null
    )
    error_message = "Invalid DDOS configuration."
  }

  # SAFE ddos block check (fixed)
  assert {
    condition = var.ddos_protection_plan_id == null || (
      length(azurerm_virtual_network.virtual_network.ddos_protection_plan) > 0 &&
      azurerm_virtual_network.virtual_network.ddos_protection_plan[0].id == var.ddos_protection_plan_id
    )
    error_message = "DDOS plan ID mismatch."
  }

  # Environment match (safe)

  assert {
    condition = can(regex(
      ".*-${lookup(var.virtual_network_tags, "Environment", "")}-.*",
      var.virtual_network_name
    ))
    error_message = "Environment tag did not match as expected."
  }

  # Mandatory tags

  assert {
    condition = alltrue([
      contains(keys(var.virtual_network_tags), "Environment"),
      contains(keys(var.virtual_network_tags), "Application"),
      contains(keys(var.virtual_network_tags), "Owner"),
      contains(keys(var.virtual_network_tags), "CostCenter")
    ])
    error_message = "Missing mandatory tags."
  }

  # Tag values validation

  assert {
    condition     = contains(["dev", "test", "prod"], lower(var.virtual_network_tags["Environment"]))
    error_message = "Invalid Environment tag."
  }


  assert {
    condition     = can(regex("^[A-Z]{2,5}-[0-9]{4,6}$", var.virtual_network_tags["CostCenter"]))
    error_message = "Invalid CostCenter format."
  }

  assert {
    condition     = length(trimspace(var.virtual_network_tags["Owner"])) > 0
    error_message = "Owner cannot be empty."
  }

}
