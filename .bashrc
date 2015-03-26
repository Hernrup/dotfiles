#
# Alias
#

# misc
alias less='less -r'

# list
alias ls='ls -F --color --show-control-chars'
alias ll='ls -l --color'
alias la='ls -lA --color'

# cd
alias cdtng='cd /c/dev/lime/limetng/'
alias cdlime='cd /c/dev/lime/'
alias cddev='cd /c/dev/'
alias suptng='cmd //c /c/dev/lime/limetng/setup.bat'
alias supdev='setup.py develop'

# git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git remote'

# apps
alias subl='/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe'
alias nano='/c/Program\ Files\ \(x86\)/Git/bin/nano/nano.exe'
alias pycharm='/c/Program\ Files\ \(x86\)/JetBrains/PyCharm\ Community\ Edition\ 4.0.4/bin/pycharm.exe'

# lime
alias lws='/c/dev/lime/addons/addon-webservice/src/Lundalogik.Tangelo.ConsoleHost/bin/Debug/Lundalogik.Tangelo.ConsoleHost.exe'
alias lclient='/c/dev/lime/desktop-client/src/debug/lime.exe'
alias lwebclient='python -mwebbrowser https://1zwlwz1/'
alias lvenv='source /c/dev/lime/limetng/Python34/Scripts/activate; which python'
alias lserver='limefu run web'

# devpi
alias devpi_usedev='devpi use https://lusrvdevweb.lundalogik.local:3443/lime/develop'
alias devpi_login='devpi login lime'

# python
alias killpython='cmd //c "taskkill /F /IM python.exe /T"'

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
