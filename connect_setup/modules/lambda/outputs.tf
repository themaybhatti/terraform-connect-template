output "lambda_role_output" {
  value = aws_iam_role.lambda_role.name
  
}

output "lambda_role_arn_output" {
  value = aws_iam_role.lambda_role.arn
  
}