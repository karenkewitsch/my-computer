#!/bin/bash

# Load custom scripts
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Loop through each file in the 'funcs' directory and source it
for file in "$SCRIPT_DIR/.bash_funcs/"*; do
    if [ -f "$file" ]; then
        source "$file"
    fi
done

