run "resource_group_plan" {

  command = plan

  assert {
    condition     = length(plan.resource_changes) == 1
    error_message = "Exactly one resource should be planned."
  }

  assert {
    condition = plan.resource_changes[0].type == "azurerm_resource_group"
    error_message = "The planned resource must be an Azure Resource Group."
  }

  assert {
    condition = plan.resource_changes[0].change.after.name == "rg-test-dev"
    error_message = "Resource Group name is incorrect."
  }

  assert {
    condition = plan.resource_changes[0].change.after.location == "Central India"
    error_message = "Resource Group location is incorrect."
  }

  assert {
    condition = plan.resource_changes[0].change.after.tags["Environment"] == "Test"
    error_message = "Environment tag should be 'Test'."
  }

}