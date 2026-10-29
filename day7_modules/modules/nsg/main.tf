resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.nsg_location
  resource_group_name = var.nsg_rg_name
}