module "virtual_network" {

  source = "../"

  name                = "vnet-demo"
  resource_group_name = "rg-demo"

  location = "Central India"

  address_space = [
    "10.10.0.0/16"
  ]

  dns_servers = []

  tags = {

    Environment = "Dev"

    Owner = "Platform Team"

    Application = "Networking"

  }

}