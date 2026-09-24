#!/bin/bash
set -euo pipefail

curl -s -o lab3-bundle.tar.gz https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz
tar -xzf lab3-bundle.tar.gz

# Step 4: remove empty rows
awk '!/^[[:space:]]*$/' lab3_data.tsv > cleaned.tsv

# Step 5: convert tabs to commas
tr '\t' ',' < cleaned.tsv > cleaned.csv

# Step 6: count data rows (skip the header) and print it
ROWS=$(tail -n +2 cleaned.csv | wc -l)
echo "Number of data rows: $ROWS"

# Step 7: package the cleaned CSV
tar -czf converted-archive.tar.gz cleaned.csv
