variable "nic_name" {
  type = string
}

variable "nic_location" {
  type = string
}

variable "nic_rg_name" {
  type = string
}

variable "nic_subnet_id" {
  type = string
}

variable "nic_public_ip_id" {
  type    = string
  default = null
}