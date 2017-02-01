call plug#begin()

" so ~/.vim/plugins/airline.vim
so ~/.vim/plugins/lightline.vim

" Mirror vim status bar theme to tmux
Plug 'edkolev/tmuxline.vim'

" Base16-colors
so ~/.vim/plugins/base16.vim

" extended % matching for HTML, LaTeX, and many more languages
Plug 'vim-scripts/matchit.zip'

" Colorschemes
Plug 'joshdick/onedark.vim'
Plug 'jnurmine/Zenburn'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'reedes/vim-colors-pencil'
Plug 'nanotech/jellybeans.vim'
Plug 'flazz/vim-colorschemes'

" Color pencil
so ~/.vim/plugins/pencil.vim

"ctrlp: File navigation
so ~/.vim/plugins/ctrlp.vim

" Directory navigation
Plug 'tpope/vim-vinegar'

" Surround text
Plug 'tpope/vim-surround'

" Commenting/uncommenting code
so ~/.vim/plugins/tComment.vim

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'

" LESS Syntax highlighting, indent, and autocompletion
Plug 'groenewege/vim-less', { 'for': 'less' }

" Misc functions needed by other plugins
Plug 'xolox/vim-misc'

"syntastic: Syntax check for several languages
so ~/.vim/plugins/syntastic.vim

" snippets
so ~/.vim/plugins/ultisnips.vim

" folding
so ~/.vim/plugins/fastfold.vim

" python docstrings
so ~/.vim/plugins/vim_pydocstring.vim

" Sercher
Plug 'rking/ag.vim'

" Salt support
Plug 'saltstack/salt-vim', { 'for': 'sls' }

" Better indentation for Python
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }

" Python matchit support
Plug 'voithos/vim-python-matchit', { 'for': 'python' }

" Highlighting for restructured text
Plug 'Rykka/riv.vim', { 'for': 'rst' }

" Javascript syntax
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" File tree
Plug 'scrooloose/nerdtree'

" Seamless navigation with tmux
Plug 'christoomey/vim-tmux-navigator'

" vimproc: Make it possible to execute programs within vim
so ~/.vim/plugins/vimproc.vim

" Jedi-vim
so ~/.vim/plugins/jedi-vim.vim

" autocompleation
" so ~/.vim/plugins/neocomplete.vim

" Tab completiom
" Plug 'ervandew/supertab'

" YouCompleteMe
so ~/.vim/plugins/ycm.vim

" cammel case movement
" Plug 'bkad/CamelCaseMotion'

" python3 default syntax
Plug 'hdima/python-syntax'

" Markdown
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
so ~/.vim/plugins/vim_table_mode.vim

call plug#end()
