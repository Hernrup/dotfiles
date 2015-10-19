#!/bin/bash

# Make user binaries available
[[ -d "${HOME}/bin" ]] && export PATH=$PATH:~/bin

#
# DETERMINE SYS VERSION
#
case "$(uname -s)" in
Darwin)
     echo 'Detected Mac OS X'
     sys='macosx'
     ;;
Linux)
     echo 'Detected Linux'
     sys='linux'
     ;;
CYGWIN*)
    echo 'Detected Cygwin'
    sys='cygwin'
    ;;
MINGW32*|MINGW64*|MSYS*)
    echo 'Detected MSYS/MinGW'
    sys='msys'
    ;;
*)
    echo 'Unknown operating system'
    sys='NA'
    ;;
esac

#
# ENVIRONMENT
#
source "${HOME}/.bash/env"

#
# ALIAS
#
source "${HOME}/.bash/alias"

#
# FUNCTIONS
#
source "${HOME}/.bash/functions"

#
# LOCAL CONF
#
# include local settings if extists
if [ -f "${HOME}/.bash_local" ]; then
  source "${HOME}/.bash_local"
fi

#
# SYS SPECIFIC .bashrc
#
case "$sys" in
cygwin)
     source "${HOME}/.bash/env.cygwin";
     ;;
msys)
     source "${HOME}/.bash/env.msys"
     ;;
esac
