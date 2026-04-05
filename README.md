## Stack
- stow -> for sync dotfiles
- starship -> shell prompt
- vscode -> editor
- alacritty -> terminal
- eza -> ls replacement for shell

## Setup new machine

Run the OS-specific install script. It handles everything: packages, dotfiles (via stow), zshrc sourcing, and GitHub SSH keys.

**macOS:**
```zsh
zsh installs_mac.zsh
```

**Omarchy/Linux:**
```bash
bash installs_omarchy.sh
```

### macOS manual steps

Keyboard shortcuts:
- Switch ctrl/cmd keys
- Turn off mission control
- Set close/quit app to ctrl (App Shortcuts -> All Applications -> 'Close Window' & 'Close')
- Set spotlight to ctrl

VSCode shortcuts currently rely on the ctrl/cmd switch.
