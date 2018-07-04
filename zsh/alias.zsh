browser="python -m webbrowser -t"

# Reload profile after making changes
alias zshrel='echo "Reloading .zshrc..." && source ~/.zshrc'

# cd
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias cdg='cd_git_root'
alias cd_venv='cd_venv'
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
alias ppie='install_python_package_as_source'
alias ppir='pip install -r requirements.txt'
alias ppunsource="pip freeze | grep "^-e" | sed 's/.*#egg=\(.*\)-.*/\1/' | xargs pip uninstall -y"
alias ppclean="ppunsource; pip freeze | grep -v "^-e" | xargs pip uninstall -y"
alias ppf="pip freeze"
alias wp="which python"
alias venv="python3 -m venv venv"
alias rmvenv='rm -rf venv'
alias rednose="nosetests --rednose"

# Apps
alias lf='limefu'
alias mdprewiew="grip"
alias wman='python3 manage.py'

# Docker
alias d='docker'
alias dc='docker-compose'
alias dce='docker-compose exec'

# AWS
function aws_instances(){
    aws ec2 describe-instances --query 'Reservations[].Instances[].[PrivateIpAddress,Tags[?Key==`Name`].Value[]]' --output text --profile $1 | sed 's/None$/None\n/' | sed '$!N;s/\n/ /'
}

# Other
alias cls='clear'
