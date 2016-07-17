let g:jedi#popup_select_first = 1
let g:jedi#popup_on_dot = 1
let g:jedi#goto_command = "<leader>g"
let g:jedi#get_definitions_command = "<leader>d"
let g:jedi#rename_command = "<leader>r"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completion_command = "<C-Space>"
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 1


if jedi#init_python()
  function! s:jedi_auto_force_py_version() abort
    let major_version = pyenv#python#get_internal_major_version()
    call jedi#force_py_version(major_version)
  endfunction
  augroup vim-pyenv-custom-augroup
    autocmd! *
    autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
    autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
  augroup END
endif