
setopt PROMPT_SUBST

function venv_prompt_info() {
    if is_python_active; then
        local venv_path=`basename "$VIRTUAL_ENV/.."(:A)`
        echo "%{$fg[blue]%}% with %{$fg_bold[yellow]%} $venv_path%{$reset_color%}"
    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗%{$fg[blue]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

# get the name of the branch we are on
function git_prompt_info() {
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    #echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_CLEAN$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
function parse_git_dirty() {
    local STATUS=''
    local FLAGS
    FLAGS=('--porcelain')

    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
        FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
        FLAGS+='--untracked-files=no'
    fi

    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)

    if [[ -n $STATUS ]]; then
        echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
    else
        echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
    fi
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local curr_time="%{$fg[green]%}%*"
local curr_dir="%{$fg[green]%}%~"
local git_branch='%{$fg[blue]%}$(git_prompt_info)%{$reset_color%}'
local venv_info='$(venv_prompt_info)'

export PROMPT="%{$fg[blue]%}%{$fg[green]%}${curr_dir}%{$reset_color%} ${git_branch} ${venv_info} %{$fg[blue]%} %{$reset_color%}
$ "
export RPS1="${return_code}"
