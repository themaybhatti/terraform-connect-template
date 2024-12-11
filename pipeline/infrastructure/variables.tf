variable "region" {
  type        = string
  description = "AWS Region"
}

# --------- CodeCommit variables ---------

variable "codecommit_repo_name" {
  type        = string
  description = "Name of the CodeCommit repository"
}

variable "codecommit_repo_description" {
  type        = string
  description = "Description of the CodeCommit repository"
}

# --------- Dev - CodeBuild variables ---------

variable "source_repo_type" {
  type        = string
  description = "Source Type in CodeBuild Project"
}

variable "buildspec_dev_validate_location" {
  type        = string
  description = "Buildspec Location of the dev validate in CodeBuild Project"
}

variable "buildspec_dev_apply_location" {
  type        = string
  description = "Buildspec Location of the dev apply in CodeBuild Project"
}

variable "dev_codebuild_description" {
  type        = string
  description = "Specifies the description of the CodeBuild"
}

variable "dev_codebuild_artifacts_type" {
  type        = string
  description = "Artifacts Type in CodeBuild Project"
}

variable "dev_codebuild_compute_type" {
  type        = string
  description = "Compute Type in CodeBuild Project"
}

variable "dev_codebuild_env_type" {
  type        = string
  description = "Environment Type in CodeBuild Project"
}

variable "dev_codebuild_image" {
  type        = string
  description = "Compute Images used in project to execute the commands"
}

variable "dev_codebuild_image_pull_credentials_type" {
  type        = string
  description = "Credentials Type in CodeBuild Project"
}

variable "dev_codebuild_source_branch" {
  type        = string
  description = "Branch of the source code"
}

# --------- Dev - CodePipeline variables ---------

variable "dev_codepipeline_source_owner" {
  type        = string
  description = "Source owner for the dev codepipeline"
}

variable "dev_codepipeline_source_provider" {
  type        = string
  description = "Source provider for the dev codepipeline"
}

variable "dev_codepipeline_source_version" {
  type        = string
  description = "Source version for the dev codepipeline"
}

variable "dev_codepipeline_source_output_artifacts" {
  type        = list(string)
  description = "Source output artifacts for the dev codepipeline"
}

variable "dev_codepipeline_source_branch_name" {
  type        = string
  description = "Source branch name for the dev codepipeline"
}

variable "dev_codepipeline_build_owner" {
  type        = string
  description = "build owner for the dev codepipeline"
}

variable "dev_codepipeline_build_provider" {
  type        = string
  description = "Build provider for the dev codepipeline"
}

variable "dev_codepipeline_build_input_artifacts" {
  type        = list(string)
  description = "Build input artifacts for the dev codepipeline"
}

variable "dev_codepipeline_build_output_artifacts" {
  type        = list(string)
  description = "Build output artifacts for the dev codepipeline"
}

variable "dev_codepipeline_build_version" {
  type        = string
  description = "Build version for the dev codepipeline"
}

# --------- stage - CodeBuild variables ---------

variable "buildspec_stage_validate_location" {
  type        = string
  description = "Buildspec location of the stage validate in CodeBuild Project"
}

variable "buildspec_stage_apply_location" {
  type        = string
  description = "Buildspec location of the stage apply in CodeBuild Project"
}

variable "stage_codebuild_description" {
  type        = string
  description = "Specifies the description of the CodeBuild"
}

variable "stage_codebuild_artifacts_type" {
  type        = string
  description = "Artifacts Type in CodeBuild Project"
}

variable "stage_codebuild_compute_type" {
  type        = string
  description = "Compute Type in CodeBuild Project"
}

variable "stage_codebuild_env_type" {
  type        = string
  description = "Environment Type in CodeBuild Project"
}

variable "stage_codebuild_image" {
  type        = string
  description = "Compute Images used in project to execute the commands"
}

variable "stage_codebuild_image_pull_credentials_type" {
  type        = string
  description = "Credentials Type in CodeBuild Project"
}

variable "STAGE_ASSUME_IAM_ROLE" {
  type        = string
  description = "STAGE AWS account assume IAM role"
}

