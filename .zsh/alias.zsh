browser="python -m webbrowser -t"
program_files_x86="/cygdrive/c/Program\ Files\ \(x86\)"
program_files="/cygdrive/c/Program\ Files"

# Reload profile after making changes
alias zshrel='echo "Reloading .zshrc..." && source ~/.zshrc'

# cd
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias cdg='cd_git_root'
alias cd='cd_venv'
alias cddev="cd ~/src/"

# misc
alias less='less -r'
alias cmd='cygstart --action=runas ~/bin/start_cmd.bat'

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

# python
alias py='python'
alias delegg='rm -rf *.egg*'
alias ppu='pip uninstall -y'
alias ppi='pip install'
alias ppie='install_python_package_as_source_for_windows'
alias ppir='pip install -r requirements.txt'
alias ppunsource="pip freeze | grep "^-e" | sed 's/.*#egg=\(.*\)-.*/\1/' | xargs pip uninstall -y"
alias ppclean="ppunsource; pip freeze | grep -v "^-e" | xargs pip uninstall -y"
alias ppf="pip freeze"
alias ppfw="pip freeze | sed 's/^M$//'"
alias wp="which python"
alias venv34="/cygdrive/c/python34/scripts/virtualenv venv"
alias venv34cw="/usr/bin/virtualenv-3.4 venv"
alias rmvenv='rm -rf venv'
alias ipython3='console.exe ipython3'
alias python3='python'
alias ipython='EDITOR=$(cygpath -w /usr/bin/vim) winpty ipython3'
alias nt="console.exe nosetests"
alias devpi="console.exe devpi"
alias py="winpty python"
alias rednose="console.exe nosetests --rednose"
alias nosetests="console.exe nosetests"

# Colors
alias bgl="/cygdrive/c/python34/scripts/mtc set solarized-light"
alias bgd="/cygdrive/c/python34/scripts/mtc set solarized-dark"

# apps
alias subl="$program_files/Sublime\ Text\ 3/sublime_text.exe"
alias pycharm="cygstart $program_files_x86/JetBrains/PyCharm\ 2016.1.2/bin/pycharm.exe $(cygpath -w -m ${$(pwd)}) 2>/dev/null &"
alias node="console.exe node"
alias vagrant="console.exe /c/HashiCorp/Vagrant/bin/vagrant.exe"
alias mdprewiew="grip"

# kill stuff
alias killpython="taskkill /F /IM python.exe /T"
alias killw='taskkill /F /PID'
alias killall='taskkill /F /T /IM'

# Lime stuff
lime_dir="/cygdrive/c/src"
alias cdlimedata="cd $c/ProgramData/Lundalogik/LIME\ Pro\ Server/"
alias lisaserver="console.exe $lime_dir/limeworld/serveradmin/Server/Lundalogik.Lisa.Service.ConsoleHost/bin/Debug/LisaConsole.exe"
alias tngclient="$browser \"https://localhost/\""
alias desktopclient="open $lime_dir/desktop-client/src/Debug/Lime.exe"
alias lf='console.exe limefu'
alias wman='winpty python manage.py'

# Other
alias open='cygstart'
alias cls='clear'
