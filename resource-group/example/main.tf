terraform {
  required_version = ">= 1.13.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.23.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "../"

  resource_group_name     = "my-example-rg"
  resource_group_location = "eastus"
  resource_group_tags = {
    Environment        = "test"
    Application        = "myapp"
    Owner              = "platform-team"
    CostCenter         = "ULS-12345"
    BusinessUnit       = "ENG"
    DataClassification = "internal"
    ManagedBy          = "terraform"
  }
}

