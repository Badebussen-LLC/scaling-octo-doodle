provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

}

terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}


# Mottaker-gruppen
resource "azurerm_resource_group" "rg_projectb" {
  name     = "rg-mvprojectb-althu"
  location = "westeurope"
}

# Dette er ressursen du skal flytte til Prosjekt B senere
resource "azurerm_storage_account" "saprojecta" {
  name                     = "saunique113althu" # VIKTIG: Endre dette til noe helt unikt!
  resource_group_name      = azurerm_resource_group.rg_projectb.name
  location                 = azurerm_resource_group.rg_projectb.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Prosjekt A"
    ManagedBy   = "Alexander Thuestad"
    owner       = "alexander.thuestad@tisipfagskole.no"
  }

  min_tls_version = "TLS1_2"
}