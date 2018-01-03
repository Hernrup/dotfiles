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
so ~/.vim/plugins/gitgutter.vim
" Plug 'mhinz/vim-signify'

" LESS Syntax highlighting, indent, and autocompletion
Plug 'groenewege/vim-less', { 'for': 'less' }

" Misc functions needed by other plugins
Plug 'xolox/vim-misc'

"syntastic: Syntax check for several languages
" so ~/.vim/plugins/syntastic.vim
so ~/.vim/plugins/ale.vim

" highlightning
so ~/.vim/plugins/python-syntax.vim

" snippets
so ~/.vim/plugins/ultisnips.vim

" folding
so ~/.vim/plugins/fastfold.vim
so ~/.vim/plugins/simplyfold.vim


" python docstrings
so ~/.vim/plugins/vim_pydocstring.vim

" Vimux
so ~/.vim/plugins/vimux.vim

" Indentendation guides
" so ~/.vim/plugins/indent-guides.vim

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

" Highlighting for json5
Plug 'gutenye/json5.vim', { 'for': 'json5' }

" Javascript syntax
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" File tree
so ~/.vim/plugins/nerdtree.vim

" Seamless navigation with tmux
Plug 'christoomey/vim-tmux-navigator'

" vimproc: Make it possible to execute programs within vim
so ~/.vim/plugins/vimproc.vim

" Jedi-vim
" so ~/.vim/plugins/jedi-vim.vim

" autocompleation
" so ~/.vim/plugins/neocomplete.vim

" Tab completiom
" Plug 'ervandew/supertab'

" YouCompleteMe
so ~/.vim/plugins/ycm.vim

" cammel case movement
" Plug 'bkad/CamelCaseMotion'

" Markdown
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
so ~/.vim/plugins/vim_table_mode.vim

" Debuger
Plug 'joonty/vdebug', { 'for': 'php' }

" Php syntax file
Plug 'StanAngeloff/php.vim', { 'for': 'php' }

" Typescript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

" Fussy lookup
" Plug 'junegunn/fzf'
set rtp+=~/.build/fzf

call plug#end()
