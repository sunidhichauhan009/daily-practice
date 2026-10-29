variable "dev_rg_name" {
  type    = string
  default = "rg-module-learning"
}

variable "dev_location" {
  type    = string
  default = "Central India"
}

variable "dev_vnet_name" {
  type    = string
  default = "vnet-module-learning"
}
variable "dev_vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "dev_subnet_name" {
  type    = string
  default = "subnet-module-learning"
}
variable "dev_subnet_address_prefix" {
  type    = string
  default = "10.0.1.0/24"
}

variable "nsg_name" {
  type    = string
  default = "nsg-module-learning"
}