func! myspacevim#before() abort
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
  autocmd FileType make setlocal tabstop=2 shiftwidth=2 softtabstop=0 noexpandtab indentkeys-=<:> indentkeys-=0#
endf

func! myspacevim#after() abort
endf 
