func! myspacevim#before() abort
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
endf 

func! myspacevim#after() abort
endf 
