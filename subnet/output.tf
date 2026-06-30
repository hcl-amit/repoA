output "subnet_id" {
  description = "The ID of the subnet."
  value       = azurerm_subnet.subnet.id
}

output "subnet_name" {
  description = "The name of the subnet."
  value       = azurerm_subnet.subnet.name
}

output "subnet_address_prefixes" {
  description = "The address prefixes of the subnet."
  value       = azurerm_subnet.subnet.address_prefixes
}

output "subnet_virtual_network_name" {
  description = "The name of the virtual network to which the subnet is attached."
  value       = azurerm_subnet.subnet.virtual_network_name
}

output "subnet_resource_group_name" {
  description = "The name of the resource group in which the subnet is created."
  value       = azurerm_subnet.subnet.resource_group_name
}

output "subnet_service_endpoints" {
  description = "The service endpoints associated with the subnet."
  value       = azurerm_subnet.subnet.service_endpoints
}

output "subnet_service_endpoint_policy_ids" {
  description = "The IDs of the service endpoint policies associated with the subnet."
  value       = azurerm_subnet.subnet.service_endpoint_policy_ids
}

output "subnet_delegations" {
  description = "The delegations associated with the subnet."
  value       = azurerm_subnet.subnet.delegation
}