for fpath in split(globpath('~/.vim/settings/enabled', '*.vim'), '\n')
  exe 'source' fpath
endfor
