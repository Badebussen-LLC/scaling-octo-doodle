# Felles variabler som kan brukes på tvers av prosjekter
# Dette er valgfritt - kan kopieres inn i prosjektene etter behov

variable "common_tags" {
  description = "Standard tags for alle ressurser i alle prosjekter"
  type        = map(string)
  default = {
    ManagedBy = "Terraform on behalf of Alexander Thuestad"
    Course    = "IaC-Fall-2025"
    Skole     = "TIPSIP Fagskole"
  }
}

variable "allowed_locations" {
  description = "Tillatte Azure regions"
  type        = list(string)
  default = [
    "norwayeast",
    "norwaywest",
    "westeurope",
    "northeurope"
  ]
}
