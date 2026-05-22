module "network" {
  source = "../../../modules/network"
  name   = "azure-dev-vnet"
  cidr   = "10.1.0.0/16"
}

resource "azurerm_resource_group" "rg" {
  name     = "dev-rg"
  location = "Central India"
}

resource "azurerm_storage_account" "storage" {
  name                     = "devstorageacct123"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}