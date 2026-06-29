run "virtual_network_unit_test" {

  command = plan

  assert {
    condition = length(output.id) > 0
    error_message = "Virtual Network ID should not be empty."
  }

  assert {
    condition = output.name == "vnet-demo"
    error_message = "Virtual Network name is incorrect."
  }

  assert {
    condition = output.address_space[0] == "10.10.0.0/16"
    error_message = "Address space is incorrect."
  }

  assert {
    condition = length(output.guid) > 0
    error_message = "GUID should not be empty."
  }

  assert {
    condition = length(output.resource_guid) > 0
    error_message = "Resource GUID should not be empty."
  }

  assert {
    condition = can(output.id)
    error_message = "Output 'id' must exist."
  }
}