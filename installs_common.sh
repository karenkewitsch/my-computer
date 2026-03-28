#!/bin/bash

common_dir=$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)

# python / uv install
if ! command -v uv &>/dev/null; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi

# zsh plugins
mkdir -p ~/.zsh
[ -d ~/.zsh/zsh-autosuggestions ] || git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
[ -d ~/.zsh/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting

if ! command -v gcloud &>/dev/null; then
    bash "$common_dir/installs/gcp_cli.sh"
fi