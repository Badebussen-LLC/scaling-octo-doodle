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
  default     = "cicddemoalth"
}

variable "sa_name" {
  description = "Name for storage account"
  type        = string
  default     = "sacicddemo"

}

variable "account_tier" {
  description = "Account tier value"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Default type of replication"
  type        = string
  default     = "LRS"

}