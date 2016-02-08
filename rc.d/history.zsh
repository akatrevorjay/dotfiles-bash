#!/bin/zsh

export HISTFILE="$ZDOTDIR/.zsh_history"

setopt extended_history			# include time in history
setopt hist_ignore_dups         # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword

