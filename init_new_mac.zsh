#!/bin/zsh

this_dir=${0:a:h}

# installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# installing Oh-my-zsh before anything else as it will create a .zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# see hidden files in Finder
defaults write com.apple.Finder AppleShowAllFiles true
killall Finder

# some brew installs
brew install pyenv

#adding custom command path to .zshrc
echo "#custom zsh commands" >> ~/.zshrc
echo "path=('$this_dir/zsh_commands' \$path)" >> ~/.zshrc

#defining oh-my-zsh plugins
sed -i '.bak' 's/plugins=.*/plugins=(git gitfast)/g' ~.zshrc
rm ~.zshrc.bak
