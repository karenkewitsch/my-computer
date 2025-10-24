# zsh stuff specific for omarchy/linux
source ~/.zshrc_common.zsh

open() {
  xdg-open "$@" >/dev/null 2>&1 &
}