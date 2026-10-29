variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "vnet-default"
}

variable "vnet_rg_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-default"
}

variable "vnet_location" {
  description = "The location of the virtual network"
  type        = string
  default     = "Central India"
}

variable "vnet_address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
