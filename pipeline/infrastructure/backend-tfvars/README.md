# Connect DevOps Pipeline - S3 Bucket

For storing the terraform's tfstate file of the connect infrastructure in S3 buckets.

Content:

- Change values in tfvars files
- Creation of S3 buckets using scripts

### Steps to deploy S3:

**_Prerequisite:_**

- Terraform installed on your local machine
- Configure the aws-cli with dev account IAM user for deploying pipeline.
- IAM user must be having HTTPS Git credentials generated for AWS CodeCommit (if using CodeCommit as SCM)

**_Pipeline infrastructure:_**

`cd ./pipeline/infrastructure`

1. Replace the value of the S3 bucket & Region in the "./backend-tfvars/pipeline.hcl" file

   - Open "pipeline.hcl" file

   `nano ./backend-tfvars/pipeline.hcl`

   - Update the S3 bucket name & Region according to your preference

   > bucket = "{s3_bucket_name}"
   > key = "pipeline/terraform.tfstate"
   > region = "{aws_region}" // us-east-1
   > encrypt = true

   _NOTE: General purpose buckets and directory buckets in Amazon S3 must be named according to the [Bucket naming guidelines](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html)_

2. Configuring the S3 Backend for the pipeline using the shell script

   - Execute the script for the creation of the S3 bucket with versioning enabled.

   `chmod -R 755 ./backend-tfvars/s3_buckets/`
   `./backend-tfvars/s3_buckets/pipeline_s3.sh`

   _NOTE: If you are changing any files names, then please make sure to change same in the pipeline_s3.sh file_

   - This script is going to create s3 bucket in respective AWS account based on the values which we add in the pipeline.hcl files.
