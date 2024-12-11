# ------- CodeBuild Projectname --------

output "code_build_1_stage_projectname" {
  value = aws_codebuild_project.codebuild_stage_1.name
}

output "code_build_2_stage_projectname" {
  value = aws_codebuild_project.codebuild_stage_2.name
}
