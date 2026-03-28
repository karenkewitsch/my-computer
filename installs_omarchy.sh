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

# aws cli / also update
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws/

# common installs
. "$this_dir/installs_common.sh"

# setup ssh keys with github
bash "$this_dir/installs/github_ssh.sh"
