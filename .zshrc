source ~/.zsh/env.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/tmux.zsh
source ~/.zsh/load_prompt.zsh
source ~/.zsh/base16-shell.zsh
source ~/.zsh/alias.zsh

if [[ -n $(uname | egrep -i 'cygwin') ]]; then
    source ~/.zsh/alias.cygwin.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
