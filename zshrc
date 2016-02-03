#!/bin/zsh

## Profiling
#[[ -z "$ZSH_PROFILE_RC" ]] || which zmodload >&/dev/null && zmodload zsh/zprof

export SHELL_CONF_DIR="$HOME/.shell"

# Tell ZSH and friends that this is where to look for dotfiles
#ZDOTDIR="$SHELL_CONF_DIR"
# unfortunately, almost nothing pays attention to this.
ZDOTDIR="$HOME"

#ZSH_ZWC="$SHELL_CONF_DIR/.zshrc.zwc"
ZSH_ZWC="$ZDOTDIR/.zshrc.zwc"

# Set env up
CURRENT_SHELL="$ZSH_NAME"

##
## Common
##

#[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

## Shell conf
#source "$SHELL_CONF_DIR/rc"
#
if [[ -e "$ZSH_ZWC" ]]; then
    fpath=("$ZSH_ZWC" $fpath)
else
    fpath=("$SHELL_CONF_DIR/zsh-functions" $fpath)
fi

autoload -Uz shellconf-init
shellconf-init

