resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  resource_group_name = var.virtual_network_resource_group_name
  location            = var.virtual_network_location
  address_space       = var.virtual_network_address_space
  dns_servers         = var.virtual_network_dns_servers
  tags                = var.virtual_network_tags
  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan_id != null ? [1] : []
    content {
      enable = var.ddos_protection_enable
      id     = var.ddos_protection_plan_id
    }
  }
}