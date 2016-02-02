#!/bin/bash
function proml {
local       BLUE="\[\033[0;34m\]"
local        WHITE="\[\033[0;34m\]"
local  LIGHT_RED="\[\033[1;37m\]"
local      RED="\[\033[1;37m\]"
local LIGHT_GRAY="\[\033[0;37m\]"
case $TERM in
    xterm*)
        TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
    *)
        TITLEBAR=""
        ;;
esac

PS1="${TITLEBAR}\
$BLUE[$RED\$(date +%H%M)$BLUE]\
$BLUE[$LIGHT_RED\u@\h:\w$BLUE]\
$WHITE\$$LIGHT_GRAY "
PS2='> '
PS4='+ '
}

