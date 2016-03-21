" Cygwin specific settings
" Use block cursor in normal mode
if has("win32unix")
    if exists('$TMUX')
        let &t_ti = "\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\"
        let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\"
        let &t_te = "\<Esc>Ptmux;\<Esc>\e[0 q\<Esc>\\"
    else
        let &t_ti.="\e[1 q"
        let &t_SI.="\e[5 q"
        let &t_EI.="\e[1 q"
        let &t_te.="\e[0 q"
    endif
endif