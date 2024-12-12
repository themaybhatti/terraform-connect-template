#!/bin/bash

# Check if at least 2 arguments are passed (file + at least one variable=value pair)
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <file.json> <variable1=value1> <variable2=value2> ..."
    exit 1
fi

# Assign the JSON file
json_file=$1
# Create a new JSON file in the Current directory with a prefix or suffix to distinguish it
output_file="./updated_flows/$(basename "$json_file")"

# Copy the original JSON file to the new location
cp "$json_file" "$output_file"

# Function to escape special characters for sed
escape_sed() {
    echo "$1" | sed -e 's/[\/&]/\\&/g'
}

# Loop through each of the key=value pairs (starting from argument 2)
for pair in "${@:2}"; do
    # Split the pair by '=' into variable_name and replacement_value
    variable_name=$(echo "$pair" | cut -d '=' -f 1)
    replacement_value=$(echo "$pair" | cut -d '=' -f 2-)

    # Escape special characters in the variable name and replacement value for sed
    escaped_variable_name="\${${variable_name}}"
    escaped_replacement_value=$(escape_sed "$replacement_value")

    # Replace the variable in the output file using sed
    sed -i '' "s|${escaped_variable_name}|${escaped_replacement_value}|g" "$output_file"

    echo "Replaced $variable_name with $replacement_value in $output_file"
done
