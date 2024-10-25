# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "dev" {
  inputs = {
    identity_token = identity_token.azurerm.jwt

    environment = "dev"

    client_id       = "<OIDC_CLIENT_ID>"
    subscription_id = "<SUBSCRIPTION_ID>"
    tenant_id       = "<TENANT_ID>"
  }
}

deployment "qa" {
  inputs = {
    identity_token = identity_token.azurerm.jwt

    environment = "qa"

    client_id       = "<OIDC_CLIENT_ID>"
    subscription_id = "<SUBSCRIPTION_ID>"
    tenant_id       = "<TENANT_ID>"
  }
}

deployment "prod" {
  inputs = {
    identity_token = identity_token.azurerm.jwt

    environment = "prod"

    client_id       = "<OIDC_CLIENT_ID>"
    subscription_id = "<SUBSCRIPTION_ID>"
    tenant_id       = "<TENANT_ID>"
  }
}

# deployment "stg" {
#   inputs = {
#     identity_token = identity_token.azurerm.jwt

#     environment = "stg"

#     client_id       = "<OIDC_CLIENT_ID>"
#     subscription_id = "<SUBSCRIPTION_ID>"
#     tenant_id       = "<TENANT_ID>"
#   }
# }