# Set path accordingly

path_prepend() {
    # Prepends "$@" to PATH; Does not add a path if it's already there.
    typeset -agU path=("$@" $path[@])
}

path_append() {
    # Appends "$@" to PATH; Does not add a path if it's already there.
    typeset -agU path=($path[@] "$@")
}

