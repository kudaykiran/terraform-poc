module "resource_group" {
  source              = "./../../../modules/resource-group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "networking" {
  source              = "./../../../modules/networking"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
}

module "acr" {
  source              = "./../../../modules/acr"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
}


module "appgw" {
  source              = "./../../../modules/appgw"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  subnet_id           = module.networking.appgw_subnet_id
}

module "aks" {
  source                       = "./../../../modules/aks"
  resource_group_name          = module.resource_group.resource_group_name
  location                     = var.location
  aks_subnet_id                = module.networking.aks_subnet_id
  log_analytics_workspace_id   = module.monitoring.log_analytics_workspace_id
  acr_id                       = module.acr.acr_id
}