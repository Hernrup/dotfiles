let g:Python3Syntax = 1

augroup filetype_python
    autocmd!
    autocmd FileType python setlocal colorcolumn=80
    " Prevent JEDI from showing docstrings automatically on autocomplete
    autocmd FileType python setlocal completeopt-=preview

    " We don't need smartindent in python. Makes comments always go to
    " the start of the line.
    autocmd FileType python setlocal nosmartindent
augroup END

function! RunTests(args)
    set makeprg=nosetests\ --with-terseout
    exec "make! " . a:args
endfunction

function! RunFlake()
    set makeprg=flake8
    exec "make!"
endfunction

function! JumpToError()
    if getqflist() != []
        for error in getqflist()
            if error['valid']
                break
            endif
        endfor
        let error_message = substitute(error['text'], '^ *', '', 'g')
        silent cc!
        if error['bufnr'] != 0
            exec ":sbuffer " . error['bufnr']
        endif
        call RedBar()
        echo error_message
    else
        call GreenBar()
        echo "All tests passed"
    endif
endfunction

function! RedBar()
    hi RedBar ctermfg=white ctermbg=red guibg=red
    echohl RedBar
    echon repeat(" ",&columns - 1)
    echohl None
endfunction

function! GreenBar()
    hi GreenBar ctermfg=white ctermbg=green guibg=green
    echohl GreenBar
    echon repeat(" ",&columns - 1)
    echohl None
endfunction

let python_highlight_all=1
syntax on
