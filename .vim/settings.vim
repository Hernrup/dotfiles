so ~/.vim/settings/base.vim
so ~/.vim/settings/appearance.vim
so ~/.vim/settings/block_cursor_fix.vim
so ~/.vim/settings/colorcolumn.vim
so ~/.vim/settings/ctags.vim
so ~/.vim/settings/git.vim
so ~/.vim/settings/hardmode.vim
so ~/.vim/settings/keymap.vim
so ~/.vim/settings/markdown.vim
so ~/.vim/settings/mouse.vim
so ~/.vim/settings/omnicomplete.vim
so ~/.vim/settings/save.vim
so ~/.vim/settings/splits.vim
" so ~/.vim/settings/wildignore.vim
so ~/.vim/settings/python.vim
so ~/.vim/settings/termfix.vim

for fpath in split(globpath('~/.vim/settings/auto', '*.vim'), '\n')
  exe 'source' fpath
endfor

let NERDTreeIgnore = ['\.pyc$', 'tags', 'pycache', '\.egg-info$']
