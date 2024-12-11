# Connect DevOps Pipeline - CodeBuild & CodePipeline for Dev Environment

This Terraform module sets up the necessary infrastructure for deploying a DevOps pipeline and AWS Connect resources. It leverages **CodeBuild** and **CodePipeline** to execute Terraform for deploying Connect infrastructure in the development environment.

## Features

- **CodePipeline**: Automates the deployment or modification of resources when code is pushed to the source control management (SCM) repository.
- **CodeBuild**: Executes Terraform commands in the respective AWS account to deploy resources.

## Prerequisites

Before using this module, ensure that:

- A `.tfvars` file is prepared with the required variable values.

## Usage

### 1. Source Repository

- By default, this module is designed for **CodeCommit**.
- If you opt for CodeCommit:
  - Add the required variables in your `.tfvars` file for seamless configuration.
  - Note that this module only creates the repository; you must manually push your Terraform code after the repository is created.

### 2. Validate Terraform

Validation actions will performed based on the buildspec file writen for the codebuild

- **AWS Account Access**: CodeBuild accesses the respective AWS account where resources will be deployed.
- **Terraform State Bucket**: Creates an S3 bucket for storing Terraform state files using the same approach as the pipeline setup.
- **Validation Process**:
  - Scripts from the `connect_setup` folder are used to create the S3 bucket.
  - Once the bucket is created, Terraform validation (`terraform validate`) and planning (`terraform plan`) are executed to ensure readiness for deployment.

### 3. Deploy Terraform

Deployment actions will performed based on the buildspec file writen for the codebuild

- After successful validation:
  - For **development** environment: Terraform automatically proceeds to the `apply` stage.

## Notes

- **Manual Steps**: Ensure that the variables in the `.tfvars` file are correctly aligned with your project requirements to avoid configuration issues.

## How to use:

- Add the following code to your main.tf file to fetch and deploy this module:

```bash
# --- Development Environment ----

# CodeBuild Project
module "codebuild_dev" {
  source = "./modules/dev/code_build_dev"

  codecommit_repo_name = var.codecommit_repo_name
  description          = var.dev_codebuild_description

  artifacts_type              = var.dev_codebuild_artifacts_type
  compute_type                = var.dev_codebuild_compute_type
  env_type                    = var.dev_codebuild_env_type
  image                       = var.dev_codebuild_image
  image_pull_credentials_type = var.dev_codebuild_image_pull_credentials_type

  source_type                     = var.source_repo_type
  dev_validate_buildspec_location = var.buildspec_dev_validate_location
  dev_apply_buildspec_location    = var.buildspec_dev_apply_location
  source_location                 = module.codecommit.codecommit_http_url
  source_version                  = var.dev_codebuild_source_branch

  depends_on = [module.codecommit]
}

# CodePipeline Pipeline
module "codepipeline_dev" {
  source = "./modules/dev/code_pipeline_dev"

  codecommit_repo_name    = var.codecommit_repo_name
  source_owner            = var.dev_codepipeline_source_owner
  source_provider         = var.dev_codepipeline_source_provider
  source_version          = var.dev_codepipeline_source_version
  source_output_artifacts = var.dev_codepipeline_source_output_artifacts
  source_branch_name      = var.dev_codepipeline_source_branch_name

  build_owner                 = var.dev_codepipeline_build_owner
  build_provider              = var.dev_codepipeline_build_provider
  build_input_artifacts       = var.dev_codepipeline_build_input_artifacts
  build_output_artifacts      = var.dev_codepipeline_build_output_artifacts
  build_version               = var.dev_codepipeline_build_version
  build_validate_project_name = module.codebuild_dev.code_build_1_dev_projectname
  build_apply_project_name    = module.codebuild_dev.code_build_2_dev_projectname

  depends_on = [module.codecommit, module.codebuild_dev]
}
```

- Replace the source path with the appropriate module location if necessary.
- Ensure the repository_name and description variables are defined in your .tfvars file or passed as inputs.
