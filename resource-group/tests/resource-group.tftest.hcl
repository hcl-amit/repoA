provider "azurerm" {
  features {}
}

run "unit_validate_resource_group_configuration" {
  command = plan

  # Resource mapping validation
  assert {
    condition     = azurerm_resource_group.resource_group.name == var.resource_group_name
    error_message = "Resource Group name is not mapped correctly from var.resource_group_name."
  }

  assert {
    condition     = azurerm_resource_group.resource_group.location == lower(replace(var.resource_group_location, " ", ""))
    error_message = "Resource Group location is not mapped correctly from var.resource_group_location."
  }

  assert {
    condition     = azurerm_resource_group.resource_group.tags["ManagedBy"] == "terraform"
    error_message = "Resource Group tags are not mapped correctly."
  }


  # Naming convention validation
  # Expected format: rg-<app>-<env>-<region>-<instance_number>
  # Example: rg-app-prod-eu-001
  assert {
    condition     = can(regex("^rg-[a-z0-9]+-(dev|test|stage|prod)-[a-z0-9]+-[0-9]{3}$", var.resource_group_name))
    error_message = "Resource Group name does not follow enterprise naming convention: rg-<app>-<env>-<region>-<instance_number>."
  }

  assert {
    condition     = length(var.resource_group_name) <= 90
    error_message = "Resource Group name must not exceed the supported Azure name length."
  }


  # Environment consistency validation
  # Ensures Environment tag matches the environment segment in the resource name.
  # Example: name contains '-prod-' and tag Environment = 'prod'
  assert {
    condition     = can(regex(".*-${var.resource_group_tags["Environment"]}-.*", var.resource_group_name))
    error_message = "Environment tag does not match the environment segment in resource_group_name."
  }


  # Mandatory enterprise tag validation
  assert {
    condition = alltrue([
      contains(keys(var.resource_group_tags), "Environment"),
      contains(keys(var.resource_group_tags), "Application"),
      contains(keys(var.resource_group_tags), "Owner"),
      contains(keys(var.resource_group_tags), "CostCenter"),
      contains(keys(var.resource_group_tags), "BusinessUnit"),
      contains(keys(var.resource_group_tags), "DataClassification"),
      contains(keys(var.resource_group_tags), "ManagedBy")
    ])
    error_message = "One or more mandatory enterprise tags are missing."
  }

 
  #Tag value validation
assert {
  condition     = contains(["dev", "test", "stage", "prod"], lower(var.resource_group_tags["Environment"]))
  error_message = "Environment must be one of: dev, test, stage, prod."
}

  assert {
    condition     = var.resource_group_tags["ManagedBy"] == "terraform"
    error_message = "ManagedBy tag must be set to terraform."
  }

assert {
  condition     = can(regex("^[A-Z]{2,5}-[0-9]{4,6}$", var.resource_group_tags["CostCenter"]))
  error_message = "CostCenter must follow format like ULS-12345."
}

  assert {
    condition     = length(trimspace(var.resource_group_tags["Owner"])) > 0
    error_message = "Owner tag must not be empty."
  }

  assert {
  condition     = can(regex("^[A-Z]{2,10}$", var.resource_group_tags["BusinessUnit"]))
  error_message = "BusinessUnit must be uppercase code like FIN, ENG, HR."
}

assert {
  condition     = contains(["public", "internal", "confidential", "restricted"], lower(var.resource_group_tags["DataClassification"]))
  error_message = "DataClassification must be: public, internal, confidential, or restricted."
}
}
