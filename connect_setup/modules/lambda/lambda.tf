# ---- Lambda Zip File ----
data "archive_file" "lambda_zip_file" {
  type        = "zip"
  source_file = "${path.module}/lambda_functions/agent_status/agent_status.py"
  output_path = "${path.module}/lambda_functions/agent_status/function.zip"
  #   output_file_mode = "0666"
}


# ---- IAM Role for Lambda ----
resource "aws_iam_role" "lambda_role" {
  name               = var.lambda_role_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}


# ---- IAM Policy for Lambda Role ----
resource "aws_iam_policy" "lambda_policy" {
  name = var.lambda_policy_name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "connect:*",
                "ds:CreateAlias",
                "ds:AuthorizeApplication",
                "ds:CreateIdentityPoolDirectory",
                "ds:DeleteDirectory",
                "ds:DescribeDirectories",
                "ds:UnauthorizeApplication",
                "firehose:DescribeDeliveryStream",
                "firehose:ListDeliveryStreams",
                "kinesis:DescribeStream",
                "kinesis:ListStreams",
                "kms:DescribeKey",
                "kms:ListAliases",
                "lex:GetBots",
                "lex:ListBots",
                "lex:ListBotAliases",
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "s3:GetBucketLocation",
                "s3:ListAllMyBuckets",
                "lambda:ListFunctions",
                "ds:CheckAlias",
                "profile:ListAccountIntegrations",
                "profile:GetDomain",
                "profile:ListDomains",
                "profile:GetProfileObjectType",
                "profile:ListProfileObjectTypeTemplates"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "profile:AddProfileKey",
                "profile:CreateDomain",
                "profile:CreateProfile",
                "profile:DeleteDomain",
                "profile:DeleteIntegration",
                "profile:DeleteProfile",
                "profile:DeleteProfileKey",
                "profile:DeleteProfileObject",
                "profile:DeleteProfileObjectType",
                "profile:GetIntegration",
                "profile:GetMatches",
                "profile:GetProfileObjectType",
                "profile:ListIntegrations",
                "profile:ListProfileObjects",
                "profile:ListProfileObjectTypes",
                "profile:ListTagsForResource",
                "profile:MergeProfiles",
                "profile:PutIntegration",
                "profile:PutProfileObject",
                "profile:PutProfileObjectType",
                "profile:SearchProfiles",
                "profile:TagResource",
                "profile:UntagResource",
                "profile:UpdateDomain",
                "profile:UpdateProfile"
            ],
            "Resource": "arn:aws:profile:*:*:domains/amazon-connect-*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:CreateBucket",
                "s3:GetBucketAcl"
            ],
            "Resource": "arn:aws:s3:::amazon-connect-*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "servicequotas:GetServiceQuota"
            ],
            "Resource": "arn:aws:servicequotas:*:*:connect/*"
        },
        {
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": "connect.amazonaws.com"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": "iam:DeleteServiceLinkedRole",
            "Resource": "arn:aws:iam::*:role/aws-service-role/connect.amazonaws.com/AWSServiceRoleForAmazonConnect*"
        },
        {
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "arn:aws:iam::*:role/aws-service-role/profile.amazonaws.com/*",
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": "profile.amazonaws.com"
                }
            }
        }
    ]
}
EOF
}


# ---- IAM Policy Attachment ----
resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}


# ---- Lambda Function ----
resource "aws_lambda_function" "lambda_function" {
  filename      = data.archive_file.lambda_zip_file.output_path
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = var.lambda_handler
  #   source_code_hash = data.archive_file.lambda_zip_file.output_base64sha256
  runtime = var.lambda_runtime
  timeout = 840
}


resource "aws_connect_lambda_function_association" "lambda_association" {
  function_arn = aws_lambda_function.lambda_function.arn
  instance_id  = var.instance_id
}
