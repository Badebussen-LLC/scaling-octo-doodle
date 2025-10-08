terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.40.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "fd-rg" {
  name     = "var.rgname"
  location = "var.location"
  tags = {
    costcenter  = "123EXPENSES456"
    environment = "dev-rg-demoenv-01"
    owner       = "alexander.thuestad@tisipfagskole.no"
    project     = "testdev-project-01"
  }
}

variable "rgname" {
  description = "Name of Resource Group"
  type        = string

}

variable "location" {
  description = "Default Location for Azure Resources"
  type        = string
}