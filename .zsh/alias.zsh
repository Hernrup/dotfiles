browser="python -m webbrowser -t"

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

# list
alias ls='ls -F --color'
alias ll='ls -l --color'
alias la='ls -lA --color'

# git
alias g='git'
alias gs='g s'
alias ga='g a'
alias gc='g c'
alias gca='g ca'
alias gd='g d'
alias go='g o'
alias gp='g p'
alias gpr='g pr'

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
alias wp="which python"
alias venv34="/usr/bin/virtualenv-3.4 venv"
alias rmvenv='rm -rf venv'
alias rednose="nosetests --rednose"

# Colors
alias bgl="mtc set solarized-light"
alias bgd="mtc set solarized-dark"

# Apps
alias lf='limefu'
alias mdprewiew="grip"
alias wman='winpty python manage.py'

# Other
alias cls='clear'
