# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "dev" {
  inputs = {
    identity_token = identity_token.azurerm.jwt

    environment = "dev"

    client_id       = "71975bc3-1447-42bf-9415-f13200cf91fe"
    subscription_id = "4a2ff90e-c796-4555-acdb-1bff040071db"
    tenant_id       = "d3fdf2cb-8ef1-4940-8043-69170342d935"
  }
}

# deployment "qa" {
#   inputs = {
#     identity_token = identity_token.azurerm.jwt

#     environment = "qa"

#     client_id       = "71975bc3-1447-42bf-9415-f13200cf91fe"
#     subscription_id = "4a2ff90e-c796-4555-acdb-1bff040071db"
#     tenant_id       = "d3fdf2cb-8ef1-4940-8043-69170342d935"
#   }
# }

# deployment "prod" {
#   inputs = {
#     identity_token = identity_token.azurerm.jwt

#     environment = "prod"

#     client_id       = "71975bc3-1447-42bf-9415-f13200cf91fe"
#     subscription_id = "4a2ff90e-c796-4555-acdb-1bff040071db"
#     tenant_id       = "d3fdf2cb-8ef1-4940-8043-69170342d935"
#   }
# }

# deployment "stg" {
#   inputs = {
#     identity_token = identity_token.azurerm.jwt

#     environment = "stg"

#     client_id       = "71975bc3-1447-42bf-9415-f13200cf91fe"
#     subscription_id = "4a2ff90e-c796-4555-acdb-1bff040071db"
#     tenant_id       = "d3fdf2cb-8ef1-4940-8043-69170342d935"
#   }
# }