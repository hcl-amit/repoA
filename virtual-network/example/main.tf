module "virtual_network" {
  source = "../"

  virtual_network_name                = "vnet-app-dev-eastus-001"
  virtual_network_resource_group_name = "rg-app-dev-eastus-001"
  virtual_network_location            = "East US"

  virtual_network_address_space = ["10.0.0.0/16"]

  virtual_network_dns_servers = [
    "8.8.8.8",
    "8.8.4.4"
  ]

  virtual_network_tags = {
    Environment  = "dev"
    Application  = "myapp"
    Owner        = "network-team"
    CostCenter   = "ULS-12345"
    BusinessUnit = "IT"
  }

  ddos_protection_plan_id = null
  ddos_protection_enable  = false
}
