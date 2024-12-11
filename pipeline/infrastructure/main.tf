provider "aws" {
  region = var.region
}

# CodeCommit repository
module "codecommit" {
  source = "./modules/code_commit"

  repository_name = var.codecommit_repo_name
  description     = var.codecommit_repo_description
}

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

# --- Production Environment ----

# CodeBuild Project
module "codebuild_prod" {
  source = "./modules/prod/code_build_prod"

  codecommit_repo_name = var.codecommit_repo_name
  description          = var.prod_codebuild_description

  artifacts_type              = var.prod_codebuild_artifacts_type
  compute_type                = var.prod_codebuild_compute_type
  env_type                    = var.prod_codebuild_env_type
  image                       = var.prod_codebuild_image
  image_pull_credentials_type = var.prod_codebuild_image_pull_credentials_type

  PROD_ASSUME_IAM_ROLE = var.PROD_ASSUME_IAM_ROLE

  source_type                      = var.source_repo_type
  prod_validate_buildspec_location = var.buildspec_prod_validate_location
  prod_apply_buildspec_location    = var.buildspec_prod_apply_location
  source_location                  = module.codecommit.codecommit_http_url
  source_version                   = var.prod_codebuild_source_branch

  depends_on = [module.codecommit]
}

# SNS Topic for the Prod Approval
module "sns_topic_prod" {
  source = "./modules/prod/sns_topic_prod_approval"

  codecommit_repo_name   = var.codecommit_repo_name
  approval_email_address = var.prod_approval_email_address

  depends_on = [module.codecommit, module.codebuild_prod]
}

# CodePipeline Pipeline
module "codepipeline_prod" {
  source = "./modules/prod/code_pipeline_prod"

  codecommit_repo_name    = var.codecommit_repo_name
  source_owner            = var.prod_codepipeline_source_owner
  source_provider         = var.prod_codepipeline_source_provider
  source_version          = var.prod_codepipeline_source_version
  source_output_artifacts = var.prod_codepipeline_source_output_artifacts
  source_branch_name      = var.prod_codepipeline_source_branch_name

  build_owner                 = var.prod_codepipeline_build_owner
  build_provider              = var.prod_codepipeline_build_provider
  build_input_artifacts       = var.prod_codepipeline_build_input_artifacts
  build_output_artifacts      = var.prod_codepipeline_build_output_artifacts
  build_version               = var.prod_codepipeline_build_version
  build_validate_project_name = module.codebuild_prod.code_build_1_prod_projectname
  build_apply_project_name    = module.codebuild_prod.code_build_2_prod_projectname

  region          = var.region
  approve_sns_arn = module.sns_topic_prod.prod_sns_topic_arn

  depends_on = [module.codecommit, module.sns_topic_prod, module.codebuild_prod]
}
