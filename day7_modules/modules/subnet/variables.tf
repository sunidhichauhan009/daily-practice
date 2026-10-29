variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "subnet-default"
}

variable "subnet_rg_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-default"
}

variable "subnet_vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "vnet-default"
}

variable "subnet_address_prefixes" {
  description = "The address prefixes of the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}
