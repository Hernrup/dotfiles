function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        silent !build_dir=$(mktemp -d)
        silent !pushd $build_dir
        silent !cmake . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp
        silent !cmake --build . --target ycm_core
        silent !popd
    endif
endfunction

" Plug 'Valloric/YouCompleteMe'
Plug 'joakimkarlsson/YouCompleteMe', {'do': function('BuildYCM') }

let g:ycm_server_keep_logfiles = 1
let g:ycm_python_binary_path = 'python'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_auto_trigger = 1
let g:ycm_key_invoke_completion = '<C-\>'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
