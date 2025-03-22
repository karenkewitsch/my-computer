eval "$(/opt/homebrew/bin/brew shellenv)"

# ZPLUG
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

# pure prompt - https://github.com/sindresorhus/pure
# fpath+=("$(brew --prefix)/share/zsh/site-functions")
# zplug mafredri/zsh-async, from:github
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
# autoload -U promptinit; promptinit
# prompt pure
# zstyle :prompt:pure:path color '#89CFF0'

zplug load

eval "$(starship init zsh)"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# ENV VARS
export PATH="$HOME/.local/bin:$PATH"

# Load custom zsh funcs
source "${0:a:h}/zsh_commands/load_funcs.zsh"