Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -oc --exclude-standard']
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_working_path_mode = 'ra'

" ctrlp
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
