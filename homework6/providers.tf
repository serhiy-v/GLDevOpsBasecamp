terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "aws" {
  region     = var.aws-region
  #Paste your credentials here
  access_key = ""
  secret_key = ""
}

provider "azurerm" {
  features {}
  #Paste your credentials here
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
}