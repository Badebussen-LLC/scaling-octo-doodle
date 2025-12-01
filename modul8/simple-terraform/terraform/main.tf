# Random suffix for unique naming
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location

  tags = {
    Environment = var.environment
    ManagedBy   = "Alexander Thuestad"
    Project     = var.project_name
    owner       = "alexander.thuestad@tisipfagskole.no"
  }
}

# Storage Account
resource "azurerm_storage_account" "main" {
  name                = "st${var.project_name}${var.environment}${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  account_tier             = var.account_tier
  account_replication_type = var.account_replication

  min_tls_version = "TLS1_2"

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Storage Container
resource "azurerm_storage_container" "demo" {
  name                  = "demo-data"
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "private"
}