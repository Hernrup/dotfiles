" Load plugins
so ~/.vim/plugins.vim

" load settings
so ~/.vim/settings.vim

" load base16 colors
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif
