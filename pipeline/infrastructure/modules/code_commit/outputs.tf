# ------- CodeCommit HTTP URL --------

output "codecommit_http_url" {
  value = aws_codecommit_repository.terraform_code.clone_url_http
}
