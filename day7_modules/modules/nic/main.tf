resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.nic_location
  resource_group_name = var.nic_rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_id
  }
}