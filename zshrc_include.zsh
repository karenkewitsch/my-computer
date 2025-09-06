eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(starship init zsh)"
source <(fzf --zsh)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ENV VARS
export PATH="$HOME/.local/bin:$PATH"

# Load custom zsh funcs
source "${0:a:h}/zsh_commands/load_funcs.zsh"