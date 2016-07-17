call plug#begin()

Plug 'bling/vim-airline'

" Mirror vim status bar theme to tmux
Plug 'edkolev/tmuxline.vim'

" extended % matching for HTML, LaTeX, and many more languages
Plug 'vim-scripts/matchit.zip'

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'joshdick/onedark.vim'
Plug 'jnurmine/Zenburn'
Plug 'NLKNguyen/papercolor-theme'

"ctrlp: File navigation
Plug 'ctrlpvim/ctrlp.vim'

Plug 'tpope/vim-vinegar'

" Surround text
Plug 'tpope/vim-surround'

" Commenting/uncommenting code
Plug 'tomtom/tcomment_vim'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'

" LESS Syntax highlighting, indent, and autocompletion
Plug 'groenewege/vim-less', { 'for': 'less' }

" Misc functions needed by other plugins
Plug 'xolox/vim-misc'

"syntastic: Syntax check for several languages
Plug 'scrooloose/syntastic', { 'for': 'python' }

Plug 'SirVer/ultisnips'

Plug 'Konfekt/FastFold'

Plug 'rking/ag.vim'

Plug 'saltstack/salt-vim', { 'for': 'sls' }

" Better indentation for Python
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }

" Python matchit support
Plug 'voithos/vim-python-matchit', { 'for': 'python' }

" Highlighting for restructured text
Plug 'Rykka/riv.vim', { 'for': 'rst' }

Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

Plug 'scrooloose/nerdtree',  { 'for': 'python' }

Plug 'christoomey/vim-tmux-navigator'

" vimproc: Make it possible to execute programs within vim (requires compilation)
Plug 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

Plug 'jensgustafsson/jedi-vim'
" Plug 'davidhalter/jedi-vim'
Plug 'Shougo/neocomplete'
" Plug 'Valloric/YouCompleteMe'
" Plug 'ervandew/supertab'

Plug 'bkad/CamelCaseMotion'
Plug 'hdima/python-syntax'
call plug#end()
