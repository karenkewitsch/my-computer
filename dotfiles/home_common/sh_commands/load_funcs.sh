#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Loop through each file in the 'funcs' directory and source it
for file in "$SCRIPT_DIR/funcs/"*; do
    if [ -f "$file" ]; then
        source "$file"
    fi
done