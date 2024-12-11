#!/bin/bash

# Define path to stage.hcl file
stage_file="./backend-tfvars/stage.hcl"

# Check if stage.hcl file exists
if [ -f "$stage_file" ]; then
    # Extract bucket name from stage.hcl
    bucket_name=$(grep 'bucket' "$stage_file" | awk -F'"' '{print $2}')
    
    # Extract region from stage.hcl
    region=$(grep 'region' "$stage_file" | awk -F'"' '{print $2}')

    echo "Bucket '$bucket_name' is now creating in '$region'"
    # Check if bucket already exists
    if aws s3api head-bucket --bucket "$bucket_name" 2>/stage/null; then
        echo "Bucket '$bucket_name' already exists. Skipping bucket creation."
    else
        # Create S3 bucket
        aws s3api create-bucket --bucket "$bucket_name" --region "$region"

        # Enable versioning for the bucket
        aws s3api put-bucket-versioning --bucket "$bucket_name" --versioning-configuration Status=Enabled
    fi
else
    echo "Error: $stage_file does not exist."
    exit 1
fi
