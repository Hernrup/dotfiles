program_files_x86="/c/Program\ Files\ (x86)"
program_files="/c/Program\ Files"
browser="python -m webbrowser -t"

#
# Alias
#

# misc
alias less='less -r'

# list
alias ls='ls -F --color'
alias ll='ls -l --color'
alias la='ls -lA --color'

# git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --amend'
alias gd='git diff'
alias go='git checkout'
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git'
alias get='git'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git remote'
alias ggh="git rev-list --all | xargs git grep"
alias gbrm='git branch --merged | grep -v \* | xargs git branch -D'

# apps
alias subl='/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe'
alias nano='/c/Program\ Files\ \(x86\)/Git/bin/nano/nano.exe'
alias pycharm='/c/Program\ Files\ \(x86\)/JetBrains/PyCharm\ Community\ Edition\ 4.0.4/bin/pycharm.exe'

# python
alias killpython='cmd //c "taskkill /F /IM python.exe /T"'
alias delegg='rm -rf *.egg*'
alias ppu='pip uninstall'
alias ppi='pip install'
alias ppie='pip install -e'
alias ppclean='pip freeze | xargs pip uninstall -y'
alias venv34='/c/python34/scripts/virtualenv venv'
alias rmvenv='mkdir emptyTmpFolder && robocopy emptyTmpFolder venv //MIR && rm -rf emptyTmpFolder && rm -rf venv'

#
# ENVIRONMENT
#
export PYTHONIOENCODING=UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"

#
# CERTIFICATES
#
export REQUESTS_CA_BUNDLE=/c/Program\ Files\ \(x86\)/Git/bin/curl-ca-bundle.crt

#
# FUNCTIONS
#
# Use a different file for functions
if [ -f "${HOME}/.bash_functions" ]; then
  source "${HOME}/.bash_functions"
fi

#
# Display a more informational prompt.
#
function _update_ps1 {
    local error_level=$?
    local has_python=0
    [[ -n `__active_python` ]] && has_python=1
    export PS1="$(PYTHONIOENCODING=utf-8 python ~/bash_prompt.py $error_level $has_python 2> /dev/null)"
}

export PROMPT_COMMAND="_update_ps1"

# include local settings if extists
if [ -f "${HOME}/.bash_local" ]; then
  source "${HOME}/.bash_local"
fi
