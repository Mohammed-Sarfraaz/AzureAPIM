terraform {
  backend "azurerm" {}
}

data "terraform_remote_state" "state" {
  backend = "azurerm"
  config {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "stgtfstate"
    container_name       = "contfstate"
    key                  = "apim.tfstate"
    use_oidc             = true
    tenant_id            = "${var.tenant_id}"
    subscription_id      = "${var.subscription_id}"
    client_id            = "${var.client_id}"
  }
}


variable "tenant_id" {
  type = string
}

variable "subscription_id" {
   type = string
}

variable "client_id" { 
   type = string
}

