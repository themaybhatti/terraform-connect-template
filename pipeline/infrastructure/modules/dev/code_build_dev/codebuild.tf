# ------- CodeBuild Roles --------

data "aws_iam_policy_document" "codebuild_dev_assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "codebuild_dev_iam_role" {
  name               = "codebuild-dev-${var.codecommit_repo_name}-role"
  assume_role_policy = data.aws_iam_policy_document.codebuild_dev_assume_role.json
}

data "aws_iam_policy" "codebuild_dev_policy" {
  name = "AdministratorAccess"
}

resource "aws_iam_role_policy_attachment" "codebuild_dev_policy_attach" {
  role       = aws_iam_role.codebuild_dev_iam_role.name
  policy_arn = data.aws_iam_policy.codebuild_dev_policy.arn
}

# ------- CodeBuild Project --------

resource "aws_codebuild_project" "codebuild_dev_1" {
  name         = "${var.codecommit_repo_name}-dev-validate"
  description  = var.description
  service_role = aws_iam_role.codebuild_dev_iam_role.arn

  artifacts {
    type = var.artifacts_type
  }

  environment {
    compute_type                = var.compute_type
    type                        = var.env_type
    image                       = var.image
    image_pull_credentials_type = var.image_pull_credentials_type
  }

  source {
    type     = var.source_type
    location = var.source_location
    # buildspec = file(var.dev_validate_buildspec_location)
    buildspec = var.dev_validate_buildspec_location
  }

  source_version = "refs/heads/${var.source_version}"

  tags = {
    Environment = "dev"
  }
}

resource "aws_codebuild_project" "codebuild_dev_2" {
  name         = "${var.codecommit_repo_name}-dev-apply"
  description  = var.description
  service_role = aws_iam_role.codebuild_dev_iam_role.arn

  artifacts {
    type = var.artifacts_type
  }

  environment {
    compute_type                = var.compute_type
    type                        = var.env_type
    image                       = var.image
    image_pull_credentials_type = var.image_pull_credentials_type
  }

  source {
    type     = var.source_type
    location = var.source_location
    # buildspec = file(var.dev_apply_buildspec_location)
    buildspec = var.dev_apply_buildspec_location
  }

  source_version = "refs/heads/${var.source_version}"

  tags = {
    Environment = "dev"
  }
}
