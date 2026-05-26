provider "azurerm" {
  features {}

  resource_provider_registrations = "none"
}

provider "aws" {
  region = var.aws_region
}