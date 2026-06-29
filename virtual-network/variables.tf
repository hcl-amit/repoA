variable "name" {
  description = "Virtual Network name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "address_space" {
  description = "Address space of the VNet"
  type        = list(string)
}

variable "dns_servers" {
  description = "Custom DNS Servers"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Resource Tags"
  type        = map(string)
  default     = {}
}