variable "stage_codebuild_source_branch" {
  type        = string
  description = "Branch of the source code"
}

# --------- stage - SNS Topic ---------
variable "stage_approval_email_address" {
  type        = string
  description = "Email address of stage branch approver"
}

# --------- stage - CodePipeline variables ---------

variable "stage_codepipeline_source_owner" {
  type        = string
  description = "Source owner for the stage codepipeline"
}

variable "stage_codepipeline_source_provider" {
  type        = string
  description = "Source provider for the stage codepipeline"
}

variable "stage_codepipeline_source_version" {
  type        = string
  description = "Source version for the stage codepipeline"
}

variable "stage_codepipeline_source_output_artifacts" {
  type        = list(string)
  description = "Source output artifacts for the stage codepipeline"
}

variable "stage_codepipeline_source_branch_name" {
  type        = string
  description = "Source branch name for the stage codepipeline"
}

variable "stage_codepipeline_build_owner" {
  type        = string
  description = "build owner for the stage codepipeline"
}

variable "stage_codepipeline_build_provider" {
  type        = string
  description = "Build provider for the stage codepipeline"
}

variable "stage_codepipeline_build_input_artifacts" {
  type        = list(string)
  description = "Build input artifacts for the stage codepipeline"
}

variable "stage_codepipeline_build_output_artifacts" {
  type        = list(string)
  description = "Build output artifacts for the stage codepipeline"
}

variable "stage_codepipeline_build_version" {
  type        = string
  description = "Build version for the stage codepipeline"
}

# --------- prod - CodeBuild variables ---------

variable "buildspec_prod_validate_location" {
  type        = string
  description = "Buildspec Location of the prod validate in CodeBuild Project"
}

variable "buildspec_prod_apply_location" {
  type        = string
  description = "Buildspec Location of the prod apply in CodeBuild Project"
}

variable "prod_codebuild_description" {
  type        = string
  description = "Specifies the description of the CodeBuild"
}

variable "prod_codebuild_artifacts_type" {
  type        = string
  description = "Artifacts Type in CodeBuild Project"
}

variable "prod_codebuild_compute_type" {
  type        = string
  description = "Compute Type in CodeBuild Project"
}

variable "prod_codebuild_env_type" {
  type        = string
  description = "Environment Type in CodeBuild Project"
}

variable "prod_codebuild_image" {
  type        = string
  description = "Compute Images used in project to execute the commands"
}

variable "prod_codebuild_image_pull_credentials_type" {
  type        = string
  description = "Credentials Type in CodeBuild Project"
}

variable "PROD_ASSUME_IAM_ROLE" {
  type        = string
  description = "PROD AWS account assume IAM role"
}

variable "prod_codebuild_source_branch" {
  type        = string
  description = "Branch of the source code"
}

# --------- prod - SNS Topic ---------
variable "prod_approval_email_address" {
  type        = string
  description = "Email address of prod branch approver"
}

# --------- prod - CodePipeline variables ---------

variable "prod_codepipeline_source_owner" {
  type        = string
  description = "Source owner for the prod codepipeline"
}

variable "prod_codepipeline_source_provider" {
  type        = string
  description = "Source provider for the prod codepipeline"
}

variable "prod_codepipeline_source_version" {
  type        = string
  description = "Source version for the prod codepipeline"
}

variable "prod_codepipeline_source_output_artifacts" {
  type        = list(string)
  description = "Source output artifacts for the prod codepipeline"
}

variable "prod_codepipeline_source_branch_name" {
  type        = string
  description = "Source branch name for the prod codepipeline"
}

variable "prod_codepipeline_build_owner" {
  type        = string
  description = "build owner for the prod codepipeline"
}

variable "prod_codepipeline_build_provider" {
  type        = string
  description = "Build provider for the prod codepipeline"
}

variable "prod_codepipeline_build_input_artifacts" {
  type        = list(string)
  description = "Build input artifacts for the prod codepipeline"
}

variable "prod_codepipeline_build_output_artifacts" {
  type        = list(string)
  description = "Build output artifacts for the prod codepipeline"
}

variable "prod_codepipeline_build_version" {
  type        = string
  description = "Build version for the prod codepipeline"
}
