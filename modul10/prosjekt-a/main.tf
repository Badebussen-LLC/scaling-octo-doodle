provider "azurerm" {
  features {}
}

# Ressursgruppen som "eier" lagringskontoen i dag
resource "azurerm_resource_group" "rg_projecta" {
  name     = "rg-mvprojecta-althu"
  location = "westeurope"
}

#Her er det tomt nå