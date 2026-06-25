terraform {
    cloud {
    organization = "HCLIT"

    workspaces {
      name = "bootstrap-state"
    }
  }
  required_version = ">= 1.5.0"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.66"
    }
  }
}
