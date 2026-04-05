#!/bin/bash

this_dir=$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)

# python / uv
if ! command -v uv &>/dev/null; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi

# zsh plugins
mkdir -p ~/.zsh
[ -d ~/.zsh/zsh-autosuggestions ] || git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
[ -d ~/.zsh/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting

# rust
if ! command -v rustup &>/dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# gcp cli
if ! command -v gcloud &>/dev/null; then
    bash "$this_dir/installs/gcp_cli.sh"
fi
