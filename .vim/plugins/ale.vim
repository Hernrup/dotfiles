Plug 'w0rp/ale'

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 1
let g:ale_statusline_format = ['✗ %d', '∆ %d', 'ok']
let g:ale_sign_column_always = 1
let g:ale_lint_delay = 200
let g:ale_open_list = 0

" Move in loc list
nmap <silent> <C-,> <Plug>(ale_previous_wrap)
nmap <silent> <C-.> <Plug>(ale_next_wrap)

set statusline+=%#warningmsg#
set statusline+=%{ALEGetStatusLine()}
set statusline+=%*
