
eval "$(/opt/homebrew/bin/brew shellenv)"

# ENV VARS
export PATH="$HOME/.local/bin:$PATH"
export SSL_CERT_FILE=/etc/ssl/cert.pem

# Load common shell stuff
source ~/.zshrc_common.zsh