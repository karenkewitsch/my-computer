# Get the directory of the current script
SCRIPT_DIR=$(dirname "${(%):-%N}")

# Loop through each file in the 'funcs' directory and source it
for file in "$SCRIPT_DIR/funcs/"*; do
    if [ -f "$file" ]; then
        source "$file"
    fi
done