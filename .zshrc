export ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=""
plugins=(git per-directory-history zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

source ~/.aliases
# fnm
eval "$(fnm env --multi)"

fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit
prompt pure
