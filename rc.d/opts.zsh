#!/bin/zsh

## Set this early just in case it fails before setting this later.
##ZSH_CACHE_DIR="$SHELL_CONF_DIR/zsh-cache"
#ZSH_COMPDUMP="$HOME/.zcompdump-${HOST%%.*}-${ZSH_VERSION}"

## Add our local zsh-functions dir
#fpath=("$SHELL_CONF_DIR/zsh-functions" $fpath)

## Autoload what's in there
#for f in "$SHELL_CONF_DIR/zsh-functions"/*; do
#    [[ -n "$f" ]] || continue
#    [[ "$f" = *.bash ]] || continue
#    autoload -U "$(basename "$f")"
#done

##
## modules
##
zmodload zsh/attr zsh/clone zsh/compctl zsh/computil zsh/datetime \
    zsh/mathfunc zsh/pcre zsh/regex zsh/param/private \
    zsh/sched zsh/system \
    zsh/termcap zsh/terminfo zsh/zpty zsh/zselect zsh/zutil
#zmodload zsh/complist
#zmodload zsh/files

##
## opts
##

setopt \
    nullglob extended_glob case_glob \
    nomenucomplete listpacked listtypes

## jobs
setopt checkjobs
setopt long_list_jobs

#setopt hash_list_all            # hash everything before completion
setopt hash_all
#setopt completealiases          # complete alisases
#setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word         # allow completion from within a word/phrase
#setopt correct                  # spelling correction for commands
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.
#setopt nolist_ambiguous
setopt autolist
setopt bashautolist
setopt clobber
#setopt noalways_to_end
setopt multios
setopt cdablevars
setopt markdirs

# recognize comments
setopt interactivecomments

setopt auto_cd                  # if command is a path, cd into it
#setopt auto_remove_slash        # self explicit
#setopt chase_links              # resolve symlinks
setopt extended_glob            # activate complex pattern globbing
#setopt no_glob_dots            # include dotfiles in globbing
#setopt print_exit_value         # print return value if non-zero
unsetopt beep                   # no bell on error
unsetopt bg_nice                # no lower prio for background jobs
unsetopt clobber                # must use >| to truncate existing files
unsetopt hist_beep              # no bell on error in history
unsetopt hup                    # no hup signal at shell exit
unsetopt ignore_eof             # do not exit on end-of-file
unsetopt list_beep              # no bell on ambiguous completion
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'

# Pushd
setopt auto_pushd               # make cd push old dir in dir stack
setopt pushd_ignore_dups        # no duplicates in dir stack
setopt pushd_silent             # no dir stack after pushd or popd
setopt pushd_to_home            # `pushd` = `pushd $HOME`

## Load smart urls if available
# bracketed-paste-magic is known buggy in zsh 5.1.1 (only), so skip it there; see #4434
autoload -Uz is-at-least
if [[ $ZSH_VERSION != 5.1.1 ]]; then
  for d in $fpath; do
  	if [[ -e "$d/url-quote-magic" ]]; then
  		if is-at-least 5.1; then
  			autoload -Uz bracketed-paste-magic
  			zle -N bracketed-paste bracketed-paste-magic
  		fi
  		autoload -Uz url-quote-magic
  		zle -N self-insert url-quote-magic
      break
  	fi
  done
fi

autoload -Uz \
    zrecompile \
    relative \
    zargs \
    zcalc \
    zstyle+ \
    ztodo \
    sticky-note \
    zkbd \
    incremental-complete-word \
    zsh-mime-setup zsh-mime-handler \
    pick-web-browser \
    nslookup \
    regexp-replace \
    chpwd_recent_dirs cdr add-zsh-hook \
    promptinit \
    && :

## prompt
promptinit

## cdr
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':completion:*:*:cdr:*:*' menu selection

## incremental completion
bindkey '^Xi' incremental-complete-word

## predict
zle -N predict-on
zle -N predict-off
bindkey '^X^Z' predict-on
bindkey '^Z' predict-off

## mime
zsh-mime-setup
alias -s html=pick-web-browser

##
## completion
##
autoload -Uz bashcompinit
bashcompinit

zstyle ':completion::complete:*' use-cache on                 # completion caching, use rehash to clear
zstyle ':completion:*' cache-path "$SHELL_CONF_DIR/.zcompcache" # cache path

#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'     # ignore case
#zstyle ':completion:*' menu select=2                          # menu if nb items > 2
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}         # colorz !
#zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # list of completers to use

# sections completion !
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true

#zstyle ':completion:*:processes' command 'ps -au$USER'
#zstyle ':completion:*:*:kill:*' menu yes select
#zstyle ':completion:*:kill:*' force-list always
#zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
#zstyle ':completion:*:*:killall:*' menu yes select
#zstyle ':completion:*:killall:*' force-list always

###generic completion with --help
#compdef _gnu_generic gcc
#compdef _gnu_generic gdb

