name                = "pip-app-test-eastus-001"
resource_group_name = "rg-app-test-eastus-001"
location            = "eastus"

allocation_method = "Static"
sku               = "Standard"
sku_tier          = "Regional"


zones = ["1", "2", "3"]


ddos_protection_mode    = "Enabled"
ddos_protection_plan_id = "/subscriptions/xxxx/resourceGroups/rg-network/providers/Microsoft.Network/ddosProtectionPlans/ddos-plan-01"

ip_version = "IPv4"


idle_timeout_in_minutes = 4

domain_name_label = "pip-app-test-eastus-001"


tags = {
  Environment = "test"
  Application = "app"
  Owner       = "ulsc-public-ip"
  CostCenter  = "ULS-12345"
}

ip_tags = {
  RoutingPreference = "Internet"
}