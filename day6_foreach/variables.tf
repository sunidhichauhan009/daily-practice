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

variable "subnet_name"{
  description = "Application subnets"
  type        = map(string)

  default = {
    frontend = "10.0.1.0/24"
    backend  = "10.0.2.0/24"
    database = "10.0.3.0/24"
  }
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