variable "nsg_name" {
  type = string
}

variable "nsg_location" {
  type = string
}

variable "nsg_rg_name" {
  type = string
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