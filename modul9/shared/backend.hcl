resource_group_name  = "rg-tfbackend-alext"
storage_account_name = "sttfbackendalext"
container_name       = "tfstate"
use_azuread_auth     = true
use_cli              = true
key                  = "modul9/default/terraform.tfstate"

#Autentisering via Service Principal (federated credentials)
#use_oidc             = true
