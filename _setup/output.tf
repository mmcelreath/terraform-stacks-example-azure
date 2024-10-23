# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# output "stack_name" {
#   description = "Name of newly created Stack."
#   value = tfe_stack.demo.name
# }

output "subscription_id" {
  description = "Value for `subscription_id` attribute of `azurearm` provider config in the Stack."
  value       = data.azurerm_subscription.current.subscription_id
}

output "tenant_id" {
  description = "Value for `tenant_id` attribute of `azurearm` provider config in the Stack."
  value       = data.azurerm_subscription.current.tenant_id
}

output "oidc_client_id" {
  description = "Value for `client_id` attribute of `azurearm` provider config in the Stack."
  value       = azuread_service_principal.tfc_service_principal.client_id
}

# output "credentials_apply" {
#   description = "Credentials to authenticate to Azure for the `apply` run phase."
#   value       = azuread_application_federated_identity_credential.tfc_federated_credential_apply[*]
# }

# output "credentials_plan" {
#   description = "Credentials to authenticate to Azure for the `plan` run phase."
#   value       = azuread_application_federated_identity_credential.tfc_federated_credential_apply[*]
# }
