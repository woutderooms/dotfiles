ZSH_THEME=""
plugins=(git per-directory-history zsh-syntax-highlighting)

source ~/.aliases

# Let's fixup nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit
prompt pure