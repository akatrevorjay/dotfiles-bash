
## Set this early just in case it fails before setting this later.
##ZSH_CACHE_DIR="$SHELL_CONF_DIR/zsh-cache"
#ZSH_COMPDUMP="$HOME/.zcompdump-${HOST%%.*}-${ZSH_VERSION}"

## Add our local zsh-functions dir
typeset -Uga fpath=("$SHELL_CONF_DIR/zsh-functions" $fpath[@])

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
    nomenucomplete listpacked listtypes \
    globstarshort globcomplete braceccl kshglob braceexpand extendedglob

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
#setopt print_exit_value         # print return value if non-zero
unsetopt beep                   # no bell on error
unsetopt bg_nice                # no lower prio for background jobs
unsetopt hist_beep              # no bell on error in history
unsetopt hup                    # no hup signal at shell exit
unsetopt ignore_eof             # do not exit on end-of-file
unsetopt list_beep              # no bell on ambiguous completion
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'

# Nobody need flow control anymore. Troublesome feature.
#stty -ixon
setopt noflowcontrol

# Pushd
setopt auto_pushd               # make cd push old dir in dir stack
setopt pushd_ignore_dups        # no duplicates in dir stack
setopt pushd_silent             # no dir stack after pushd or popd
setopt pushd_to_home            # `pushd` = `pushd $HOME`

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

## mime
zsh-mime-setup
alias -s html=pick-web-browser

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

