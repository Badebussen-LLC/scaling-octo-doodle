terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.40.0"
    }
  }
  backend "azurerm" {
  }
}


provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "fd-rg" {
  name     = "dev-${var.rg_name}-014"
  location = var.location
  tags = {
    costcenter  = "123EXPENSES456"
    environment = "dev-demoenv-14"
    owner       = "alexander.thuestad@tisipfagskole.no"
  }
}

resource "azurerm_storage_account" "sa-wf" {
  name = var.saname
  resource_group_name = azurerm_resource_group.fd-rg.name
  location = azurerm_resource_group.fd-rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}

variable "rg_name" {
  description = "Name of Resource Group"
  type        = string

}

variable "location" {
  description = "Default Location for Azure Resources"
  type        = string
}

variable "saname" {
  description = "Name of Storage Account"
  type = string
  default = "saautowfdevalx0011110011"
  
}