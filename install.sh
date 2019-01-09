#!/usr/bin/env bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

ln -sbfv $SCRIPTPATH/.gitignore ~/.gitignore
ln -sbfv $SCRIPTPATH/.gitconfig ~/.gitconfig
ln -sbfv $SCRIPTPATH/.agignore ~/.agignore
ln -sbfv $SCRIPTPATH/.minttyrc ~/.minttyrc
ln -sbfv $SCRIPTPATH/.tmux.conf ~/.tmux.conf
ln -sbfv $SCRIPTPATH/.pdbrc ~/.pdbrc

ln -sbfv $SCRIPTPATH/.vimrc ~/.vimrc
ln -sbfvn $SCRIPTPATH/vim ~/.vim
ln -sbfvn $SCRIPTPATH/vim ~/.config/nvim

ln -sbfvn $SCRIPTPATH/emacs ~/.emacs.d
ln -sbfvn $SCRIPTPATH/.spacemacs ~/.spacemacs

ln -sbfvn $SCRIPTPATH/bin ~/bin

ln -sbfv $SCRIPTPATH/.zshrc ~/.zshrc
ln -sbfvn $SCRIPTPATH/zsh ~/.zsh

ln -sbfv $SCRIPTPATH/.ctags ~/.ctags

if [ ! -f ~/.gitconfig_local ]; then
    echo "Local gitconfig missing, creating"
    cp $SCRIPTPATH/.gitconfig_local ~/.gitconfig_local
fi

if [ ! -d ~/.config/base16-shell ]; then
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi
