#!/bin/bash

function proml {
	case $TERM in
		xterm*)
			TITLEBAR='\[\033]0;\u@\h:\w\007\]'
			;;
		*)
			TITLEBAR=""
			;;
	esac

	local PREPS1="${TITLEBAR}\
 ${PS1_PRE}\
%tan%[%light_gray% \D{%_H}%light_gray%:%light_gray%\D{%_M%P} %tan%]\
[%light_gray% \u\
%white%@\
%light_gray%\h\
%white%:\
%light_gray%\w\
%tan% ]\
${PS1_POST}\n%white% \\$%light_gray% "
	PS1="$(bashism.colors.colorize "$PREPS1")"
	PS2='> '
	PS4='+ '
}

