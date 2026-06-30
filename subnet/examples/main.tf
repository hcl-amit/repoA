module "subnet" {
  source = "../"

  name                 = "snet-app-dev-eastus-001"
  resource_group_name  = "rg-app-dev-eastus-001"
  virtual_network_name = "vnet-app-dev-eastus-001"

  address_prefixes = ["10.0.1.0/24"]

  default_outbound_access_enabled               = true
  private_endpoint_network_policies             = "Enabled"
  private_link_service_network_policies_enabled = true

  service_endpoints = [
    "Microsoft.Storage",
    "Microsoft.Sql"
  ]

  service_endpoint_policy_ids = []
  delegations = []
}