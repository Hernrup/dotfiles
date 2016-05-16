
setopt PROMPT_SUBST

local PATH_BG=237  # dark grey
local PATH_FG=250  # light grey
local CWD_FG=254  # nearly-white grey
local SEPARATOR_FG=244

local REPO_CLEAN_BG=148  # a light green color
local REPO_CLEAN_FG=0  # black
local REPO_DIRTY_BG=161  # pink/red
local REPO_DIRTY_FG=15  # white

local CMD_PASSED_BG=236
local CMD_PASSED_FG=15
local CMD_FAILED_BG=161
local CMD_FAILED_FG=15

local SVN_CHANGES_BG=148
local SVN_CHANGES_FG=22  # dark green

local VIRTUAL_ENV_BG=35  # a mid-tone green
local VIRTUAL_ENV_FG=22


function venv_prompt_info() {
    if is_python_active; then
        local venv_path=`basename "$VIRTUAL_ENV/.."(:A)`
        echo "%{$bg[blue]%}%{$fg_bold[yellow]%}  %{$reset_color%}"
    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%K{${REPO_DIRTY_BG}}%F{${REPO_DIRTY_FG}} + "
ZSH_THEME_GIT_PROMPT_CLEAN="%K{${REPO_CLEAN_BG}}%F{${REPO_CLEAN_FG}}"

# get the name of the branch we are on
function git_prompt_info() {
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty)  ${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
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

function reset(){
    echo %{$reset_color%}
}

function cur_dir_info(){
    echo %K{${PATH_BG}%F{${PATH_FG}}%~ %{$reset_color%}
}

local return_code="%(?..%{$fg[red]%}%? %{$reset_color%})"
local curr_time="%{$fg[green]%}%*"
local curr_dir='$(cur_dir_info)'
local git_branch='$(git_prompt_info)'
local venv_info='$(venv_prompt_info)'

export PROMPT="${curr_dir}${git_branch}${venv_info}%{$reset_color%}
→ "
export RPS1="${return_code}"
