# ----- Additional resources -----

resource "aws_s3_bucket" "dev_codepipeline_bucket" {
  bucket        = "dev-${lower(var.codecommit_repo_name)}--2024"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "dev_codepipeline_bucket_pab" {
  bucket = aws_s3_bucket.dev_codepipeline_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "dev_assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "dev_codepipeline_role" {
  name               = "codepipeline_dev_${var.codecommit_repo_name}"
  assume_role_policy = data.aws_iam_policy_document.dev_assume_role.json
}

resource "aws_iam_policy" "dev_codepipeline_policy" {
  name        = "codepipeline_standard_policy"
  description = "Standard Policy for any pipeline"
  policy      = file("${path.module}/codepipeline_iam_policy.json")
}

resource "aws_iam_role_policy_attachment" "codebuild_dev_policy_attach" {
  role       = aws_iam_role.dev_codepipeline_role.name
  policy_arn = aws_iam_policy.dev_codepipeline_policy.arn
}

# data "aws_iam_policy_document" "codepipeline_policy" {
#   statement {
#     effect = "Allow"
#     actions = [
#       "s3:GetObject",
#       "s3:GetObjectVersion",
#       "s3:GetBucketVersioning",
#       "s3:PutObjectAcl",
#       "s3:PutObject",
#     ]
#     resources = [
#       aws_s3_bucket.dev_codepipeline_bucket.arn,
#       "${aws_s3_bucket.dev_codepipeline_bucket.arn}/*"
#     ]
#   }

#   statement {
#     effect = "Allow"
#     actions = [
#       "codecommit:CancelUploadArchive",
#       "codecommit:GetBranch",
#       "codecommit:GetCommit",
#       "codecommit:GetRepository",
#       "codecommit:GetUploadArchiveStatus",
#       "codecommit:UploadArchive"
#     ]
#     resources = ["*"]
#   }

#   statement {
#     effect = "Allow"
#     actions = [
#       "codecommit:CancelUploadArchive",
#       "codecommit:GetBranch",
#       "codecommit:GetCommit",
#       "codecommit:GetRepository",
#       "codecommit:GetUploadArchiveStatus",
#       "codecommit:UploadArchive"
#     ]
#     resources = ["*"]
#   }

#   statement {
#     effect = "Allow"
#     actions = [
#       "codebuild:BatchGetBuilds",
#       "codebuild:StartBuild",
#       "codebuild:BatchGetBuildBatches",
#       "codebuild:StartBuildBatch"
#     ]
#     resources = ["*"]
#   }
# }

# resource "aws_iam_role_policy" "codepipeline_policy" {
#   name   = "codepipeline_policy_dev_${var.codecommit_repo_name}"
#   role   = aws_iam_role.dev_codepipeline_role.id
#   policy = data.aws_iam_policy_document.codepipeline_policy.json
# }

# ----- CodePipeline Resource -----

resource "aws_codepipeline" "codepipeline_dev" {
  name          = "dev_${var.codecommit_repo_name}_pipeline"
  role_arn      = aws_iam_role.dev_codepipeline_role.arn
  pipeline_type = "V2"

  artifact_store {
    location = aws_s3_bucket.dev_codepipeline_bucket.bucket
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
