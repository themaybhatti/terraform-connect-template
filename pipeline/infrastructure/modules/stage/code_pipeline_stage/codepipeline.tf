# ----- Additional resources -----

resource "aws_s3_bucket" "stage_codepipeline_bucket" {
  bucket        = "stage-${lower(var.codecommit_repo_name)}--2024"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "stage_codepipeline_bucket_pab" {
  bucket = aws_s3_bucket.stage_codepipeline_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "stage_assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "stage_codepipeline_role" {
  name               = "codepipeline_stage_${var.codecommit_repo_name}"
  assume_role_policy = data.aws_iam_policy_document.stage_assume_role.json
}

# resource "aws_iam_policy" "stage_codepipeline_policy" {
#   name        = "codepipeline_standard_policy"
#   description = "Standard Policy for any pipeline"
#   policy      = file("${path.module}/codepipeline_iam_policy.json")
# }

data "aws_iam_policy" "stage_codepipeline_policy" {
  name = "codepipeline_standard_policy"
}

resource "aws_iam_role_policy_attachment" "codebuild_stage_policy_attach" {
  role       = aws_iam_role.stage_codepipeline_role.name
  policy_arn = data.aws_iam_policy.stage_codepipeline_policy.arn
  # policy_arn = aws_iam_policy.stage_codepipeline_policy.arn
}

# ----- CodePipeline Resource -----

resource "aws_codepipeline" "codepipeline_stage" {
  name          = "stage_${var.codecommit_repo_name}_pipeline"
  role_arn      = aws_iam_role.stage_codepipeline_role.arn
  pipeline_type = "V2"

  artifact_store {
    location = aws_s3_bucket.stage_codepipeline_bucket.bucket
    type     = "S3"
  }

  stage {
    name = "source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = var.source_owner
      provider         = var.source_provider
      version          = var.source_version
      output_artifacts = var.source_output_artifacts
      configuration = {
        RepositoryName = var.codecommit_repo_name
        BranchName     = var.source_branch_name
      }
    }
  }

  stage {
    name = "build_validate"

    action {
      name             = "Build"
      category         = "Build"
      owner            = var.build_owner
      provider         = var.build_provider
      input_artifacts  = var.build_input_artifacts
      output_artifacts = [var.build_output_artifacts[0]]
      version          = var.build_version
      configuration = {
        ProjectName = var.build_validate_project_name
      }
    }
  }

  stage {
    name = "Approve"

    action {
      name     = "Approval"
      category = "Approval"
      owner    = "AWS"
      provider = "Manual"
      version  = "1"

      configuration = {
        NotificationArn    = var.approve_sns_arn
        CustomData         = "Need approval for deploying the resources"
        ExternalEntityLink = "https://${var.region}.console.aws.amazon.com/codesuite/codecommit/repositories/${var.codecommit_repo_name}/browse/refs/heads/${var.source_branch_name}?region=${var.region}"
      }
    }
  }

  stage {
    name = "build_apply"

    action {
      name             = "Build"
      category         = "Build"
      owner            = var.build_owner
      provider         = var.build_provider
      input_artifacts  = var.build_input_artifacts
      output_artifacts = [var.build_output_artifacts[1]]
      version          = var.build_version
      configuration = {
        ProjectName = var.build_apply_project_name
      }
    }
  }
}
