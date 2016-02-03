#!/bin/zsh

##
## modules
##
zmodload zsh/attr zsh/clone zsh/compctl zsh/computil zsh/datetime \
    zsh/mathfunc zsh/pcre zsh/regex zsh/param/private \
    zsh/sched zsh/system \
    zsh/termcap zsh/terminfo zsh/zpty zsh/zselect zsh/zutil
#zmodload zsh/files

## Profiling
#[[ -z "$ZSH_PROFILE_RC" ]] || which zmodload >&/dev/null && zmodload zsh/zprof


# Set env up
CURRENT_SHELL="zsh"

##
## Common
##

#[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

## Shell conf
[ ! -e "$HOME/.shell/rc" ] || source "$HOME/.shell/rc"

