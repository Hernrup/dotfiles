Plug 'itchyny/lightline.vim'
let g:lightline = {
            \ 'colorscheme': 'PaperColor',
            \ 'component': {
            \  'readonly': '%{&readonly?"":""}',
            \ },
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'relativepath', 'modified', 'lint'] ]
            \ },
            \ 'inactive': {
            \    'left': [ [ 'relativepath' ] ]
            \ },
            \ 'component_function': {
            \   'lint': 'Lightline_lint'
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

function! Lightline_lint()
    return ALEGetStatusLine()
endfunction
