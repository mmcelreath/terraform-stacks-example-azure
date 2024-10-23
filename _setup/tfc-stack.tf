# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# provider "tfe" {
#   hostname = var.tfc_hostname
# }

# # Data source used to grab the org and project under which a stack will be created.
# #
# # https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/project
# data "tfe_project" "stacks-proj" {
#   name         = var.tfc_project_name
#   organization = var.tfc_organization_name
# }

# data "tfe_organization" "stacks-org" {
#   name = var.tfc_organization_name
# }

# resource "tfe_oauth_client" "demo" {
#   organization     = var.tfc_organization_name
#   api_url          = "https://api.github.com"
#   http_url         = "https://github.com"
#   oauth_token      = var.github_token
#   service_provider = "github"
# }

# Generates a random suffix for the Stack's name for easier usage in parallel
#

resource "random_string" "demo" {
  length = 4
  special = false
  upper = false
}

locals {
  stack_name = "${var.tfc_stack_name}-${random_string.demo.result}"
}

# # Runs in this stack will be automatically authenticated
# # to AWS with the permissions set in the AWS policy.
# #
# # https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/stack

# resource "tfe_stack" "demo" {
#   name = local.stack_name
#   project_id = data.tfe_project.stacks-proj.id

#   vcs_repo {
#     branch         = "main"
#     identifier     = "alexsomesan/aks-deferred-stack"
#     oauth_token_id = tfe_oauth_client.demo.oauth_token_id
#   }

# }
