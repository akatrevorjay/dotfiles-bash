#!/bin/bash

## Don't load anything else if we're not interactive
# This actually doesn't work correctly, doesn't return on rsync for instance.
#shopt -oq posix && return
[ -z "$PS1" ] && return

# Set env up
CURRENT_SHELL="bash"

##
## Common
##

#[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

## Shell conf
[ ! -e "$HOME/.shell/rc" ] || . "$HOME/.shell/rc"

