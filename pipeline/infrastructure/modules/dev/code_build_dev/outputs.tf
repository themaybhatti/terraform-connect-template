# ------- CodeBuild Projectname --------

output "code_build_1_dev_projectname" {
  value = aws_codebuild_project.codebuild_dev_1.name
}

output "code_build_2_dev_projectname" {
  value = aws_codebuild_project.codebuild_dev_2.name
}
