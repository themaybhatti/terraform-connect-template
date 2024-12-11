# ------- SNS variable --------

variable "codecommit_repo_name" {
  type        = string
  description = "Name of the Source repo."
}

variable "approval_email_address" {
  type        = string
  description = "Email address of approval"
}
