# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
}

data "azuread_client_config" "current" {
}

# Data source used to get the current subscription's ID.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription
data "azurerm_subscription" "current" {
}

# Creates an application registration within Azure Active Directory.
#
# https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application
resource "azuread_application" "tfc_application" {
  display_name = "terraform-stack-example-${random_string.demo.result}"
  owners       = [data.azuread_client_config.current.object_id]
}

# Creates a service principal associated with the previously created
# application registration.
#
# https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal
resource "azuread_service_principal" "tfc_service_principal" {
  client_id = azuread_application.tfc_application.client_id
  owners    = [data.azuread_client_config.current.object_id]
}

# Creates a role assignment which controls the permissions the service
# principal has within the Azure subscription.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment
resource "azurerm_role_assignment" "tfc_role_assignment" {
  scope                = data.azurerm_subscription.current.id
  principal_id         = azuread_service_principal.tfc_service_principal.object_id
  role_definition_name = "Contributor"
}

# Creates a federated identity credential which ensures that the given
# workspace will be able to authenticate to Azure for the "plan" run phase.
#
# https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_federated_identity_credential
resource "azuread_application_federated_identity_credential" "tfc_federated_credential_plan" {
  for_each = toset(var.tfc_stack_deployments)

  application_id = azuread_application.tfc_application.id
  display_name   = "${azuread_application.tfc_application.display_name}-${each.key}-plan"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://${var.tfc_hostname}"
  subject        = "organization:${var.tfc_organization_name}:project:${var.tfc_project_name}:stack:${var.tfc_stack_name}:deployment:${each.value}:operation:plan"
}

# Creates a federated identity credential which ensures that the given
# workspace will be able to authenticate to Azure for the "apply" run phase.
#
# https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_federated_identity_credential
resource "azuread_application_federated_identity_credential" "tfc_federated_credential_apply" {
  for_each = toset(var.tfc_stack_deployments)

  application_id = azuread_application.tfc_application.id
  display_name   = "${azuread_application.tfc_application.display_name}-${each.key}-apply"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://${var.tfc_hostname}"
  subject        = "organization:${var.tfc_organization_name}:project:${var.tfc_project_name}:stack:${var.tfc_stack_name}:deployment:${each.value}:operation:apply"
}
