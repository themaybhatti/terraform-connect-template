#!/bin/bash

# Define path to dev.hcl file
dev_file="./backend-tfvars/dev.hcl"

# Check if dev.hcl file exists
if [ -f "$dev_file" ]; then
    # Extract bucket name from dev.hcl
    bucket_name=$(grep 'bucket' "$dev_file" | awk -F'"' '{print $2}')
    
    # Extract region from dev.hcl
    region=$(grep 'region' "$dev_file" | awk -F'"' '{print $2}')

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
    echo "Error: $dev_file does not exist."
    exit 1
fi
