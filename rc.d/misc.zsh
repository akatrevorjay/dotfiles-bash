#!/bin/zsh
unalias run-help &>/dev/null || :
autoload run-help
HELPDIR=/usr/local/share/zsh/help

## super user alias
alias _='sudo'
alias please='sudo'

## more intelligent acking
if has_cmd ack-grep; then
  alias afind='ack-grep -il'
elif has_cmd ack; then
  alias afind='ack -il'
fi

# only define LC_CTYPE if undefined
if [[ -z "$LC_CTYPE" && -z "$LC_ALL" ]]; then
	export LC_CTYPE=${LANG%%:*} # pick the first entry from LANG
fi

