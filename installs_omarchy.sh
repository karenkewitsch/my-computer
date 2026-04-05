#!/bin/bash

this_dir=$(cd "$(dirname "$0")" && pwd)

# set machine name
current_name=$(hostname -s)
echo "Current machine name: $current_name"
read -p "Enter new machine name (leave empty to keep current): " new_name
if [ -n "$new_name" ]; then
    sudo hostnamectl set-hostname "$new_name"
    echo "Machine name set to: $new_name"
else
    echo "Keeping: $current_name"
fi

sudo pacman -S --needed \
    stow \
    visual-studio-code-bin \
    openconnect \
    google-chrome \
    zsh \
    github-cli

# aws cli
if ! command -v aws &>/dev/null; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
    unzip /tmp/awscliv2.zip -d /tmp
    sudo /tmp/aws/install
    rm -rf /tmp/awscliv2.zip /tmp/aws
fi

# common installs
. "$this_dir/installs_common.sh"

# dotfiles
stow -d "$this_dir/dotfiles" -t ~ home_common
stow -d "$this_dir/dotfiles" -t ~ home_omarchy
mkdir -p ~/.local/share/applications
stow -d "$this_dir/dotfiles" -t ~/.local/share/applications webapps_omarchy
grep -q "source ~/.zshrc_include.zsh" ~/.zshrc 2>/dev/null || echo "source ~/.zshrc_include.zsh" >> ~/.zshrc

# setup ssh keys with github
bash "$this_dir/installs/github_ssh.sh"
