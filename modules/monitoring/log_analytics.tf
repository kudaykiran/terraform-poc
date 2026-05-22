resource "azurerm_log_analytics_workspace" "law" {
  name                = "aks-law"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
}