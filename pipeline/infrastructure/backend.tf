terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }

  backend "s3" {
    # bucket  = "connect-terraform-20240413-dev"
    # key     = "pipeline/terraform.tfstate"
    # region  = "us-east-1"
    # encrypt = true
  }

  required_version = ">= 0.14.9"
}
