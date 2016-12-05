# dotfiles
Misc setupfiles needed on multiple devices

## Software requiring manual Installations
- chocholate
- q-dir
- sqlserver
- visual studio
- redgate
- vista switcher
- taskbar eliminator
- sourcecode pro and powerline fonts
- pycharm
- balsamic
- linkshellextension
- hipchat

## Chocholate install for others
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

choco install google-chrome-x64 mingw conemu kdiff3 wireshark fiddler4 jre8 sublimetext3 ccleaner staruml filezilla putty git 7zip nodejs.install chocolateygui dotnet4.5 procmon procexp sysinternals python virtualbox curl wget baretail silverlight windirstat sourcetree cygwin

## Cygwin run command for zsh in tty
C:\tools\cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico /bin/zsh --login

## Install setup requirements
pip install -r requirements.txt

## Cygwin packages
python manage.py install-cygwin-packages-from-list

## Install dot files
python manage.py install-dot-files

## Install mintty-colors
```
/c/Python34 $pip install mintty-colors
```

## Remove bash completion if using zsh as it couses lag.
mv /etc/bash_completion.d -v /etc/bash_completion.d_bak

## install apt-cyg
lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /bin

## Install grip for markdown

## Install pypy for faster prompt
