#!/bin/zsh

this_dir=${0:a:h}

# set machine name
current_name=$(scutil --get ComputerName 2>/dev/null || hostname -s)
echo "Current machine name: $current_name"
read "new_name?Enter new machine name (leave empty to keep current): "
if [ -n "$new_name" ]; then
    sudo scutil --set ComputerName "$new_name"
    sudo scutil --set HostName "$new_name"
    sudo scutil --set LocalHostName "$new_name"
    echo "Machine name set to: $new_name"
else
    echo "Keeping: $current_name"
fi

xcode-select --install # basic stuff. git, gcc, etc.

# installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# some brew installs
brew install --cask lunar # https://lunar.fyi/
brew install stow
brew install fontconfig
brew install font-hack-nerd-font
brew install --cask font-caskaydia-mono-nerd-font
brew install starship # shell-prompt
brew install fzf # fuzzy finder -> github.com/junegunn/fzf
brew install alacritty
brew install eza
brew install --cask visual-studio-code
brew install --cask google-chrome
brew install --cask nikitabobko/tap/aerospace
brew install --cask bitwarden
brew install gh

# rust install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# set settings config
defaults write com.apple.Finder AppleShowAllFiles true
killall Finder
defaults write com.apple.dock autohide 1
defaults write "Apple Global Domain" _HTHideMenuBar 1
defaults write "Apple Global Domain" SLSMenuBarUseBlurredAppearance 0
defaults write com.apple.AppleMultitouchTrackpad Clicking 1

# job specifics
brew install --cask slack

# common installs
. "$this_dir/installs_common.sh"

# setup ssh keys with github
. "$this_dir/installs/github_ssh.sh"