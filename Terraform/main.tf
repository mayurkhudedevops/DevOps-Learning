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

resource "azurerm_linux_web_app" "example" {
  name                = "test-asp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "East US"
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {}
}
