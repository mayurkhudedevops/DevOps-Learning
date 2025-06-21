provider "azurerm" {
  tenant_id       = data.vault_generic_secret.shared_secret.data["ARM_TENANT_ID"]
  subscription_id = data.vault_generic_secret.shared_secret.data["ARM_SUBSCRIPTION_ID"]
  client_id       = data.vault_generic_secret.shared_secret.data["ARM_CLIENT_ID"]
  client_secret   = data.vault_generic_secret.shared_secret.data["ARM_CLIENT_SECRET"]

  storage_use_azuread        = true
  skip_provider_registration = "true"
  features {
  }
}

provider "vault" {
  skip_child_token = true
}

