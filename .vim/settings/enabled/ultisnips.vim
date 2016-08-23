" let g:UltiSnipsExpandTrigger="<c-."
" let g:UltiSnipsListSnippets="<c-/>"
" let g:UltiSnipsJumpForwardTrigger="<c-.>"
" let g:UltiSnipsJumpBackwardTrigger="<c-,>"
" inoremap <expr><c-e> "\<C-R>=UltiSnips#ExpandSnippet()\<CR>"
" inoremap <expr><c-e> "\<C-R>=UltiSnips#ExpandSnippetOrJump()\<CR>"
" inoremap <expr><c-;> "\<C-R>=UltiSnips#JumpBackwards()\<CR>"

function! g:UltiSnips_Complete()
	call UltiSnips#ExpandSnippet()
	if g:ulti_expand_res == 0
		if pumvisible()
			return "\<C-n>"
		else
			call UltiSnips#JumpForwards()
			if g:ulti_jump_forwards_res == 0
				return "\<TAB>"
			endif
		endif
	endif
	return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
