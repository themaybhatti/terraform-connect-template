# ------- CodeCommit Repository --------

resource "aws_codecommit_repository" "terraform_code" {
  repository_name = var.repository_name
  description     = var.description
}
