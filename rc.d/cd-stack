#!/bin/bash
function cd() {
    case "$*" in
        -)      builtin cd "$@" ;;
        ..)     popd ;;
        *)      builtin pushd "$@" ;;
    esac
}
