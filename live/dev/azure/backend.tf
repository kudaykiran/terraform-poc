terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "uktfstatesa"
    container_name       = "tfstate"
    key                  = "dev/azure/terraform.tfstate"
  }
}