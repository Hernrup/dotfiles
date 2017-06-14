program_files_x86="/cygdrive/c/Program\ Files\ \(x86\)"
program_files="/cygdrive/c/Program\ Files"

# misc
alias cmd='cygstart --action=runas ~/bin/start_cmd.bat'
alias open='cygstart'

#
# python
alias ppfw="pip freeze | sed 's/^M$//'"
alias venv="/cygdrive/c/python34/scripts/virtualenv venv"
alias venvcw="/usr/bin/virtualenv-3.4 venv"
alias devpi="winpty devpi"
alias py="winpty python"
alias rednose="winpty nosetests --rednose"
alias nosetests="winpty nosetests"
alias ipython3='winpty ipython3'
alias python3='python'
alias ppie='install_python_package_as_source_for_windows'

# Colors
alias bgl="/cygdrive/c/python34/scripts/mtc set solarized-light"
alias bgd="/cygdrive/c/python34/scripts/mtc set solarized-dark"

# apps
alias subl="$program_files/Sublime\ Text\ 3/sublime_text.exe"
alias pycharm="cygstart $program_files_x86/JetBrains/PyCharm\ 2016.1.2/bin/pycharm.exe $(cygpath -w -m ${$(pwd)}) 2>/dev/null &"
alias node="winpty node"
alias vagrant="winpty /cygdrive/c/HashiCorp/Vagrant/bin/vagrant.exe"
alias wman='winpty python manage.py'

# kill stuff
alias killpython="taskkill /F /IM python.exe /T"
alias killw='taskkill /F /PID'
alias killall='taskkill /F /T /IM'
alias killlime='killall java.exe && killpython && killall node.exe'

# Lime stuff
lime_dir="/cygdrive/c/src"
alias cdlimedata="cd /cygdrive/c/ProgramData/Lundalogik/LIME\ Pro\ Server/"
alias lisaserver="winpty $lime_dir/limeworld/serveradmin/Server/Lundalogik.Lisa.Service.ConsoleHost/bin/Debug/LisaConsole.exe"
alias tngclient="$browser \"https://localhost/\""
alias desktopclient="open $lime_dir/desktop-client/src/Debug/Lime.exe"
alias lf='winpty limefu'

# WSL stuff
alias wsl_ssh_run="winpty /c/Windows/System32/bash.exe -c 'sudo /usr/sbin/sshd -D'"
alias wsl_ssh="ssh localhost -p 2223"
