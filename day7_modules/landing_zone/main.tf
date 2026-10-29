module "dev_rg" {
  source   = "./modules/resource-group"
  rg_name  = var.dev_rg_name
  location = var.dev_location
}

module "vnet" {
  depends_on          = [module.dev_rg]
  source              = "./modules/Virtual-network"
  vnet_name           = var.dev_vnet_name
  vnet_location       = module.dev_rg.location
  vnet_rg_name        = module.dev_rg.rg_name
  vnet_address_space  = var.dev_vnet_address_space
}
module "subnet" {
  depends_on          = [module.vnet]
  source              = "./modules/subnet"
  subnet_name         = var.dev_subnet_name
  subnet_address_prefix = var.dev_subnet_address_prefix
  vnet_name           = module.vnet.vnet_name
}

module "PIP" {
  depends_on          = [module.dev_rg]
  source              = "./modules/PIP"
  pip_rg_name         = module.dev_rg.rg_name
  pip_location        = module.dev_rg.location
}

module "app_nsg" {
  depends_on          = [module.dev_rg]
  source              = "./modules/nsg"
  nsg_name            = var.nsg_name
  nsg_rg_name         = module.dev_rg.rg_name
  nsg_location        = module.dev_rg.location
}