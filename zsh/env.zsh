export TERM=xterm-256color
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

#
# Set language in shell
#
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"

#
# Enable vim bindings
#
# bindkey -v
# autoload edit-command-line; zle -N edit-command-line
# bindkey -M vicmd v edit-command-line
# export KEYTIMEOUT=1 # Reduce the timeout when presing keys to 0.x s
# bindkey -M viins 'jk' vi-cmd-mode


#
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

# end of line on up history with blank line
bindkey '\e[A' history-beginning-search-backward-end
bindkey '\e[B' history-beginning-search-forward-end
# only complete among matching lines in history if not blank line
bindkey '\eOA' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
# moving along the words in command line
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
# delete
bindkey "\C-_" backward-kill-word
bindkey "\e[3;5~" kill-word
bindkey "\e\d" undo
bindkey "\e[3~" delete-char
# home and end keys
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "e[1~" beginning-of-line
bindkey "e[4~" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line

# Remember history
HISTSIZE=1000
HISTFILE=~/.history
SAVEHIST=1000

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