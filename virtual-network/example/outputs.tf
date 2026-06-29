output "virtual_network_id" {
  description = "The ID of the Virtual Network"
  value       = module.virtual_network.virtual_network_id
}

output "virtual_network_name" {
  description = "The name of the Virtual Network"
  value       = module.virtual_network.virtual_network_name
}

output "virtual_network_location" {
  description = "The location of the Virtual Network"
  value       = module.virtual_network.virtual_network_location
}

output "virtual_network_resource_group_name" {
  description = "The resource group of the Virtual Network"
  value       = module.virtual_network.virtual_network_resource_group_name
}

output "virtual_network_address_space" {
  description = "Address space of the Virtual Network"
  value       = module.virtual_network.virtual_network_address_space
}

output "virtual_network_dns_servers" {
  description = "DNS servers configured for the Virtual Network"
  value       = module.virtual_network.virtual_network_dns_servers
}

output "virtual_network_tags" {
  description = "Tags assigned to the Virtual Network"
  value       = module.virtual_network.virtual_network_tags
}

output "ddos_protection_plan_id" {
  description = "DDoS Protection Plan ID attached to the VNet"
  value       = module.virtual_network.ddos_protection_plan_id
}

output "ddos_protection_enable" {
  description = "Indicates whether DDoS protection is enabled"
  value       = module.virtual_network.ddos_protection_enable
}