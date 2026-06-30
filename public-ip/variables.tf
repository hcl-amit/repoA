variable "public_ip_name" {
  description = "The name of the public IP"
  type        = string
}

variable "public_ip_resource_group_name" {
  description = "The resource group in which to create the public IP"
  type        = string
}

variable "public_ip_location" {
  description = "The Azure region in which to create the public IP"
  type        = string
}

variable "public_ip_allocation_method" {
  description = "The allocation method for the public IP (Static or Dynamic)"
  type        = string
  default     = "Static"

  validation {
    condition     = contains(["Static", "Dynamic"], var.public_ip_allocation_method)
    error_message = "Allocation method must be Static or Dynamic."
  }
}

variable "public_ip_sku" {
  description = "The SKU of the public IP (Basic or Standard)"
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard"], var.public_ip_sku)
    error_message = "SKU must be Basic or Standard."
  }
}

variable "public_ip_zones" {
  description = "Availability zones for the public IP"
  type        = list(string)
  default     = []
}

variable "public_ip_tags" {
  description = "Tags to assign to the public IP"
  type        = map(string)
  default     = {}
}
