#!/bin/sh

## make less more friendly for non-text input files, see lesspipe(1)
#for lesspipe in lesspipe lesspipe.sh; do
#    has_cmd "$lesspipe" || continue
#    eval "$("$lesspipe")"
#done

## pager
#export PAGER="m"
#export PAGER="less"
#export LESS="-R"

# Don't allow others to write to my terminal
mesg n 2>&1 >/dev/null || :

