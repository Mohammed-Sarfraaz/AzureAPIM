resource "azurerm_resource_group" "rg" {
  name     = "mss-rg-apim"
  location = "eastus"
}

resource "azurerm_api_management" "apim" {
  name                = "mssapim2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = "Sarfraaz"
  publisher_email     = "sarfraaz-nov-24@outlook.com"
  sku_name            = "Developer_1"
}



# create API
resource "azurerm_api_management_api" "apiHealthProbe" {
name                = "health-probe"
resource_group_name = azurerm_resource_group.rg.name
api_management_name = azurerm_api_management.apim.name
revision            = "1"
display_name        = "Health probe"
path                = "health-probe"
protocols           = ["https"]

  subscription_key_parameter_names  {
    header = "AppKey"
    query = "AppKey"
  }

  import {
    content_format = "openapi"
    content_value  = file("${path.module}/apis/ping-api.yaml")
  }
}
