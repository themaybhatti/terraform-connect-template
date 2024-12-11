# ------- CodeBuild Projectname --------

output "code_build_1_prod_projectname" {
  value = aws_codebuild_project.codebuild_prod_1.name
}

output "code_build_2_prod_projectname" {
  value = aws_codebuild_project.codebuild_prod_2.name
}
