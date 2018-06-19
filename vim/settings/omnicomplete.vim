" enable omnicomlete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" setup omnicomplete for python
" autocmd FileType python setlocal omnifunc=jedi#completions

if has('nvim')
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
endif

" autocmd FileType python set omnifunc=YouCompleteMe#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
