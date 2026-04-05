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

if ! xcode-select -p &>/dev/null; then
    xcode-select --install
    echo "Waiting for xcode command line tools to finish installing..."
    until xcode-select -p &>/dev/null; do sleep 5; done
fi

# homebrew
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# cli tools
brew install stow
brew install fontconfig
brew install font-hack-nerd-font
brew install --cask font-caskaydia-mono-nerd-font
brew install starship # shell prompt
brew install fzf # fuzzy finder -> github.com/junegunn/fzf
brew install eza # ls replacement
brew install gh

# apps
brew install --cask alacritty
brew install --cask visual-studio-code
brew install --cask google-chrome
brew install --cask nikitabobko/tap/aerospace
brew install --cask bitwarden
brew install --cask lunar # https://lunar.fyi/
brew install --cask docker
brew install --cask slack

# macos settings
defaults write com.apple.Finder AppleShowAllFiles true
defaults write com.apple.dock autohide 1
defaults write "Apple Global Domain" _HTHideMenuBar 1
defaults write "Apple Global Domain" SLSMenuBarUseBlurredAppearance 0
defaults write com.apple.AppleMultitouchTrackpad Clicking 1
killall Finder
killall Dock

# common installs
. "$this_dir/installs_common.sh"

# dotfiles
stow -d "$this_dir/dotfiles" -t ~ home_common
stow -d "$this_dir/dotfiles" -t ~ home_mac
grep -q "source ~/.zshrc_include.zsh" ~/.zshrc 2>/dev/null || echo "source ~/.zshrc_include.zsh" >> ~/.zshrc

# setup ssh keys with github
bash "$this_dir/installs/github_ssh.sh"
