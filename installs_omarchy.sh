#!/bin/bash

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
