## Stack
- stow -> for sync dotfiles
- starship -> shell prompt
- vscode -> editor
- alacritty -> terminal
- eza -> ls replacement for shell

## Setup new machine

### Install packages and apps (via shell)
Run the OS-specific install script. It will also run the common installs automatically.

**macOS:**
```zsh
. installs_mac.zsh
```

**Omarchy/Linux:**
```bash
. installs_omarchy.sh
```

SSH keys for GitHub are set up automatically as part of the install scripts.

### Dotfiles
1. ```cd dotfiles``` and follow readme within dir
2. Add to the ~/.{bash,zsh}rc the shell-specific include scripts:

```bash
echo "source ~/.zshrc_include.zsh" >> ~/.zshrc
```

### Macos
Stuff that currently is not managed with scripts:

#### Settings/configurations
- Keyboard shortcuts
    - Switch ctrl/cmd keys
    - Turn off mission control
    - Set close/quit app to ctrl
        - App shortcuts -> All applications -> 'Close Window' & 'Close'
    - Set spotlight to ctrl

VScode shortcuts are currently relying on ctl/cmd switch.

#### Apps
- [Docker desktop](https://www.docker.com/)

