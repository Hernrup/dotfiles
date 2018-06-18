function _update_ps1()
{
    error=$?
    if [[ -s "/usr/local/bin/pypy" ]]; then
        export PROMPT="$(pypy ~/.zsh/prompt.py $error)"
    else
        export PROMPT="$(/usr/bin/python3 ~/.zsh/prompt.py $error)"
    fi
}
precmd()
{
    _update_ps1
}

local return_code="%(?..%{$fg[red]%}%? %{$reset_color%})"
export RPS1="${return_code}"

