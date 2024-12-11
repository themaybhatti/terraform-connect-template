#!/bin/bash

# Define path to pipeline.hcl file
pipeline_file="./backend-tfvars/pipeline.hcl"

# Check if pipeline.hcl file exists
if [ -f "$pipeline_file" ]; then
    # Extract bucket name from pipeline.hcl
    bucket_name=$(grep 'bucket' "$pipeline_file" | awk -F'"' '{print $2}')
    
    # Extract region from pipeline.hcl
    region=$(grep 'region' "$pipeline_file" | awk -F'"' '{print $2}')

    echo "Bucket '$bucket_name' is now creating in '$region'"
    # Check if bucket already exists
    if aws s3api head-bucket --bucket "$bucket_name" 2>/dev/null; then
        echo "Bucket '$bucket_name' already exists. Skipping bucket creation."
    else
        # Create S3 bucket
        aws s3api create-bucket --bucket "$bucket_name" --region "$region"

        # Enable versioning for the bucket
        aws s3api put-bucket-versioning --bucket "$bucket_name" --versioning-configuration Status=Enabled
    fi
else
    echo "Error: $pipeline_file does not exist."
    exit 1
fi
