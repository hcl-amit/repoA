name = "vnet-test"

resource_group_name = "rg-test"

location = "Central India"

address_space = [
  "10.20.0.0/16"
]

dns_servers = []

tags = {

  Environment = "Test"

  Owner = "Terraform"

  Application = "Networking"

}