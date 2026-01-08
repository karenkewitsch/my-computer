## Stack
- stow -> for sync dotfiles
- starship -> shell prompt
- vscode -> editor
- alacritty -> terminal
- eza -> ls replacement for shell

## Setup new machine

### Install packages and apps (via shell)
Make relevant install by executing scripts or execute each command within:

```bash
. installs_common.sh
```
Do the same with the os specific install.

### Dotfiles
1. ```cd dotfiles``` and follow readme within dir
2. Add to the ~/.{bash,zsh}rc the shell-specific include scripts:

```bash
echo "source ~/.zshrc_include.zsh" >> ~/.zshrc
```

### Macos manual settings
Stuff that currently is not manages with scripts:

- Keyboard
    - Switch ctrl/cmd keys
    - Turn off mission control
    - Set close/quit app to ctrl
    - Set spotlight to ctrl


