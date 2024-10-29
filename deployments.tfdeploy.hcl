# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}



store "varset" "auth" {
  id = "varset-7vfyQC6UvKY7f6gM"
  category = "terraform"
}

deployment "dev" {
  inputs = {
    identity_token = identity_token.azurerm.jwt

    environment = "dev"

    client_id       = store.varset.auth.oidc_client_id
    subscription_id = store.varset.auth.subscription_id
    tenant_id       = store.varset.auth.tenant_id
  }
}

deployment "qa" {
  inputs = {
    identity_token = identity_token.azurerm.jwt

    environment = "qa"

    client_id       = store.varset.auth.oidc_client_id
    subscription_id = store.varset.auth.subscription_id
    tenant_id       = store.varset.auth.tenant_id
  }
}

deployment "prod" {
  inputs = {
    identity_token = identity_token.azurerm.jwt

    environment = "prod"

    client_id       = store.varset.auth.oidc_client_id
    subscription_id = store.varset.auth.subscription_id
    tenant_id       = store.varset.auth.tenant_id
  }
}

# deployment "stg" {
#   inputs = {
#     identity_token = identity_token.azurerm.jwt

#     environment = "stg"

#     client_id       = store.varset.auth.oidc_client_id
#     subscription_id = store.varset.auth.subscription_id
#     tenant_id       = store.varset.auth.tenant_id
#   }
# }