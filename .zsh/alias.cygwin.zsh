program_files_x86="/cygdrive/c/Program\ Files\ \(x86\)"
program_files="/cygdrive/c/Program\ Files"

# misc
alias cmd='cygstart --action=runas ~/bin/start_cmd.bat'
alias open='cygstart'

#
# python
alias ppfw="pip freeze | sed 's/^M$//'"
alias venv34="/cygdrive/c/python34/scripts/virtualenv venv"
alias venv34cw="/usr/bin/virtualenv-3.4 venv"
alias devpi="winpty devpi"
alias py="winpty python"
alias rednose="winpty nosetests --rednose"
alias nosetests="winpty nosetests"
alias ipython3='winpty ipython3'
alias python3='python'

# Colors
alias bgl="/cygdrive/c/python34/scripts/mtc set solarized-light"
alias bgd="/cygdrive/c/python34/scripts/mtc set solarized-dark"

# apps
alias subl="$program_files/Sublime\ Text\ 3/sublime_text.exe"
alias pycharm="cygstart $program_files_x86/JetBrains/PyCharm\ 2016.1.2/bin/pycharm.exe $(cygpath -w -m ${$(pwd)}) 2>/dev/null &"
alias node="console.exe node"
alias vagrant="console.exe /c/HashiCorp/Vagrant/bin/vagrant.exe"

# kill stuff
alias killpython="taskkill /F /IM python.exe /T"
alias killw='taskkill /F /PID'
alias killall='taskkill /F /T /IM'
alias killlime='killall java.exe && killpython && killall node.exe'

# Lime stuff
lime_dir="/c/src"
alias cdlimedata="cd $c/ProgramData/Lundalogik/LIME\ Pro\ Server/"
alias lisaserver="console.exe $lime_dir/limeworld/serveradmin/Server/Lundalogik.Lisa.Service.ConsoleHost/bin/Debug/LisaConsole.exe"
alias tngclient="$browser \"https://localhost/\""
alias desktopclient="open $lime_dir/desktop-client/src/Debug/Lime.exe"
alias lf='console.exe limefu'

