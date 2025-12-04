terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # VIKTIG: Dette lagrer state-filen i skyen, ikke lokalt.
  # Du må bytte ut verdiene her med din faktiske storage account.
  backend "azurerm" {
    resource_group_name  = "rg-tfbackend-alext" # Din state-RG
    storage_account_name = "sttfbackendalext"   # Din unike storage account
    container_name       = "tfstate"            # Navn på container
    key                  = "webapp.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-modulti-webapp-alext"
  location = "westeurope"
}

resource "azurerm_service_plan" "plan" {
  name                = "plan-prod-linux"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1" # Billig variant for lab
}

resource "azurerm_linux_web_app" "app" {
  name                = "app-prod-minunikeapp123" # Må være unikt
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      python_version = "3.9" # Eksempel stack
    }
  }

  tags = {
    environment = "Drift detection test"
    ManagedBy   = "Alexander Thuestad"
    owner       = "alexander.thuestad@tisipfagskole.no"
  }
}