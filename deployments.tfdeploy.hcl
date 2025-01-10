# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}



store "varset" "auth" {
  id = "varset-r4wTcXK78YJ3yg9q"
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

orchestrate "auto_approve" "safe_plans_dev" {
  check {
      # Only auto-approve in the development environment if no resources are being removed
      condition = context.plan.changes.remove == 0 && context.plan.deployment == deployment.dev
      reason = "Plan has ${context.plan.changes.remove} resources to be removed."
  }
}