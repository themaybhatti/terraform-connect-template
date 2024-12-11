# ----- SNS Topic and Subcription -----

resource "aws_sns_topic" "codecommit_stage_approval" {
  name = "approval-notification-for-${var.codecommit_repo_name}-stage"
}

resource "aws_sns_topic_subscription" "codecommit_stage_approval_email" {
  topic_arn = aws_sns_topic.codecommit_stage_approval.arn
  protocol  = "email"
  endpoint  = var.approval_email_address
}
