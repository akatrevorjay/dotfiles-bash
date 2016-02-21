#!/bin/zsh

: ${HISTFILE:="${ZDOTDIR:-$HOME}/.zsh_history"}

setopt extended_history			# include time in history
setopt hist_ignore_dups         # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword
#setopt hist_expire_dups_first
#setopt hist_ignore_dups # ignore duplication command history list
#setopt hist_ignore_space

#HISTSIZE=10000
#SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

