# ------- SNS Topic and Subscription --------

resource "aws_sns_topic" "codecommit_prod_approval" {
  name = "approval-notification-for-${var.codecommit_repo_name}-prod"
}

resource "aws_sns_topic_subscription" "codecommit_prod_approval_email" {
  topic_arn = aws_sns_topic.codecommit_prod_approval.arn
  protocol  = "email"
  endpoint  = var.approval_email_address
}
