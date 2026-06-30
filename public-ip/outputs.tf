output "public_ip_id" {
  description = "The ID of the public IP"
  value       = azurerm_public_ip.public_ip.id
}

output "public_ip_name" {
  description = "The name of the public IP"
  value       = azurerm_public_ip.public_ip.name
}

output "public_ip_address" {
  description = "The actual IP address allocated"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "public_ip_fqdn" {
  description = "The FQDN of the public IP, if configured"
  value       = azurerm_public_ip.public_ip.fqdn
}

output "public_ip_location" {
  description = "The location of the public IP"
  value       = azurerm_public_ip.public_ip.location
}

output "public_ip_tags" {
  description = "Tags assigned to the public IP"
  value       = azurerm_public_ip.public_ip.tags
}
