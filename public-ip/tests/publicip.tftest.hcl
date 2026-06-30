mock_provider "azurerm" {}

run "unit_validate_public_ip_configuration" {
  command = plan

  # Resource mapping validation

  assert {
    condition     = azurerm_public_ip.public_ip.name == var.name
    error_message = "Public IP name did not match as expected."
  }

  assert {
    condition     = azurerm_public_ip.public_ip.resource_group_name == var.resource_group_name
    error_message = "Resource Group name did not match as expected."
  }

  assert {
    condition     = azurerm_public_ip.public_ip.location == lower(replace(var.location, " ", ""))
    error_message = "Location did not match as expected."
  }

  assert {
    condition     = azurerm_public_ip.public_ip.allocation_method == var.allocation_method
    error_message = "Allocation method did not match as expected."
  }

  assert {
    condition     = azurerm_public_ip.public_ip.sku == var.sku
    error_message = "SKU did not match as expected."
  }


  # Naming convention validation
  # Expected: pip-<app>-<env>-<region>-<instance>
  # Example: pip-app-prod-eastus-001

  assert {
    condition     = can(regex("^pip-[a-z0-9]+-(dev|test|stage|prod)-[a-z0-9]+-[0-9]{3}$", var.name))
    error_message = "Public IP name does not follow naming convention: pip-<app>-<env>-<region>-<instance>."
  }

  assert {
    condition     = length(var.name) <= 80
    error_message = "Public IP name exceeds allowed length."
  }

  # Allocation Method Validation
  assert {
    condition     = contains(["Static", "Dynamic"], var.allocation_method)
    error_message = "Allocation method must be Static or Dynamic."
  }

  # SKU Validation
  assert {
    condition     = contains(["Basic", "Standard"], var.sku)
    error_message = "SKU must be either Basic or Standard."
  }


  # DNS Label Validation
  assert {
    condition     = var.domain_name_label == null || can(regex("^[a-z0-9-]{3,63}$", var.domain_name_label))
    error_message = "Domain name label must be 3-63 characters, lowercase alphanumeric or hyphens."
  }


  # tag Validation
  assert {
    condition = alltrue([
      contains(keys(var.tags), "Environment"),
      contains(keys(var.tags), "Application"),
      contains(keys(var.tags), "Owner"),
      contains(keys(var.tags), "CostCenter")
    ])
    error_message = "Missing mandatory tags."
  }


  # Tag Value Validation
  assert {
    condition     = contains(["dev", "test", "prod"], lower(var.tags["Environment"]))
    error_message = "Invalid Environment tag."
  }

  assert {
    condition     = can(regex("^[A-Z]{2,5}-[0-9]{4,6}$", var.tags["CostCenter"]))
    error_message = "Invalid CostCenter format (Example: ULS-12345)."
  }

  assert {
    condition     = length(trimspace(var.tags["Owner"])) > 0
    error_message = "Owner tag cannot be empty."
  }

}