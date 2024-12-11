# ------- COdeBuild Variable --------

variable "codecommit_repo_name" {
  type        = string
  description = "Name of the code-commit repo."
}

variable "description" {
  type        = string
  description = "Specifies the description of the CodeBuild."
}

variable "artifacts_type" {
  type        = string
  description = "Artifacts Type in CodeBuild Project."
}

variable "compute_type" {
  type        = string
  description = "Compute Type in CodeBuild Project."
}

variable "env_type" {
  type        = string
  description = "Environment Type in CodeBuild Project."
}

variable "image" {
  type        = string
  description = "Images used in project to execute the commands."
}

variable "image_pull_credentials_type" {
  type        = string
  description = "Credentials Type in CodeBuild Project."
}

variable "STAGE_ASSUME_IAM_ROLE" {
  type        = string
  description = "STAGE account assume IAM role."
}

variable "source_type" {
  type        = string
  description = "Source Type in CodeBuild Project."
}

variable "source_location" {
  type        = string
  description = "Location used in project to store the code."
}

variable "source_version" {
  type        = string
  description = "Branch of the source code."
}

variable "stage_validate_buildspec_location" {
  type        = string
  description = "Location of the buildspec in CodeBuild Project."
}

variable "stage_apply_buildspec_location" {
  type        = string
  description = "Location of the buildspec in CodeBuild Project."
}
