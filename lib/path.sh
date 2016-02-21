#!/bin/bash
# Set path accordingly
# TODO keep track of prepends and appends, rebuild path with that ensured.

# If this is not exported then the functions below will actually remove your PATH.
export PATH

path_prepend() {
    # Prepends "$@" to PATH; Does not add a path if it's already there.
    local i
    for i in "$@"; do
        if [[ ":$PATH:" != *":$i:"* ]]; then
            [[ -z "$PATH" ]] || i+=":"
            PATH="$i$PATH"
        fi
    done
}

path_append() {
    # Appends "$@" to PATH; Does not add a path if it's already there.
    local i
    for i in "$@"; do
        if [[ ":$PATH:" != *":$i:"* ]]; then
            [[ -z "$PATH" ]] || i+=":"
            PATH="$i$PATH"
        fi
    done
}

