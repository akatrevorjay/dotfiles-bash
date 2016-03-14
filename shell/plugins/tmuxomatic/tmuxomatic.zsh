#!/usr/bin/env zsh
autoload -Uz tmuxomatic

function bool_is_true() {
    local val="$1"
    local default="$2"
    [[ -n "$val" ]] || val="$default"

    case "$val" in
        false*|0|no*)
            return 1
            ;;
        *)
            # Empty string is a no.
            [[ -n "$val" ]] || return 1
            # Anything remaining is truth.
            return 0
            ;;
    esac
}

: ${TMUXOMATIC_AUTO:=true}

if get_bool "$TMUXOMATIC_AUTO"; then
    tmuxomatic
fi

