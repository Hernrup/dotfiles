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

" Plug 'Shougo/vimproc.vim', {'do' : 'make -f make_cygwin.mak'}

