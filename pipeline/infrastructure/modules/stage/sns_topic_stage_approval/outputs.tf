# ----- SNS Variable -----

output "stage_sns_topic_arn" {
  value       = aws_sns_topic.codecommit_stage_approval.arn
  description = "SNS topic ARN for the stage branch"
}
