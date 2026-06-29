variable "virtual_network_name" {
  type        = string
  description = "Enter the name of virtual network"
}
variable "virtual_network_resource_group_name" {
  type        = string
  description = "Enter the resource group where virtual network needs to be deployed"
}
variable "virtual_network_location" {
  type        = string
  description = "Enter the location where virtual network needs to be deployed"
}
variable "virtual_network_address_space" {
  type        = list(string)
  description = "Enter the address space of virtual network."
  validation {
    condition     = alltrue([for cidr in var.virtual_network_address_space : can(regex("^((25[0-4]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-4]|2[0-4][0-9]|[01]?[0-9][0-9]?)/([8-9]|1[0-9]|2[0-9]|3[0-2])$", cidr))])
    error_message = "Each address space must be in CIDR notation with valid IP ranges (0-254) and subnet mask (8-32) (e.g., 192.168.0.0/16)."
  }
}

variable "virtual_network_dns_servers" {
  type        = list(string)
  default     = []
  description = "Enter the DNS Servers IPs for virtual network."
  validation {
    condition     = alltrue([for ip in var.virtual_network_dns_servers : can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", ip))])
    error_message = "Each DNS server IP must be a valid IPv4 address (e.g., 10.0.0.4)."
  }
}

variable "virtual_network_tags" {
  type        = map(string)
  default     = {}
  description = "Enter the tags for the virtual network"
}
variable "ddos_protection_plan_id" {
  type        = string
  default     = null
  description = "Enter the ID of DDOS protection plan"
}
variable "ddos_protection_enable" {
  type        = bool
  default     = false
  description = "Controls if DDOS protection plan to be enabled. Defaults to false"
}
