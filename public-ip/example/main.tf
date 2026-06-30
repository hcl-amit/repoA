module "public_ip" {
  source = "../"

  public_ip_name                = "pip-example-dev-001"
  public_ip_resource_group_name = "rg-example-dev"
  public_ip_location            = "eastus"
  public_ip_allocation_method   = "Static"
  public_ip_sku                 = "Standard"

  public_ip_tags = {
    Environment = "test"
    Application = "myapp"
    Owner       = "platform-team"
    CostCenter  = "ULS-12345"
  }
}

