#!/bin/bash

# Check if at least 2 arguments are passed (file + at least one variable=value pair)
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <file.json> <variable1=value1> <variable2=value2> ..."
    exit 1
fi

# Assign the JSON file
json_file=$1

# Check if the file is in the contact_flows or contact_flows_modules folder and set the appropriate output directory
if [[ "$json_file" == ./contact_flows/* ]]; then
    output_dir="./updated_flows"
elif [[ "$json_file" == ./contact_flows_modules/* ]]; then
    output_dir="./exported_flows"
else
    echo "Error: File must be in either 'contact_flows' or 'contact_flows_modules' directory."
    exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Create the output file path based on the original file's name
output_file="$output_dir/$(basename "$json_file")"

# Copy the original JSON file to the new location
cp "$json_file" "$output_file"

# Assign the tfvars file
tfvars_file="./vars.tfvars"

# Function to escape special characters for sed
escape_sed() {
    echo "$1" | sed -e 's/[\/&]/\\&/g'
}

# Function to extract value from tfvars file
get_tfvar_value() {
    local var_name=$1
    grep "^${var_name} *= *" "$tfvars_file" | cut -d '=' -f2- | sed 's/^[ "\t]*//;s/[ "\t]*$//'
}

# Loop through each of the key=value pairs (starting from argument 2)
for pair in "${@:2}"; do
    # Split the pair by '=' into variable_name and replacement_value
    variable_name=$(echo "$pair" | cut -d '=' -f 1)
    replacement_value=$(echo "$pair" | cut -d '=' -f 2-)

    # If the replacement_value is in the form of ${var.<name>}, extract the variable name and get the value from tfvars
    if [[ "$replacement_value" =~ ^\$\{var\.(.*)\}$ ]]; then
        var_name_in_tfvars="${BASH_REMATCH[1]}"
        replacement_value=$(get_tfvar_value "$var_name_in_tfvars")
    fi

    # Escape special characters in the variable name and replacement value for sed
    escaped_variable_name="\${${variable_name}}"
    escaped_replacement_value=$(escape_sed "$replacement_value")

    # Replace the variable in the output file using sed
    sed -i '' "s|${escaped_variable_name}|${escaped_replacement_value}|g" "$output_file"

    echo "Replaced $variable_name with $replacement_value in $output_file"
done
