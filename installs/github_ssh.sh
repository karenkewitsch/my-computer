#!/bin/bash

# Setup SSH key for GitHub on a new machine
# Usage: ./installs/github_ssh.sh [email]

set -e

email="${1:-}"
if [ -z "$email" ]; then
    read -p "Enter your GitHub email: " email
fi

key_path="$HOME/.ssh/id_ed25519"

# Generate SSH key
if [ -f "$key_path" ]; then
    echo "SSH key already exists at $key_path"
    read -p "Overwrite? (y/N): " overwrite
    if [ "$overwrite" != "y" ]; then
        echo "Using existing key."
    else
        ssh-keygen -t ed25519 -C "$email" -f "$key_path"
    fi
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
if command -v gh &>/dev/null; then
    echo ""
    echo "Adding SSH key to GitHub via gh CLI..."
    if [ "$(uname)" = "Darwin" ]; then
        hostname=$(scutil --get ComputerName 2>/dev/null || hostname -s)
    else
        hostname=$(hostname -s)
    fi
    gh auth login -p ssh -h github.com -w
    gh ssh-key add "$key_path.pub" -t "$hostname"
    echo "SSH key added to GitHub!"
else
    echo ""
    echo "gh CLI not found. Install it or add the key manually."
    echo "Your public key:"
    echo ""
    cat "$key_path.pub"
    echo ""
    echo "Add it at: https://github.com/settings/ssh/new"
fi

# Test the connection
echo ""
echo "Testing SSH connection to GitHub..."
ssh -T git@github.com || true
