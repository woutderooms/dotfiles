# Path to your oh-my-zsh installation.
export ZSH="/Users/woutderooms/.oh-my-zsh"
ZSH_THEME=""
plugins=(git per-directory-history zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Let's fixup nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

alias pubkey="pbcopy < ~/.ssh/id_rsa.pub"

# Let's fixup yarn
export PATH="$PATH:/opt/yarn-[version]/bin"
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit
prompt pure