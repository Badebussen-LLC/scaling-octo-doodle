# .tflint.hcl - Minimal konfigurasjon for å komme i gang
# Se Github repo for å sikre at en får med siste versjon: [TFLint Ruleset for terraform-provider-azurerm](https://github.com/terraform-linters/tflint-ruleset-azurerm)

plugin "azurerm" {
    enabled = true
    version = "0.30.0"
    source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

# Sjekk at variabelnavn følger snake_case (f.eks. storage_name, ikke storageName)
rule "terraform_naming_convention" {
  enabled = true
}

# Sjekk at alle variabler har en type (string, number, etc.)
rule "terraform_typed_variables" {
  enabled = true
}