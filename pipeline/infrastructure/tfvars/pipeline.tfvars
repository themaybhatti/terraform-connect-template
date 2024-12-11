# ------- AWS Account Variables --------
region = "us-east-1"

# ------- CodeCommit Variables --------
codecommit_repo_name        = "final-connect-testing"
codecommit_repo_description = "Repository"

# ------- Dev - CodeBuild Variables --------
source_repo_type                = "CODECOMMIT"
buildspec_dev_validate_location = "pipeline/buildspec_files/buildspec-dev-validate.yml"
buildspec_dev_apply_location    = "pipeline/buildspec_files/buildspec-dev-apply.yml"

dev_codebuild_description                 = "Dev environment codebuild project"
dev_codebuild_artifacts_type              = "NO_ARTIFACTS"
dev_codebuild_compute_type                = "BUILD_GENERAL1_SMALL"
dev_codebuild_env_type                    = "LINUX_CONTAINER"
dev_codebuild_image                       = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
dev_codebuild_image_pull_credentials_type = "CODEBUILD"
dev_codebuild_source_branch               = "dev"

# ------- Dev - CodePipeline Variables --------
dev_codepipeline_source_owner            = "AWS"
dev_codepipeline_source_provider         = "CodeCommit"
dev_codepipeline_source_version          = "1"
dev_codepipeline_source_output_artifacts = ["source_output"]
dev_codepipeline_source_branch_name      = "dev"

dev_codepipeline_build_owner            = "AWS"
dev_codepipeline_build_provider         = "CodeBuild"
dev_codepipeline_build_input_artifacts  = ["source_output"]
dev_codepipeline_build_output_artifacts = ["build_validate_output", "build_apply_output"]
dev_codepipeline_build_version          = "1"

# ------- stage - CodeBuild Variables --------
buildspec_stage_validate_location = "pipeline/buildspec_files/buildspec-stage-validate.yml"
buildspec_stage_apply_location    = "pipeline/buildspec_files/buildspec-stage-apply.yml"

stage_codebuild_description                 = "stage environment codebuild project"
stage_codebuild_artifacts_type              = "NO_ARTIFACTS"
stage_codebuild_compute_type                = "BUILD_GENERAL1_SMALL"
stage_codebuild_env_type                    = "LINUX_CONTAINER"
stage_codebuild_image                       = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
stage_codebuild_image_pull_credentials_type = "CODEBUILD"

STAGE_ASSUME_IAM_ROLE = "arn:aws:iam::725730220861:role/admin_role_for_blue_connect"


stage_codebuild_source_branch = "stage"

# ------- stage - SNS topic --------
stage_approval_email_address = "mayur.bhatti@scalecapacity.com"

# ------- stage - CodePipeline Variables --------
stage_codepipeline_source_owner            = "AWS"
stage_codepipeline_source_provider         = "CodeCommit"
stage_codepipeline_source_version          = "1"
stage_codepipeline_source_output_artifacts = ["source_output"]
stage_codepipeline_source_branch_name      = "stage"

stage_codepipeline_build_owner            = "AWS"
stage_codepipeline_build_provider         = "CodeBuild"
stage_codepipeline_build_input_artifacts  = ["source_output"]
stage_codepipeline_build_output_artifacts = ["build_validate_output", "build_apply_output"]
stage_codepipeline_build_version          = "1"

# ------- prod - CodeBuild Variables --------
buildspec_prod_validate_location = "pipeline/buildspec_files/buildspec-prod-validate.yml"
buildspec_prod_apply_location    = "pipeline/buildspec_files/buildspec-prod-apply.yml"

prod_codebuild_description                 = "prod environment codebuild project"
prod_codebuild_artifacts_type              = "NO_ARTIFACTS"
prod_codebuild_compute_type                = "BUILD_GENERAL1_SMALL"
prod_codebuild_env_type                    = "LINUX_CONTAINER"
prod_codebuild_image                       = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
prod_codebuild_image_pull_credentials_type = "CODEBUILD"

PROD_ASSUME_IAM_ROLE = "arn:aws:iam::725730220861:role/admin_role_for_blue_connect"

prod_codebuild_source_branch = "prod"

# ------- prod - SNS topic --------
prod_approval_email_address = "mayur.bhatti@scalecapacity.com"

# ------- prod - CodePipeline Variables --------
prod_codepipeline_source_owner            = "AWS"
prod_codepipeline_source_provider         = "CodeCommit"
prod_codepipeline_source_version          = "1"
prod_codepipeline_source_output_artifacts = ["source_output"]
prod_codepipeline_source_branch_name      = "prod"

prod_codepipeline_build_owner            = "AWS"
prod_codepipeline_build_provider         = "CodeBuild"
prod_codepipeline_build_input_artifacts  = ["source_output"]
prod_codepipeline_build_output_artifacts = ["build_validate_output", "build_apply_output"]
prod_codepipeline_build_version          = "1"
