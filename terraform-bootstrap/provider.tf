terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.65"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
  token    = var.tfe_token
}