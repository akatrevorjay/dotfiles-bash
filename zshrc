#!/bin/zsh

## Profiling
#[[ -z "$ZSH_PROFILE_RC" ]] || which zmodload >&/dev/null && zmodload zsh/zprof


# Set env up
CURRENT_SHELL="$ZSH_NAME"

##
## Common
##

#[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

## Shell conf
[ ! -e "$HOME/.shell/rc" ] || source "$HOME/.shell/rc"

