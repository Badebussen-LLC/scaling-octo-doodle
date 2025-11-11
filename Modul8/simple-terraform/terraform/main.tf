# Random suffix for unique naming
resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location

  tags = local.tags
}

# Storage Account
resource "azurerm_storage_account" "main" {
  name                = "st${var.project_name}${var.environment}${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  account_tier             = "Premium"
  account_replication_type = "LRS"

  min_tls_version = "TLS1_2"

  tags = local.tags
}

# Storage Container
resource "azurerm_storage_container" "demo" {
  name                  = "alethu-${var.sa_name}"
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "private"
}
