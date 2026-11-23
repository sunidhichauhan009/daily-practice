variable "additional_environments" {
  type = map(object({
    rg_name  = string
    location = string
  }))
}

variable "dev_rg_name" {
  type    = string
  default = "rg-module-learning"
}

variable "dev_rg_location" {
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
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "nsg_name" {
  type    = string
  default = "nsg-module-learning"
}

variable "security_rules" {
  type = map(object({
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}