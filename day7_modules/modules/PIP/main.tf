resource "azurerm_public_ip" "PIP" {
  name                = "publicIP"
  resource_group_name = var.pip_rg_name
  location            = var.pip_location
  allocation_method   = "Static"
}