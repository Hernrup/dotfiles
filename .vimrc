" vim:foldmethod=marker

" Setting up NeoBundle --------------------------------------------------{{{
if has('vim_starting')
	set nocompatible
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
" }}}

" Plugins ----------------------------------------------------------------{{{
NeoBundleFetch 'Shougo/neobundle.vim'

" Better status bar
NeoBundle "bling/vim-airline"
let g:airline_powerline_fonts=1

" extended % matching for HTML, LaTeX, and many more languages
NeoBundle 'vim-scripts/matchit.zip'

" Colorschemes
NeoBundle 'tomasr/molokai'
NeoBundle 'nielsmadan/harlequin'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'ajh17/Spacegray.vim'

"{{{ ctrlp: File navigation
NeoBundle 'ctrlpvim/ctrlp.vim'
"
" I'm almost always using vim with git anyway...
"
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = ''
"}}}

NeoBundle 'tpope/vim-vinegar'

" Surround text
NeoBundle 'tpope/vim-surround.git'

" Commenting/uncommenting code
NeoBundle 'tomtom/tcomment_vim.git'

" Git integration
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'int3/vim-extradite.git'

" LESS Syntax highlighting, indent, and autocompletion
NeoBundleLazy 'groenewege/vim-less.git'
autocmd FileType less NeoBundleSource vim-less

" Misc functions needed by other plugins
NeoBundle 'xolox/vim-misc.git'

"{{{ syntastic: Syntax check for several languages
NeoBundle 'scrooloose/syntastic.git'
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "☣"
let g:syntastic_warning_symbol = "☠"
let g:syntastic_style_error_symbol = "💩"
let g:syntastic_style_warning_symbol = "✗"
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['python', 'flake8', 'pep8']
"}}}


NeoBundle 'SirVer/ultisnips'

NeoBundle 'Konfekt/FastFold'
let g:fastfold_fold_command_suffixes =
            \['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']

"
" Python
"

" Better indentation for Python
NeoBundleLazy 'hynek/vim-python-pep8-indent'
autocmd FileType python NeoBundleSource vim-python-pep8-indent


" Python matchit support
NeoBundleLazy 'voithos/vim-python-matchit'
autocmd FileType python NeoBundleSource vim-python-matchit

" Highlighting for restructured text
NeoBundleLazy 'Rykka/riv.vim'
autocmd FileType rst NeoBundleSource riv.vim

NeoBundle 'christoomey/vim-tmux-navigator'

" Python aoutocompletion with JEDI
" NeoBundle 'davidhalter/jedi-vim'

"
" JavaScript
"
NeoBundleLazy 'pangloss/vim-javascript'
au FileType javascript NeoBundleSource vim-javascript

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
" }}}

" Leaders {{{
let mapleader=" "
let maplocalleader="\\"
" }}}

" Key Mappings {{{

" Quick escape
inoremap jk <esc>

nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>t :CtrlPTag<cr>

" Clear higlighting of words matching search
nnoremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Rebuild ctags
:nnoremap <silent> <F12> :echo "Rebuilding tags..."<cr>:!ctags .<cr>:echo "Rebuilt tags"<cr>

" Shortcut to edit .vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>

" Set current directory to currently open file.
nnoremap <leader>cd :lcd %:p:h<cr>

" JSON Formatting
nnoremap <leader>js :%!python -m json.tool<cr>

" Browse directory of file in current buffer
nnoremap <leader>ex :Explore<cr>

" Search with ag
nnoremap <leader>a :Ag ""<left>

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" }}}


" Options {{{
syntax on " Turn on syntax highlighting

set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set number
set laststatus=2
set autowrite           " Automatically save buffer
set number
set incsearch
set scrolloff=3         " keep 3 lines when scrolling
set showcmd             " display incomplete commands
set nobackup            " do not keep a backup file
set nowritebackup
set noswapfile
set hlsearch            " highlight searches
set showmatch           " jump to matches when entering regexp
set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present
set encoding=utf-8

"
" Easiear copy paste to system clipboard
"
set clipboard=unnamed


"
" Turn off error beeps and flashing
"
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set backspace=indent,eol,start  " make that backspace key work the way it should

"
" Patterns to ignore for ctrlp etc.
"
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*.o,*.pyc
set wildignore+=*/node_modules/*,*/bower_components/*,*/venv/*,*/Python34/*

"
" If compiler error refers to a file already open in a window,
" use that window instead of opening the file in the last active
" window.
"
set switchbuf=useopen



" }}}

" Python Settings {{{

augroup filetype_python
    autocmd!
    autocmd FileType python setlocal colorcolumn=80
    " Prevent JEDI from showing docstrings automatically on autocomplete
    autocmd FileType python setlocal completeopt-=preview

    " We don't need smartindent in python. Makes comments always go to
    " the start of the line.
    autocmd FileType python setlocal nosmartindent
augroup END

" }}}

" Appearance {{{

colorscheme molokai
" let g:rehash256 = 1
set background=dark
highlight! link MatchParen StatusLine

set list                " Display special characters (e.g. trailing whitespace)
set listchars=tab:▷◆,trail:◆

"
" Only display trailing whitespaces when we're not in insert mode
"
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:◆
    au InsertLeave * :set listchars+=trail:◆
augroup END

if has('gui_running')
    set guioptions=-Mc

    if has('win32') || has('win64')
        set guifont=Source_Code_Pro_Medium:h10:cANSI
    elseif has('macunix')
        set guifont=Source\ Code\ Pro\ Medium:h16
    endif

else
    "
    " Make vim display colors and fonts properly
    "
    if has("win32unix") || has("macunix")
        set term=xterm-256color
        set t_ut=
    else
        set termencoding=ut8
        set term=xterm
        set t_Co=256
        let &t_AB="\e[48;5;%dm"
        let &t_AF="\e[38;5;%dm"
        let &t_ZH="\e[3m"
    endif
endif

set cursorline
if &background == 'light'
    highlight CursorLine cterm=NONE ctermbg=LightGray ctermfg=NONE
else
    highlight CursorLine cterm=NONE ctermbg=233 ctermfg=NONE
    highlight colorcolumn ctermbg=235
endif

" }}}
