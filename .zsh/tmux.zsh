# Tell tmux to always expect 256 colors
alias tmux='tmux -2'
alias tma='attach_shared_session_to_default_tmux_session'
alias tms='open_tmux_project'
alias tmsu='open_tmux_window_without_project'
alias tmst='open_tmux_project_for_test'

local SESSIONNAME="DEF"

function create_defult_tmux_session() {
    tmux has-session -t $SESSIONNAME &> /dev/null
    if [ $? != 0 ]; then
        echo "Session $SESSIONNAME not found. Creating it..."
        tmux new-session -s $SESSIONNAME -d
    fi
}

function attach_to_tmux_default_session(){
    create_defult_tmux_session
    tmux attach-session -t $SESSIONNAME &> /dev/null
}

function attach_shared_session_to_default_tmux_session(){
    create_defult_tmux_session
    tmux new-session -t $SESSIONNAME &> /dev/null
}

function open_tmux_project_for_test() {
    local PROJ_PATH=$1:A
    local PROJNAME="$PROJ_PATH:t_T"
    open_tmux_window $PROJ_PATH $PROJNAME
}

function open_tmux_project() {
    local PROJ_PATH=$1:A
    local PROJNAME="$PROJ_PATH:t"
    open_tmux_window $PROJ_PATH $PROJNAME
}

function open_tmux_window_without_project() {
    local tmp_path="`pwd`"
    local PROJ_PATH=$tmp_path:A
    local PROJNAME="$1"
    echo "Project path: $PROJ_PATH"
    echo "Project name: $PROJNAME"
    tmux new-window -n $PROJNAME -c $PROJ_PATH
}

function open_tmux_window(){
    local PROJ_PATH=$1
    local PROJNAME=$2
    echo "Project name: $PROJNAME"
    echo "Project path: $PROJ_PATH"
    # Check if we already have a window for the project
    # If not, create a new window. Otherwise, select the exisiting one.
    tmux list-windows -t DEF | grep "^[[:digit:]]\+: $PROJNAME.\? " &> /dev/null
    if [ $? != 0 ]; then
        echo "$PROJNAME has no current window. Creating..."
        tmux new-window -n $PROJNAME -c $PROJ_PATH
    else
        echo "$PROJNAME has an open window. Selecting it..."
        tmux select-window -t $PROJNAME
    fi
}

