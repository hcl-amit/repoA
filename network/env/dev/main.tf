module "resource_group" {

  source = "../../modules/resource-group"

  name = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "virtual_network" {

  source = "../../modules/virtual-network"

  name                = var.vnet_name
  location            = var.location
  resource_group_name = module.resource_group.name

  address_space = var.address_space

  tags = var.tags
}