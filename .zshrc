# OPENSPEC:START
# OpenSpec shell completions configuration
fpath=("/home/mhe/.oh-my-zsh/custom/completions" $fpath)
autoload -Uz compinit
compinit
# OPENSPEC:END

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
    nvm
    vi-mode
    )
source $ZSH/oh-my-zsh.sh

source ~/.zsh/env.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/modelon_functions.zsh
# source ~/.zsh/tmux.zsh
# source ~/.zsh/load_prompt.zsh
# source ~/.zsh/base16-shell.zsh
source ~/.zsh/alias.zsh
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.poetry/bin:$PATH"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
eval "$(uv generate-shell-completion zsh)"
eval "$(uv generate-shell-completion zsh)"
alias kubectl="microk8s kubectl"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opencode
export PATH=/home/mhe/.opencode/bin:$PATH
