run "validate_vnet_name" {

  command = plan

  assert {
    condition     = module.virtual_network.name == "vnet-network-dev"
    error_message = "VNET name mismatch"
  }
}