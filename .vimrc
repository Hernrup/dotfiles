
set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
execute pathogen#infect()

filetype plugin indent on
syntax on 

set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set number
set laststatus=3
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


let g:ctrlp_cmd = 'CtrlPCurWD'

" Quick ESC
imap jk <ESC>

nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" Quit with :Q
#command -nargs=0 Quit :qa!

#set background=dark
#colorscheme gruvbox
