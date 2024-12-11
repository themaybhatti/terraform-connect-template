# ------- CodeBuild Roles --------

data "aws_iam_policy_document" "codebuild_stage_assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "codebuild_stage_iam_role" {
  name               = "codebuild-stage-${var.codecommit_repo_name}-role"
  assume_role_policy = data.aws_iam_policy_document.codebuild_stage_assume_role.json
}

resource "aws_iam_policy" "codebuild_stage_iam_policy" {
  name        = "codebuild_stage_${var.codecommit_repo_name}_policy"
  description = "Policy for codebuild with stage role assume"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "sts:*",
        Resource = "${var.STAGE_ASSUME_IAM_ROLE}"
      },
      {
        Effect   = "Allow",
        Resource = "*",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
      },
      {
        Effect   = "Allow",
        Resource = "*",
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:GetBucketAcl",
          "s3:GetBucketLocation"
        ]
      },
      {
        Effect   = "Allow",
        Resource = "*",
        Action = [
          "codecommit:GitPull"
        ]
      },
      {
        Effect = "Allow",
        Action = [
          "codebuild:CreateReportGroup",
          "codebuild:CreateReport",
          "codebuild:UpdateReport",
          "codebuild:BatchPutTestCases",
          "codebuild:BatchPutCodeCoverages"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "codebuild_stage_policy_attach" {
  role       = aws_iam_role.codebuild_stage_iam_role.name
  policy_arn = aws_iam_policy.codebuild_stage_iam_policy.arn
}

# ------- CodeBuild Project --------

resource "aws_codebuild_project" "codebuild_stage_1" {
  name         = "${var.codecommit_repo_name}-stage-validate"
  description  = var.description
  service_role = aws_iam_role.codebuild_stage_iam_role.arn

  artifacts {
    type = var.artifacts_type
  }

  environment {
    compute_type                = var.compute_type
    type                        = var.env_type
    image                       = var.image
    image_pull_credentials_type = var.image_pull_credentials_type

    environment_variable {
      name  = "STAGE_ASSUME_IAM_ROLE"
      value = var.STAGE_ASSUME_IAM_ROLE
    }
  }

  source {
    type     = var.source_type
    location = var.source_location
    # buildspec = file(var.stage_validate_buildspec_location)
    buildspec = var.stage_validate_buildspec_location
  }

  source_version = "refs/heads/${var.source_version}"

  tags = {
    Environment = "stage"
  }
}

resource "aws_codebuild_project" "codebuild_stage_2" {
  name         = "${var.codecommit_repo_name}-stage-apply"
  description  = var.description
  service_role = aws_iam_role.codebuild_stage_iam_role.arn

  artifacts {
    type = var.artifacts_type
  }

  environment {
    compute_type                = var.compute_type
    type                        = var.env_type
    image                       = var.image
    image_pull_credentials_type = var.image_pull_credentials_type

    environment_variable {
      name  = "STAGE_ASSUME_IAM_ROLE"
      value = var.STAGE_ASSUME_IAM_ROLE
    }
  }

  source {
    type     = var.source_type
    location = var.source_location
    # buildspec = file(var.stage_apply_buildspec_location)
    buildspec = var.stage_apply_buildspec_location
  }

  source_version = "refs/heads/${var.source_version}"

  tags = {
    Environment = "stage"
  }
}
