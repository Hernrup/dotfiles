# OPENSPEC:START
# OpenSpec shell completions configuration
fpath=("/home/mhe/.oh-my-zsh/custom/completions" $fpath)
# OPENSPEC:END

export ZSH="/home/mhe/.oh-my-zsh"
ZSH_THEME="avit"
DISABLE_UNTRACKED_FILES_DIRTY="true"
zstyle ':omz:plugins:nvm' lazy yes
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
command -v pyenv >/dev/null && eval "$(pyenv init - zsh)"
eval "$(uv generate-shell-completion zsh)"
alias kubectl="microk8s kubectl"

# opencode
export PATH=/home/mhe/.opencode/bin:$PATH
