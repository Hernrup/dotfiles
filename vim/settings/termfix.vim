if &term =~ '256color'
    " Fixing Vim's Background Color Erase for 256-color tmux and GNU screen 
    " https://sunaku.github.io/vim-256color-bce.html
    " This setting must be applied after `set term=xterm-256color`. (If it is set)
    set t_ut=
endif

