variable "environment" {
  description = "Environment name (dev, test, prod)"
  type        = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be dev, test, or prod."
  }
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "norwayeast"
}

variable "project_name" {
  description = "Project name used in resource naming"
  type        = string
  default     = "cicddemoalext"
}

variable "account_tier" {
  description = "Default Account Tier"
  type        = string
  default     = "Standard"
}

variable "account_replication" {
  description = "Default Account Replication Type"
  type        = string
  default     = "LRS"
}