" Turn on syntax highlighting
syntax on

" options
set encoding=utf-8
set smartindent
set autoindent
set expandtab
set tabstop=4
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
set wildmenu
set fileformat=unix " No crazy CR/LF
set ruler   " Show the line position at the bottom of the window
set scrolloff=4 " Minimum lines between cursor and window edge
set shiftwidth=4    " Indent by 4 columns
set textwidth=120   " Maximum line width
set whichwrap=<,>,[,],h,l " Allows for left/right keys to wrap across lines
set autochdir
set relativenumber

:set nocompatible

" Always show statusline
set laststatus=2

" Leader
"let mapleader="\"
let maplocalleader="\\"

" set history length
set history=200

" Easiear copy paste to system clipboard
set clipboard=unnamedplus


" Turn off error beeps and flashing
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" make that backspace key work the way it should
set backspace=indent,eol,start

" If compiler error refers to a file already open in a window,
" use that window instead of opening the file in the last active
" window.
set switchbuf=useopen

" performance
set lazyredraw
set ttyfast

