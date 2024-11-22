export PAGER='less'

zstyle :compinstall filename '/home/mhe/.zshrc'

autoload -Uz compinit && compinit -i
autoload -U colors && colors

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

fpath=(~/.zsh/completion $fpath)
#
# Ensure user binaries are available.
#
export PATH=$PATH:${HOME}/bin
export PATH=$PATH:${HOME}/.local/bin

# Disable XOFF so that vim does not freeze on ctrl+s
stty start undef
stty stop undef
setopt noflowcontrol

# Fix for cursor at end of line and partial history in history list
# Also binds home, end and delete that are sometimes unbinded
#
autoload -U history-search-end
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
 
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Remember history
HISTSIZE=1000
HISTFILE=~/.history
SAVEHIST=1000

bindkey -v


# Set env to fix git prompt
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

export FZF_DEFAULT_COMMAND='ag -g ""'

export WORKON_HOME=~/envs
export VIRTUALENVWRAPPER_PYTHON=python3
mkdir -p $WORKON_HOME
# source ~/.local/bin/virtualenvwrapper.sh

export KUBECONFIG=~/.kube/config
# export KUBECONFIG=~/.kube/config:~/.kube/configs/mdc.conf:~/.kube/configs/local.conf:~/.kube/configs/minikube.conf
source <(kubectl completion zsh)

export GTAGSLABEL=ctags 
source ~/.cimp-complete.bash

# CAP tools
source /usr/local/bin/cap-tools-bash-extensions
export PATH=$PATH:${HOME}/repos/modelon/cap-tools/linux/package/usr/local/bin