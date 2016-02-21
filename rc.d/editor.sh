#!/bin/sh

export EDITOR=vim

# mvim does NOT like to be spawned this way, especially with git. Nope.
## Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

