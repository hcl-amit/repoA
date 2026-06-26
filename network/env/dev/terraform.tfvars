resource_group_name = "rg-network-dev"

vnet_name = "vnet-network-dev"

location = "centralindia"

address_space = [
  "10.10.0.0/16"
]

tags = {
  environment = "dev"
  application = "network"
  owner       = "platform-team"
}