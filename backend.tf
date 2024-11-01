terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "stgtfstate"
    container_name       = "contfstate"
    key                  = "apim.tfstate"
    tenant_id            = "35b74ca5-c625-4346-9761-e208d0467290"
    subscription_id = "7809a880-b293-43cb-91e4-8f08b04e1c09"
  }
}