#!/bin/zsh

this_dir=${0:a:h}

# see hidden files in Finder
defaults write com.apple.Finder AppleShowAllFiles true
killall Finder

# installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# some brew installs
brew install pyenv
brew install --cask lunar # https://lunar.fyi/
brew install --cask iterm2


brew install font-hack-nerd-font
brew install starship # shell-prompt
brew install fzf # fuzzy finder -> github.com/junegunn/fzf
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

# rust install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
