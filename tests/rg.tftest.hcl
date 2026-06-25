run "validate_rg_name" {

  command = plan

  assert {
    condition     = module.resource_group.name == "rg-network-dev"
    error_message = "RG name mismatch"
  }
}