# ------- CodePipeline Variable --------

variable "codecommit_repo_name" {
  type        = string
  description = "Name of the Source repo."
}

variable "source_owner" {
  type        = string
  description = "Source owner for the dev codepipeline."
}

variable "source_provider" {
  type        = string
  description = "Source provider for the dev codepipeline"
}

variable "source_version" {
  type        = string
  description = "Source version for the dev codepipeline"
}

variable "source_output_artifacts" {
  type        = list(string)
  description = "Source output artifacts for the dev codepipeline"
}

variable "source_branch_name" {
  type        = string
  description = "Source branch name for the dev codepipeline"
}

variable "build_owner" {
  type        = string
  description = "build owner for the dev codepipeline"
}

variable "build_provider" {
  type        = string
  description = "Build provider for the dev codepipeline"
}

variable "build_input_artifacts" {
  type        = list(string)
  description = "Build input artifacts for the dev codepipeline"
}

variable "build_output_artifacts" {
  type        = list(string)
  description = "Build output artifacts for the dev codepipeline"
}

variable "build_version" {
  type        = string
  description = "Build version for the dev codepipeline"
}

variable "build_validate_project_name" {
  type        = string
  description = "Build validate Project name for the dev codepipeline"
}

variable "build_apply_project_name" {
  type        = string
  description = "Build apply Project name for the dev codepipeline"
}
