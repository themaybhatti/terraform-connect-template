# Connect DevOps Pipeline - S3 Bucket for Connect Resources

This guide provides steps to configure and deploy S3 buckets to store Terraform `tfstate` files for AWS Connect infrastructure. The process integrates with CodePipeline and uses a buildspec file during the validation stage.

---

## Content Overview

1. Update values in `.tfvars` files.
2. Automate S3 bucket creation using shell scripts executed via CodePipeline.

---

## Steps to Deploy S3 Buckets

### 1. Update S3 Bucket Configuration

- Modify the `./backend-tfvars/dev.hcl` file to set the S3 bucket name and AWS region.

  - Open "dev.hcl" file:

  `nano ./backend-tfvars/dev.hcl`

  - Update the S3 bucket name & Region according to your preference:

  > bucket = "{s3_bucket_name}"
  > key = "pipeline/terraform.tfstate"
  > region = "{aws_region}" // us-east-1
  > encrypt = true

  _NOTE: General purpose buckets and directory buckets in Amazon S3 must be named according to the [Bucket naming guidelines](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html)_

## background Process happening in buildspec:

Buildspec Location: `./pipeline/buildspec_files`

### 1. Configuring the S3 Backend for the pipeline using the shell script

- During the validate stage of CodePipeline, a shell script (dev_s3.sh) is executed to create and configure the S3 bucket.

`chmod -R 755 ./backend-tfvars/s3_buckets/`
`./backend-tfvars/s3_buckets/dev_s3.sh`

- What This Script Does:
  - Reads configuration values from dev.hcl.
  - Creates the S3 bucket in the specified AWS region.
  - Enables versioning for the S3 bucket to maintain state file history.

_NOTE: If you are changing any files names, then please make sure to change same in the dev_s3.sh file_
