# ------- SNS Topic ARN --------

output "prod_sns_topic_arn" {
  value       = aws_sns_topic.codecommit_prod_approval.arn
  description = "SNS topic ARN for the prod branch"
}
