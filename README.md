

## Setup new machine

### Installs of packages and apps (via shell)
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


## Stack
- stow -> for sync dotfiles
- starship
- vscode
- alacritty (terminal)
- eza

## Apps not installed via shell
These are not installed via scripts executed above:

### Macos
- [Magnet](https://magnet.crowdcafe.com/) for windows management
- [vscode](https://code.visualstudio.com/)
- [xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12/)

