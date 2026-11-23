module "dev_rg" {
  source   = "../modules/resource-group"
  rg_name  = var.dev_rg_name
  rg_location = var.dev_rg_location
}

module "vnet" {
  depends_on          = [module.dev_rg]
  source              = "../modules/Virtual-network"
  vnet_name           = var.dev_vnet_name
  vnet_location       = module.dev_rg.rg_location
  vnet_rg_name        = module.dev_rg.rg_name
  vnet_address_space  = var.dev_vnet_address_space
}
module "subnet" {
  depends_on          = [module.vnet]
  source              = "../modules/subnet"
  subnet_name         = var.dev_subnet_name
  subnet_address_prefixes = var.dev_subnet_address_prefix
  subnet_rg_name          = module.dev_rg.rg_name
  subnet_vnet_name           = module.vnet.vnet_name
}

module "PIP" {
  depends_on          = [module.dev_rg]
  source              = "../modules/PIP"
  pip_rg_name         = module.dev_rg.rg_name
  pip_location        = module.dev_rg.rg_location
}

module "app_nsg" {
  depends_on          = [module.dev_rg]
  source              = "../modules/nsg"
  nsg_name            = var.nsg_name
  nsg_rg_name         = module.dev_rg.rg_name
  nsg_location        = module.dev_rg.rg_location
  security_rules      = var.security_rules
}


# data "azurerm_subnet" "existing_subnet" {
#   name                 = "data-subnet"
#   virtual_network_name = module.vnet.vnet_name
#   resource_group_name  = module.dev_rg.rg_name
# }

# data "azurerm_public_ip" "existing_pip" {
#   name                = "data_pip"
#   resource_group_name = module.dev_rg.rg_name
# }

module "app_nic" {
  depends_on = [module.subnet, module.PIP]
  source       = "../modules/nic"
  nic_name     = "nic-app"
  nic_rg_name  = module.dev_rg.rg_name
  nic_location = module.dev_rg.rg_location
  subnet_id    = module.subnet.subnet_id
  public_ip_id = module.PIP.public_ip_id
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = module.app_nic.nic_id
  network_security_group_id = module.app_nsg.nsg_id
}

module "additional_resource_groups" {
  source   = "../modules/resource-group"
  for_each = var.additional_environments

  rg_name  = each.value.rg_name
  rg_location = each.value.location
}