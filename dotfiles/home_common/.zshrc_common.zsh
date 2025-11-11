# common zsh across OS types

# Load custom scripts
for file in "$HOME/.bash_funcs/"*; do
    if [ -f "$file" ]; then
        source "$file"
    fi
done

eval "$(starship init zsh)"

source <(fzf --zsh)

# zsh plugins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_STYLES[path]=none
export ZSH_HIGHLIGHT_STYLES[path_prefix]=none

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh history to file and share across sessions
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST # when trimming, remove duplicates first

# aliases
alias ls='eza -lah --group-directories-last'
alias gcm='git commit -m'
alias gp='git push'