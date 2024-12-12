#!/bin/bash

# Check if at least 1 argument is passed (JSON file)
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <file.json>"
    exit 1
fi

# Assign the JSON file
json_file=$1

# Assign the tfvars file
tfvars_file="./vars.tfvars"

# Function to escape special characters for sed
escape_sed() {
    echo "$1" | sed -e 's/[\/&]/\\&/g'
}

# Function to extract ARN variable from tfvars file
get_tfvar_variable() {
    local arn=$1
    grep -E " *= *\"$arn\"" "$tfvars_file" | cut -d '=' -f 1 | sed 's/^[ "\t]*//;s/[ "\t]*$//'
}

# Detect ARNs in the JSON file using grep
arns_in_json=$(grep -o '"arn:aws:[^"]*"' "$json_file" | tr -d '"')

# Loop through each detected ARN in the JSON file
for arn in $arns_in_json; do
    # Get the corresponding variable from the tfvars file
    arn_variable=$(get_tfvar_variable "$arn")

    # If a variable is found, replace the ARN in the JSON file with the variable
    if [ -n "$arn_variable" ]; then
        # Escape special characters in ARN and variable for sed
        escaped_arn=$(escape_sed "$arn")
        escaped_variable="\${var.$arn_variable}"

        # Replace ARN with the variable in the JSON file
        sed -i '' "s|$escaped_arn|$escaped_variable|g" "$json_file"
        echo "Replaced ARN $arn with \${var.$arn_variable} in $json_file"
    else
        echo "No matching variable found for ARN: $arn"
    fi
done
