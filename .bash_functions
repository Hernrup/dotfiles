#
# Is a python virtualenv active?
#
function __active_python() {
    if [[ "$(type -t deactivate)" == "function" ]]; then
        echo `which python`
    fi
}