export ZSH="/home/mhe/.oh-my-zsh"
ZSH_THEME="avit"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(
    git
    docker
    git-extras
    python
    fzf
    kubectl
    )
source $ZSH/oh-my-zsh.sh

source ~/.zsh/env.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/tmux.zsh
# source ~/.zsh/load_prompt.zsh
# source ~/.zsh/base16-shell.zsh
source ~/.zsh/alias.zsh
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
