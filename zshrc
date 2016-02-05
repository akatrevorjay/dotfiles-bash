#!/bin/zsh

## Profiling
#[[ -z "$ZSH_PROFILE_RC" ]] || which zmodload >&/dev/null && zmodload zsh/zprof

export SHELL_CONF_DIR="$HOME/.shell"

# Tell ZSH and friends that this is where to look for dotfiles
#ZDOTDIR="$SHELL_CONF_DIR"
# unfortunately, almost nothing pays attention to this.
ZDOTDIR="$HOME"

# Set env up
CURRENT_SHELL="$ZSH_NAME"

##
## Common
##

#[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

## Shell conf
[ ! -e "$SHELL_CONF_DIR/rc" ] || source "$SHELL_CONF_DIR/rc"

