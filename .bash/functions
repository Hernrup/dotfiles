#
# Is a python virtualenv active?
#
function __active_python() {
    if [[ "$(type -t deactivate)" == "function" ]]; then
        echo `which python`
    fi
}

#
# Function for quickly navigating to root git directory
#
function cdgrt() {
    start_path=`pwd`    # Remember where we started so we can reset

	while [[ "`pwd`" != "/" ]];
	do
		if [ -d ".git" ]; then
			local found_git=1
			break
		fi
		cd ..
	done

	if [[ -z "$found_git" ]]; then
		echo "Could not find a .git directory!"
        cd $start_path  # Reset cwd to where we started.
	fi
}

#
# Function for recursively find a venv in parent dirs and activate it
#
function av() {
	start_path=`pwd`	# Remember where we started so we can reset

	while [[ "`pwd`" != "/" ]];
	do
		echo "Searching in `pwd` for a venv folder..."
		if [ -f "venv/Scripts/activate" ]; then
			echo "found a venv, activating..."
			source venv/Scripts/activate
			local found_venv=1
			break
		fi
		cd ..
	done

	if [[ -z "$found_venv" ]]; then
		echo "Could not find a venv directory!"
	fi

	cd $start_path  # Reset cwd to where we started.
}

#
# Function for recursively find Python in parent dirs and activate it
#
function ap() {
	start_path=`pwd`	# Remember where we started so we can reset

	while [[ "`pwd`" != "/" ]];
	do
		echo "Searching in `pwd` for a python folder..."
		if [ -f "Python34/Scripts/activate" ]; then
			echo "found python, activating..."
			source Python34/Scripts/activate
			local found_python=1
			break
		fi
		cd ..
	done

	if [[ -z "$found_python" ]]; then
		echo "Could not find a python directory!"
	fi

	cd $start_path  # Reset cwd to where we started.
}