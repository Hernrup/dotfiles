# Tell tmux to always expect 256 colors
alias tmux='tmux -2'
alias tma='tmux attach'
alias tms='open_tmux_session_for_project'
alias tmw='open_tmux_window_for_project'
alias tmsc='tmux_clone_session'
alias tmsk='kill_tmux_session'

function open_tmux_window_for_project() {
    local PROJ_PATH=$1:A
    local PROJNAME="$PROJ_PATH:t"
    open_tmux_window $PROJ_PATH $PROJNAME
}

function open_tmux_session_for_project() {
    local PROJ_PATH=$1:A
    local PROJNAME="$PROJ_PATH:t"

    # Create session if it does not exist
    tmux has-session -t $PROJNAME
    if [ $? != 0 ]; then
        tmux new-session -s $PROJNAME -c $PROJ_PATH -n 'editor' -d

        # Setup default panes for window
        tmux new-window -t $PROJNAME -c $PROJ_PATH -n 'console'
        tmux split-window -t $PROJNAME:console -h -d
    fi

    # attach if outside tmux, otherwise switch
    if [ -n "$TMUX" ]; then
        tmux switch-client -t $PROJNAME
    else
        tmux attach -t $PROJNAME
    fi
}

function tmux_clone_session() {
    local SESSION_NAME=`tmux display-message -p "#S"`
    local SESSION_NAME_NEW="${SESSION_NAME}_CLONE"
    tmux new-session -t $SESSION_NAME -s $SESSION_NAME_NEW -d
    tmux switch-client -t $SESSION_NAME_NEW
}

function kill_tmux_session(){
    local SESSION_NAME=`tmux display-message -p "#S"`
    tmux switch-client -n
    tmux kill-session -t $SESSION_NAME
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

