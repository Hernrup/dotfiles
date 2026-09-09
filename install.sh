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

ln -sfvn $SCRIPTPATH/nvim ~/.config/nvim

mkdir -p ~/.claude
ln -sfv $SCRIPTPATH/claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -sfv $SCRIPTPATH/claude/RTK.md ~/.claude/RTK.md

ln -sfvn $SCRIPTPATH/bin ~/bin

ln -sfv $SCRIPTPATH/.zshrc ~/.zshrc
ln -sfvn $SCRIPTPATH/zsh ~/.zsh

# ln -sfv $SCRIPTPATH/.ctags ~/.ctags

if [ ! -f ~/.gitconfig_local ]; then
    echo "Local gitconfig missing, creating"
    cp $SCRIPTPATH/.gitconfig_local ~/.gitconfig_local
fi

# if [ ! -d ~/.config/base16-shell ]; then
    # git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
# fi

# --- terminal IDE binaries -------------------------------------------------
# Kept in ~/.local/bin rather than apt: Ubuntu ships nvim 0.9.5, LazyVim needs 0.11+.
#
# Note: npm may default to an internal registry reachable only on VPN. Mason
# installs npm-based servers (vtsls, prettier, eslint) and will fail off VPN;
# work around it per-command, without changing npm config:
#   npm_config_registry=https://registry.npmjs.org nvim -c 'Mason'
mkdir -p ~/.local/bin

# fetch_bin <name> <url> [tar-path]  -- skips if already installed
fetch_bin() {
    local name=$1 url=$2 tarpath=${3:-}
    [ -x ~/.local/bin/$name ] && return 0
    echo "installing $name"
    if [ -n "$tarpath" ]; then
        curl -fsSL "$url" | tar xz -C /tmp
        mv "/tmp/$tarpath" ~/.local/bin/$name
        rm -rf "/tmp/$(dirname "$tarpath")"
    elif [ "${url##*.}" = "gz" ]; then
        curl -fsSL "$url" | gunzip > ~/.local/bin/$name
    else
        curl -fsSL -o ~/.local/bin/$name "$url"
    fi
    chmod +x ~/.local/bin/$name
}

NVIM_VER=v0.12.5
fetch_bin nvim "https://github.com/neovim/neovim/releases/download/$NVIM_VER/nvim-linux-x86_64.appimage"

# LazyVim's grep needs a real rg; the interactive `rg` is a Claude Code shim
RG_VER=$(curl -sL https://api.github.com/repos/BurntSushi/ripgrep/releases/latest | grep '"tag_name"' | cut -d'"' -f4)
fetch_bin rg "https://github.com/BurntSushi/ripgrep/releases/download/$RG_VER/ripgrep-$RG_VER-x86_64-unknown-linux-musl.tar.gz" \
    "ripgrep-$RG_VER-x86_64-unknown-linux-musl/rg"

# required by Snacks.picker.explorer()
FD_VER=$(curl -sL https://api.github.com/repos/sharkdp/fd/releases/latest | grep '"tag_name"' | cut -d'"' -f4)
fetch_bin fd "https://github.com/sharkdp/fd/releases/download/$FD_VER/fd-$FD_VER-x86_64-unknown-linux-musl.tar.gz" \
    "fd-$FD_VER-x86_64-unknown-linux-musl/fd"

# some treesitter parsers (css, scss, vue) must be generated, not just compiled
TS_VER=$(curl -sL https://api.github.com/repos/tree-sitter/tree-sitter/releases/latest | grep '"tag_name"' | cut -d'"' -f4)
fetch_bin tree-sitter "https://github.com/tree-sitter/tree-sitter/releases/download/$TS_VER/tree-sitter-linux-x64.gz"

# LazyVim's <leader>gg git UI
LG_VER=$(curl -sL https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep '"tag_name"' | cut -d'"' -f4)
fetch_bin lazygit "https://github.com/jesseduffield/lazygit/releases/download/$LG_VER/lazygit_${LG_VER#v}_linux_x86_64.tar.gz" \
    "lazygit"

# rendered markdown in a herdr pane, via bin/mdpane
GLOW_VER=$(curl -sL https://api.github.com/repos/charmbracelet/glow/releases/latest | grep '"tag_name"' | cut -d'"' -f4)
fetch_bin glow "https://github.com/charmbracelet/glow/releases/download/$GLOW_VER/glow_${GLOW_VER#v}_Linux_x86_64.tar.gz" \
    "glow_${GLOW_VER#v}_Linux_x86_64/glow"
