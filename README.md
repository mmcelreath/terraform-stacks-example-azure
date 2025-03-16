# Terraform-Stacks-Example-Azure
This is a simple demonstration of using Terraform Stacks to deploy resources to Azure based on the following examples:

- [alexsomesan/aks-deferred-stack](https://github.com/alexsomesan/aks-deferred-stack)
- [hashicorp-guides/azure-stacks-example](https://github.com/hashicorp-guides/azure-stacks-example)

## Prerquisites

- [HCP Terraform](https://www.hashicorp.com/products/terraform) Organization
- An existing HCP Terraform Project
- [Azure Subscription](https://azure.microsoft.com/en-us/pricing/purchase-options/azure-account) 

## Setup

The `_setup` directory contains the Terraform configuration files which will create the following resources:

### Azure
- `Azure Applicaton` and `Service Principal` named `terraform-stack-example-xxxx`
- `Contributor` Role Assignment for `Service Principal`
- `Federated Credentials` for plans and applies for each deploymenmt - ex. `terraform-stack-example-xxxx-dev-plan`

### HCP Terraform
- Demo `Stack` under existing Project
- Github VCS Provider

## Deploy Setup Resources

- Update `./_setup/terraform.tfvars`
  - Update `tfc_organization_name` and `tfc_project_name` to an existing Organization and Project in HCP Platform
  - Update `github_token` with a valid GitHub PAT token
  - Update `github_repo` with a valid GitHub Repository
- After setup, copy the `oidc_client_id` value from the Terraform Ouput and update the `client_id` input for each deployment under `./deployments.tfdeploy.hcl`
- Update `subscription_id` and `tenant_id` under `./deployments.tfdeploy.hcl`

## Deploy Stack Configuration

- Navigate to the deployed Stack in HCP Terraform and click `Fetch Configuration from VCS`

-TBD
