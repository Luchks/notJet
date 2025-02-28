#!/bin/bash

# Output file
OUTPUT_FILE="merged_filtered.csv"

# Remove output file if it already exists
test -f "$OUTPUT_FILE" && rm "$OUTPUT_FILE"

# Loop through all CSV files in the current directory
for file in *.csv; do
    # Check if it's a file
    if [[ -f "$file" ]]; then
        # Filter rows that do not contain ':' and append to output file
        grep -v ':' "$file" >> "$OUTPUT_FILE"
    fi
done

echo "Merged and filtered CSV saved as $OUTPUT_FILE"
