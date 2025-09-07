#!/bin/bash

# Load custom scripts
for file in "$HOME/.bash_funcs/"*; do
    if [ -f "$file" ]; then
        source "$file"
    fi
done

# EZA for ls
alias ls='eza -lah --group-directories-last'