output "virtual_network_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.virtual_network.id
}

output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.virtual_network.name
}

output "virtual_network_location" {
  description = "The location of the virtual network"
  value       = azurerm_virtual_network.virtual_network.location
}

output "virtual_network_resource_group_name" {
  description = "The resource group of the virtual network"
  value       = azurerm_virtual_network.virtual_network.resource_group_name
}

output "virtual_network_address_space" {
  description = "Address space of the virtual network"
  value       = azurerm_virtual_network.virtual_network.address_space
}

output "virtual_network_dns_servers" {
  description = "DNS servers configured for the virtual network"
  value       = azurerm_virtual_network.virtual_network.dns_servers
}

output "virtual_network_tags" {
  description = "Tags assigned to the virtual network"
  value       = azurerm_virtual_network.virtual_network.tags
}

output "ddos_protection_plan_id" {
  description = "DDoS Protection Plan ID attached to the VNet"
  value       = try(azurerm_virtual_network.virtual_network.ddos_protection_plan[0].id, null)
}

output "ddos_protection_enable" {
  description = "Indicates whether DDoS protection is enabled"
  value       = try(azurerm_virtual_network.virtual_network.ddos_protection_plan[0].enable, false)
}

