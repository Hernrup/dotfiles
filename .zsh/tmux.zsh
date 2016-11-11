# Tell tmux to always expect 256 colors
alias tmux='tmux -2'
alias tma='tmux attach'
alias tms='open_tmux_session_for_project'
alias tmw='open_tmux_window_for_project'
alias tms2='open_tmux_connected_session'
alias tmsk='kill_tmux_session'


function create_tmux_session() {
    local SESSIONNAME="DEF"
    tmux has-session -t $SESSIONNAME &> /dev/null
    if [ $? != 0 ]; then
        echo "Session $SESSIONNAME not found. Creating it..."
        tmux new-session -s $SESSIONNAME -d
    fi
}

function open_tmux_window_for_project() {
    local PROJ_PATH=$1:A
    local PROJNAME="$PROJ_PATH:t"
    open_tmux_window $PROJ_PATH $PROJNAME
}

function open_tmux_session_for_project() {
    local PROJ_PATH=$1:A
    local PROJNAME="$PROJ_PATH:t"
    # -s sessionname
    # -c path
    # -n name of created window
    # -d create detached
    # -A attach if already existing
    # -P show info
    tmux new-session -s $PROJNAME -c $PROJ_PATH -n 'editor' -A -d 'vim'
    tmux new-window -t $PROJNAME -c $PROJ_PATH -n 'console'
    tmux split-window -t $PROJNAME:console -h -d
    tmux attach -t $PROJNAME
}

function open_tmux_connected_session() {
    local PROJ_PATH=$1:A
    local PROJNAME="$PROJ_PATH:t"
    # -s sessionname
    # -c path
    # -n name of created window
    # -d create detached
    # -A attach if already existing
    # -P show info
    # -t target session
    tmux new-session -t $PROJNAME -s $PROJNAME_2 -A -d
    tmux attach -t $PROJNAME_2
}

function kill_tmux_session(){
    tmux kill-session -t $1
}

function open_tmux_window(){
    local PROJ_PATH=$1
    local PROJNAME=$2
    echo "Project name: $PROJNAME"
    echo "Project path: $PROJ_PATH"
    # Check if we already have a window for the project
    # If not, create a new window. Otherwise, select the exisiting one.
    tmux list-windows | grep "^[[:digit:]]\+: $PROJNAME.\? " &> /dev/null
    if [ $? != 0 ]; then
        echo "$PROJNAME has no current window. Creating..."
        tmux new-window -n $PROJNAME -c $PROJ_PATH
    else
        echo "$PROJNAME has an open window. Selecting it..."
        tmux select-window -t $PROJNAME
    fi
}

