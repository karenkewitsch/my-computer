#!/bin/zsh

this_dir=${0:a:h}

# installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# see hidden files in Finder
defaults write com.apple.Finder AppleShowAllFiles true
killall Finder

# some brew installs
brew install pyenv

#adding custom command path to .zshrc
echo "#custom zsh commands" >> ~/.zshrc
echo "path=('$this_dir/zsh_commands' \$path)" >> ~/.zshrc

# zplug
git clone https://github.com/zplug/zplug ~/.zplug
