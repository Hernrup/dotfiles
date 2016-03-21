" Quick escape
inoremap jk <esc>

" Clear higlighting of words matching search
nnoremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Rebuild ctags
:nnoremap <silent> <F12> :echo "Rebuilding tags..."<cr>:!ctags .<cr>:echo "Rebuilt tags"<cr>

" Set current directory to currently open file.
nnoremap <leader>cd :lcd %:p:h<cr>

" JSON Formatting
nnoremap <leader>js :%!python -m json.tool<cr>

" Browse directory of file in current buffer
nnoremap <leader>ex :Explore<cr>

" Search with ag
nnoremap <leader>a :Ag ""<left>
nnoremap <leader>a :Ag<Space>

" Python tests
nnoremap <leader>ra :wa<cr>:call RunTests("")<cr>:redraw<cr>:call JumpToError()<cr>
nnoremap <leader>rf :wa<cr>:call RunFlake()<cr>:redraw<cr>:call JumpToError()<cr>

" nerdtree options
map <C-n> :NERDTreeToggle<CR>

" ctrlp
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>t :CtrlPTag<cr>

" reload vimrc"
nnoremap <leader>re :so $MYVIMRC<cr>