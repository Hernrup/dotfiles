call plug#begin()

" so ~/.vim/plugins/airline.vim
so ~/.vim/plugins/lightline.vim

" Mirror vim status bar theme to tmux
Plug 'edkolev/tmuxline.vim'

" Base16-colors
so ~/.vim/plugins/base16.vim

" extended % matching for HTML, LaTeX, and many more languages
Plug 'vim-scripts/matchit.zip'
"
"ctrlp: File navigation
so ~/.vim/plugins/ctrlp.vim

" Fussy lookup
Plug 'junegunn/fzf', { 'dir': '~/.build/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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

" LESS Syntax highlighting, indent, and autocompletion
Plug 'groenewege/vim-less', { 'for': 'less' }

" Misc functions needed by other plugins
Plug 'xolox/vim-misc'

"syntastic: Syntax check for several languages
" so ~/.vim/plugins/syntastic.vim
so ~/.vim/plugins/ale.vim

" highlightning
so ~/.vim/plugins/python-syntax.vim

" folding
so ~/.vim/plugins/fastfold.vim
so ~/.vim/plugins/simplyfold.vim


" python docstrings
so ~/.vim/plugins/vim_pydocstring.vim

" Vimux
so ~/.vim/plugins/vimux.vim

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
"
" YouCompleteMe
if has('nvim')
    so ~/.vim/plugins/deoplete.vim
else
    so ~/.vim/plugins/ycm.vim
endif

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


call plug#end()
