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

# Set env to fix git prompt
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

export FZF_DEFAULT_COMMAND='ag -g ""'

export WORKON_HOME=~/envs
export VIRTUALENVWRAPPER_PYTHON=python3
mkdir -p $WORKON_HOME
# source ~/.local/bin/virtualenvwrapper.sh

export KUBECONFIG=.kubeconfig:~/.kube/config:~/.kube/mdc.conf:~/.kube/impact-ap.conf:~/.kube/local.conf
source <(kubectl completion zsh)

export GTAGSLABEL=ctags