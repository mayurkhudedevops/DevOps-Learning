provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-webapp-demo"
  location = "East US"
}

resource "azurerm_app_service_plan" "asp" {
  name                = "appserviceplan-demo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "test-asp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "East US"
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    linux_fx_version = "PYTHON|3.10"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "WEBSITE_RUN_FROM_PACKAGE"            = "1"
  }

  https_only = true
}

resource "random_id" "random" {
  byte_length = 4
}
