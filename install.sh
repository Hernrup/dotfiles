#!/usr/bin/env bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

ln -sfv $SCRIPTPATH/.profile ~/.profile
ln -sfv $SCRIPTPATH/.gitignore ~/.gitignore
ln -sfv $SCRIPTPATH/.gitconfig ~/.gitconfig
ln -sfv $SCRIPTPATH/.agignore ~/.agignore

# ln -sfv $SCRIPTPATH/vscode/settings.json ~/.config/Code/User/settings.json
# ln -sfv $SCRIPTPATH/vscode/keybindings.json ~/.config/Code/User/keybindings.json

# ln -sfvn $SCRIPTPATH/regolith/i3 ~/.config/regolith/i3
# ln -sfv $SCRIPTPATH/regolith/Xresources ~/.config/regolith/Xresources

# ln -sfvn $SCRIPTPATH/spacevim ~/.SpaceVim.d

# ln -sfvn $SCRIPTPATH/.spacemacs ~/.spacemacs

ln -sfvn $SCRIPTPATH/bin ~/bin

ln -sfv $SCRIPTPATH/.zshrc ~/.zshrc
ln -sfvn $SCRIPTPATH/zsh ~/.zsh

ln -sfv $SCRIPTPATH/.ctags ~/.ctags

if [ ! -f ~/.gitconfig_local ]; then
    echo "Local gitconfig missing, creating"
    cp $SCRIPTPATH/.gitconfig_local ~/.gitconfig_local
fi

# if [ ! -d ~/.config/base16-shell ]; then
    # git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
# fi
