variable "rg_name" {
  description = "Resource Group name"
  type        = string
  default     = "rg-devops-learning"
}
variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "vnet_name" {
  description = "VNet name"
  type        = string
  default     = "vnet-week1"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "subnet-app"
}

variable "nsg" {
  description = "NSG name"
  type        = string
  default     = "nsg-app"
}

variable "nic_name" {
  description = "NIC name"
  type        = string
  default     = "nic-app"
}