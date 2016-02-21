#!/bin/zsh

## Load zkbd file if one exists
f="~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}"
if [[ -e "$f" ]]; then
    source "$f"
    #[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
    #[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char
    # etc.
fi
unset f

##
## Enable meta/alt keys
##
unsetopt multibyte
# Enable zle binds
bindkey -m

