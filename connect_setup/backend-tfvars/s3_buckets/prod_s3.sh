#!/bin/bash

# Define path to prod.hcl file
prod_file="./backend-tfvars/prod.hcl"

# Check if prod.hcl file exists
if [ -f "$prod_file" ]; then
    # Extract bucket name from prod.hcl
    bucket_name=$(grep 'bucket' "$prod_file" | awk -F'"' '{print $2}')
    
    # Extract region from prod.hcl
    region=$(grep 'region' "$prod_file" | awk -F'"' '{print $2}')

    echo "Bucket '$bucket_name' is now creating in '$region'"
    # Check if bucket already exists
    if aws s3api head-bucket --bucket "$bucket_name" 2>/prod/null; then
        echo "Bucket '$bucket_name' already exists. Skipping bucket creation."
    else
        # Create S3 bucket
        aws s3api create-bucket --bucket "$bucket_name" --region "$region"

        # Enable versioning for the bucket
        aws s3api put-bucket-versioning --bucket "$bucket_name" --versioning-configuration Status=Enabled
    fi
else
    echo "Error: $prod_file does not exist."
    exit 1
fi
