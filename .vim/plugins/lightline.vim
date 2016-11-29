Plug 'itchyny/lightline.vim'
let g:lightline = {
            \ 'colorscheme': 'PaperColor',
            \ 'component': {
            \  'readonly': '%{&readonly?"":""}',
            \ },
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'relativepath', 'modified' ] ]
            \ },
            \ 'inactive': {
            \    'left': [ [ 'relativepath' ] ]
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }
