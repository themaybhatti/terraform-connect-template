# Connect DevOps Pipeline - CodeBuild & CodePipeline for Stage Environment

This Terraform module sets up the necessary infrastructure for deploying a DevOps pipeline and AWS Connect resources. It leverages **CodeBuild** and **CodePipeline** to execute Terraform for deploying Connect infrastructure in the production environment.

## Features

- **CodePipeline**: Automates the deployment or modification of resources when code is pushed to the source control management (SCM) repository.
- **CodeBuild**: Executes Terraform commands in the respective AWS account to deploy resources.
- **Approval Process**: Sends SNS notifications for manual approval before deployment in stage.

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

Validation actions are performed based on the buildspec file written for CodeBuild.

- **AWS Account Access**: CodeBuild accesses the respective AWS account where resources will be deployed.
- **Terraform State Bucket**: Creates an S3 bucket for storing Terraform state files using the same approach as the pipeline setup.
- **Validation Process**:
  - Scripts from the `connect_setup` folder are used to create the S3 bucket.
  - Once the bucket is created, Terraform validation (`terraform validate`) and planning (`terraform plan`) are executed to ensure readiness for deployment.

### 3. Approval

- After successful validation for the **staging** environment:
  - **Approval Notification**: CodePipeline sends an SNS notification to designated approvers or leadership for approval of the request.
  - The pipeline proceeds only if the approver accepts the changes.

### 4. Deploy Terraform

Deployment actions are performed based on the buildspec file written for CodeBuild.

- After successful approval:
  - For **Stage** environment: Terraform proceeds to the `apply` stage.

## Notes

- **Manual Steps**: Ensure that the variables in the `.tfvars` file are correctly aligned with your project requirements to avoid configuration issues.

## How to Use

Add the following code to your `main.tf` file to fetch and deploy this module:

```bash
# --- Staging Environment ----

# CodeBuild Project
module "codebuild_stage" {
  source = "./modules/stage/code_build_stage"

  codecommit_repo_name = var.codecommit_repo_name
  description          = var.stage_codebuild_description

  artifacts_type              = var.stage_codebuild_artifacts_type
  compute_type                = var.stage_codebuild_compute_type
  env_type                    = var.stage_codebuild_env_type
  image                       = var.stage_codebuild_image
  image_pull_credentials_type = var.stage_codebuild_image_pull_credentials_type

  STAGE_ASSUME_IAM_ROLE = var.STAGE_ASSUME_IAM_ROLE

  source_type                       = var.source_repo_type
  stage_validate_buildspec_location = var.buildspec_stage_validate_location
  stage_apply_buildspec_location    = var.buildspec_stage_apply_location
  source_location                   = module.codecommit.codecommit_http_url
  source_version                    = var.stage_codebuild_source_branch

  depends_on = [module.codecommit]
}

# SNS Topic for the Stage Approval
module "sns_topic_stage" {
  source = "./modules/stage/sns_topic_stage_approval"

  codecommit_repo_name   = var.codecommit_repo_name
  approval_email_address = var.stage_approval_email_address

  depends_on = [module.codecommit, module.codebuild_stage]
}

# CodePipeline Pipeline
module "codepipeline_stage" {
  source = "./modules/stage/code_pipeline_stage"

  codecommit_repo_name    = var.codecommit_repo_name
  source_owner            = var.stage_codepipeline_source_owner
  source_provider         = var.stage_codepipeline_source_provider
  source_version          = var.stage_codepipeline_source_version
  source_output_artifacts = var.stage_codepipeline_source_output_artifacts
  source_branch_name      = var.stage_codepipeline_source_branch_name

  build_owner                 = var.stage_codepipeline_build_owner
  build_provider              = var.stage_codepipeline_build_provider
  build_input_artifacts       = var.stage_codepipeline_build_input_artifacts
  build_output_artifacts      = var.stage_codepipeline_build_output_artifacts
  build_version               = var.stage_codepipeline_build_version
  build_validate_project_name = module.codebuild_stage.code_build_1_stage_projectname
  build_apply_project_name    = module.codebuild_stage.code_build_2_stage_projectname

  region          = var.region
  approve_sns_arn = module.sns_topic_stage.stage_sns_topic_arn

  depends_on = [module.codecommit, module.sns_topic_stage, module.codebuild_stage]
}

```

- Replace the source path with the appropriate module location if necessary.
- Ensure the repository_name and description variables are defined in your .tfvars file or passed as inputs.
