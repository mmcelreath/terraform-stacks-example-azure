# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "tfc_audience" {
  type        = string
  default     = "api://AzureADTokenExchange"
  description = "The audience value to use in run identity tokens"
}

variable "tfc_hostname" {
  type        = string
  default     = "app.terraform.io"
  description = "The hostname of the TFC or TFE instance you'd like to use with AWS"
}

variable "tfc_organization_name" {
  type        = string
  description = "The name of your Terraform Cloud organization"
}

variable "tfc_project_name" {
  type        = string
  description = "The project under which a stack will be created"
}

variable "tfc_stack_name" {
  type        = string
  description = "The name of the stack to create"
  default     = "azure-stacks-demo"
}

variable "tfc_stack_deployments" {
  type        = list(string)
  description = "Name of the stack deployment"
  # default = ["dev", "qa", "prod"]  
}

variable "github_repo" {
  type = string
  description = "GitHub Repository where your Stack configuration is located."
}

variable "github_token" {
  type      = string
  sensitive = true
}
