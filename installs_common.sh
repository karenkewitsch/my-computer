#!/bin/bash

common_dir=$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)

# python / uv install
curl -LsSf https://astral.sh/uv/install.sh | sh

# zsh plugins
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting

. "$common_dir/installs/gcp_cli.sh"