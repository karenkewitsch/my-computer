#!/bin/bash

# Setup SSH key for GitHub on a new machine

set -e

email="markusks91@me.com"

key_path="$HOME/.ssh/id_ed25519"

# Generate SSH key
if [ -f "$key_path" ]; then
    echo "SSH key already exists at $key_path, skipping generation."
else
    ssh-keygen -t ed25519 -C "$email" -f "$key_path"
fi

# Start ssh-agent and add key
eval "$(ssh-agent -s)"

# Create SSH config if it doesn't exist
if ! grep -q "github.com" "$HOME/.ssh/config" 2>/dev/null; then
    mkdir -p "$HOME/.ssh"
    if [ "$(uname)" = "Darwin" ]; then
        cat >> "$HOME/.ssh/config" <<EOF

Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile $key_path
EOF
    else
        cat >> "$HOME/.ssh/config" <<EOF

Host github.com
  AddKeysToAgent yes
  IdentityFile $key_path
EOF
    fi
    echo "Added GitHub entry to ~/.ssh/config"
fi

if [ "$(uname)" = "Darwin" ]; then
    ssh-add --apple-use-keychain "$key_path"
else
    ssh-add "$key_path"
fi

# Add key to GitHub via gh CLI
if [ "$(uname)" = "Darwin" ]; then
    hostname=$(scutil --get ComputerName 2>/dev/null || hostname -s)
else
    hostname=$(hostname -s)
fi
key_blob="$(awk '{print $2}' "$key_path.pub")"

if ! command -v gh &>/dev/null; then
    echo "gh CLI not found. Add the key manually:"
    cat "$key_path.pub"
    echo "Add it at: https://github.com/settings/ssh/new"
elif ! gh auth status &>/dev/null; then
    gh auth login -p ssh -h github.com -w
    gh ssh-key add "$key_path.pub" -t "$hostname"
    echo "SSH key added to GitHub!"
else
    existing=$(gh ssh-key list 2>/dev/null | grep -F "$key_blob")
    if [ -z "$existing" ]; then
        gh ssh-key add "$key_path.pub" -t "$hostname"
        echo "SSH key added to GitHub!"
    else
        existing_title=$(echo "$existing" | cut -f1)
        if [ "$existing_title" = "$hostname" ]; then
            echo "SSH key already on GitHub with correct name, skipping."
        else
            key_id=$(echo "$existing" | awk -F'\t' '{print $4}')
            echo "SSH key on GitHub has name '$existing_title', expected '$hostname'. Updating..."
            gh ssh-key delete "$key_id" --yes
            gh ssh-key add "$key_path.pub" -t "$hostname"
            echo "SSH key renamed on GitHub."
        fi
    fi
fi

# Test the connection
echo ""
echo "Testing SSH connection to GitHub..."
ssh -T git@github.com || true
