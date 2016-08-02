#
# Find the directory for a project from its name. Just returns the first path
# to a directory with the same name as the project.
#
function dir_for_project() {
    local PROJNAME=$1
    local PROJDIR

    #
    # Check if we already have the dir for this project cached.
    #
    if [[ -f ~/.projecthist ]]; then
        PROJDIR=$(grep "^$PROJNAME:" ~/.projecthist | cut -d: -f2)
    fi

    if [[ -n "$PROJDIR" ]]; then
        echo "$PROJDIR"
        return
    fi

    #
    # Attempt to find the project directory
    #
    PROJDIR=$(find -L ~/src -maxdepth 4 -type d -iname $PROJNAME -print -quit)

    #
    # Cache the directory if we found it.
    #
    if [[ -n $PROJDIR ]]; then
        echo "$PROJNAME:$PROJDIR" >> ~/.projecthist
        echo $PROJDIR
    fi
}

#
# Find dir by traversing upwards
#
function reverse_find_dir() {
    local dir_to_find=$1
    local start_path=`pwd`    # Remember where we started so we can reset

	while [[ "`pwd`" != "/" ]];
	do
		if [ -d ".git" ]; then
			local found_git=1
			break
		fi
		cd ..
	done

	if [[ -n "$found_git" ]]; then
        pwd
	fi

    cd $start_path  # Reset cwd to where we started.
}

#
# cd to root of current git working dir
#
function cd_git_root() {
    local root=`reverse_find_dir .git`
    if [[ -n "$root" ]]; then
        cd $root
    else
        echo "Could not find a .git dir"
    fi
}



#
# Check if we have an active python.
#
function is_python_active() {
    if [[ $(type -w deactivate) == "deactivate: function" ]]; then
        return 0
    fi

    return 1
}

function find_python_venv_activate_script() {
    local curr_dir=$1
    [[ -z $1 ]] && curr_dir=.

    local probe

    # unix style activation available?
    probe="$curr_dir/venv/bin/activate"
    if [[ -f $probe ]]; then
        echo $probe
        return 0
    fi

    # windows style activation available?
    probe="$curr_dir/venv/Scripts/activate"
    if [[ -f $probe ]]; then
        echo $probe
        return 0
    fi

    # LIME embedded style activation available?
    probe="$curr_dir/Python34/Scripts/activate"
    if [[ -f $probe ]]; then
        echo $probe
        return 0
    fi
}

function dir_has_python_venv() {
    if [[ -n $(find_python_venv_activate_script) ]]; then
        return 0
    fi

    return 1
}

function activate_python() {
    local new_dir=$1
    [[ -z $1 ]] && new_dir=.

    local activate_script=`find_python_venv_activate_script $new_dir`

    if [ -z $activate_script ]; then
        return 1
    fi

    if is_python_active; then
        deactivate
        unset deactivate
    fi

    export VIRTUAL_ENV_DISABLE_PROMPT='1'
    source ${activate_script}
}

#
# Function for recursively find a venv in parent dirs and activate it
#
function av() {
    local start_path=`pwd`	# Remember where we started so we can reset

    while [[ "`pwd`" != "/" ]];
    do
        local activate_script=`find_python_venv_activate_script`
        if [ -n "$activate_script" ]; then
            activate_python
            local found_venv=1
            break
        fi
        cd ..
    done

    if [[ -z "$found_venv" ]]; then
        echo "Could not find a python to activate!"
    fi

    cd $start_path  # Reset cwd to where we started.
}

#
# Function to cd to a directory and automatically activate any
# Python virtual environment in the target dir.
#
function cd_venv() {
    cd $1 && activate_python
}


#
# Start, or attach to, a tmux sesssion with a window for
# the desired project.
#

function _default_tmux_pane_layout() {
    local WORKDIR=$1
    local PROJNAME=$2

    echo "Setting up default layout. Directory: $WORKDIR"

    #tmux split-window -h -c $WORKDIR -t $PROJNAME -p 50
}

function tmsu() {
    local SESSIONNAME="DEF"
    local PROJNAME=$1
    local PROJ_PATH="`pwd`"
    #
    # See if we already have a seesion. If not, create one
    #
    tmux has-session -t $SESSIONNAME &> /dev/null
    if [ $? != 0 ]; then
        echo "Session $SESSIONNAME not found. Creating it..."
        echo "Project name: $PROJNAME"
        tmux new-session -s $SESSIONNAME -d -n $PROJNAME -c $PROJ_PATH
        _default_tmux_pane_layout $PROJ_PATH $PROJNAME
    else
        echo "Session $SESSIONAME is running. Attaching..."
        #
        # Check if we already have a window for the project
        # If not, create a new window. Otherwise, select the exisiting one.
        tmux list-windows -t DEF | grep "^[[:digit:]]\+: $PROJNAME.\? " &> /dev/null
        if [ $? != 0 ]; then
            echo "$PROJNAME has no current window. Creating..."
            echo "Project name: $PROJNAME"
            tmux new-window -n $PROJNAME -c $PROJ_PATH
            _default_tmux_pane_layout $PROJ_PATH $PROJNAME
        else
            echo "$PROJNAME has an open window. Selecting it..."
            tmux select-window -t $PROJNAME
        fi
    fi

    #
    # Attach to the session. If this fails because we're already attached,
    # fail silently.
    #
    tmux attach-session -t $SESSIONNAME &> /dev/null
}

function tms() {
    local SESSIONNAME="DEF"
    local tmp_path=$1
    local PROJ_PATH=$tmp_path:A
    local PROJNAME="$PROJ_PATH:t"
    echo "Project path: $PROJ_PATH"
    #
    # See if we already have a seesion. If not, create one
    #
    tmux has-session -t $SESSIONNAME &> /dev/null
    if [ $? != 0 ]; then
        echo "Session $SESSIONNAME not found. Creating it..."
        echo "Project name: $PROJNAME"
        tmux new-session -s $SESSIONNAME -d -n $PROJNAME -c $PROJ_PATH
        _default_tmux_pane_layout $PROJ_PATH $PROJNAME
    else
        echo "Session $SESSIONAME is running. Attaching..."
        #
        # Check if we already have a window for the project
        # If not, create a new window. Otherwise, select the exisiting one.
        tmux list-windows -t DEF | grep "^[[:digit:]]\+: $PROJNAME.\? " &> /dev/null
        if [ $? != 0 ]; then
            echo "$PROJNAME has no current window. Creating..."
            echo "Project name: $PROJNAME"
            tmux new-window -n $PROJNAME -c $PROJ_PATH
            _default_tmux_pane_layout $PROJ_PATH $PROJNAME
        else
            echo "$PROJNAME has an open window. Selecting it..."
            tmux select-window -t $PROJNAME
        fi
    fi

    #
    # Attach to the session. If this fails because we're already attached,
    # fail silently.
    #
    tmux attach-session -t $SESSIONNAME &> /dev/null
}

function windbgl(){
    # usage windbgl 10.12.133 /path/to/dumpfile
    local executable="$program_files_x86/Windows\ Kits/10/Debuggers/x64/windbg"
    local version=$1
    local dump=$(cygpath -w -m $2)
    local lime_symbol_path="$HOME/src/lime/desktop_client_symbols/$version/"
    local symbols="$(cygpath -w -m $lime_symbol_path)\;SRV\*"
    local cmd="$executable -y $symbols -z $dump"
    eval ${cmd}
}
