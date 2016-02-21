#!/bin/sh

if [[ ! -d "$HOME/.rvm" ]]; then
    debug "No RVM installation found."
    return 0
fi

path_prepend "$HOME/.rvm/bin"
source "$HOME/.rvm/scripts/rvm"
