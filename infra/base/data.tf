data "vault_generic_secret" "shared_secret" {
  path = "https://api.cloud.hashicorp.com/secrets/2023-11-28/organizations/a1df8099-86f5-4508-aa08-cc6be8931a94/projects/2e6fc177-e2b4-4e4b-b84f-bde03945e36c/apps/Azure-Learning/secrets:open"
}

data "azurerm_resource_group" "azure-resource" {
  name = "rg-terraform-eastus"
}


portal.cloud.hashicorp.com/services/secrets/apps/Azure-Learning/secrets