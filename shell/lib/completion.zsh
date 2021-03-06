

#unsetopt menu_complete   # do not autoselect the first completion entry
#unsetopt flowcontrol
#setopt auto_menu         # show completion menu on succesive tab press
#setopt complete_in_word
#setopt always_to_end
#WORDCHARS=''

#zmodload -i zsh/complist

### case-insensitive (all),partial-word and then substring completion
#if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
#  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#  unset CASE_SENSITIVE
#else
#  if [ "x$HYPHEN_INSENSITIVE" = "xtrue" ]; then
#    zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#    unset HYPHEN_INSENSITIVE
#  else
#    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#  fi
#fi

##
## completion
##

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache on                 # completion caching, use rehash to clear
zstyle ':completion::complete:*' cache-path "$ZSH_CACHE_DIR"
zstyle ':completion:*' rehash true  # auto rehash

#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'     # ignore case
#zstyle ':completion:*' menu select=2                          # menu if nb items > 2
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}         # colorz !
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # list of completers to use

# sections completion !
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*' extra-verbose yes
#zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
#zstyle ':completion:*:messages' format $'\e[00;31m%d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*:manuals' separate-sections true

#zstyle ':completion:*:processes' command 'ps -au$USER'
#zstyle ':completion:*:*:kill:*' menu yes select
#zstyle ':completion:*:kill:*' force-list always
#zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
#zstyle ':completion:*:*:killall:*' menu yes select
#zstyle ':completion:*:killall:*' force-list always

###generic completion with --help
#compdef _gnu_generic gcc
#compdef _gnu_generic gdb

## should this be in keybindings?
#bindkey -M menuselect '^o' accept-and-infer-next-history

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
if [ "$OSTYPE[0,7]" = "solaris" ]
then
  zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm"
else
  zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
fi

## disable named-directories autocompletion
#zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

## Don't complete uninteresting users
#zstyle ':completion:*:*:*:users' ignored-patterns \
#        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
#        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
#        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
#        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
#        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
#        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
#        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
#        usbmux uucp vcsa wwwrun xfs '_*'

## ... unless we really want to.
#zstyle '*' single-ignored show

#if [[ $COMPLETION_WAITING_DOTS = true ]]; then
#  expand-or-complete-with-dots() {
#    # toggle line-wrapping off and back on again
#    [[ -n "$terminfo[rmam]" && -n "$terminfo[smam]" ]] && echoti rmam
#    print -Pn "%{%F{red}......%f%}"
#    [[ -n "$terminfo[rmam]" && -n "$terminfo[smam]" ]] && echoti smam

#    zle expand-or-complete
#    zle redisplay
#  }
#  zle -N expand-or-complete-with-dots
#  bindkey "^I" expand-or-complete-with-dots
#fi


#
# Completion enhancements
#


#
# initialization
#

# if it's a dumb terminal, return.
if [[ ${TERM} == 'dumb' ]]; then
  return 1
fi

## add the completions to the fpath
#fpath=(${0:h}/external/src ${fpath})

# load and initialize the completion system
#autoload -Uz compinit && compinit -C -d ${ZDOTDIR:-${HOME}}/.zcompdump

#{
#  # zcomple the .zcompdump in the background
#  zcompdump=${ZDOTDIR:-${HOME}}/.zcompdump

#  if [[ -s ${zcompdump} && ( ! -s ${zcompdump}.zwc || ${zcompdump} -nt ${zcompdump}.zwc) ]]; then
#    zcompile ${zcompdump}
#  fi
  
#  unset zcompdump
#} &!


#
# zsh options
#

## If a completion is performed with the cursor within a word, and a full completion is inserted,
## the cursor is moved to the end of the word
#setopt ALWAYS_TO_END

## Automatically use menu completion after the second consecutive request for completion
#setopt AUTO_MENU

## Automatically list choices on an ambiguous completion. 
#setopt AUTO_LIST

## Perform a path search even on command names with slashes in them.
#setopt PATH_DIRS

## Make globbing (filename generation) sensitive to case.
#unsetopt CASE_GLOB

## On an ambiguous completion, instead of listing possibilities or beeping, insert the first match immediately.
## Then when completion is requested again, remove the first match and insert the second match, etc.
#unsetopt MENU_COMPLETE


#
# completion module options
#

# group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# directories
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'expand'
zstyle ':completion:*' squeeze-slashes true

# ignore useless commands and functions
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'

# completion sorting
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# history
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list true
zstyle ':completion:*:history-words' menu yes

# ignore multiple entries.
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# smart editor completion
zstyle ':completion:*:(nano|vim|nvim|vi|emacs|e):*' ignored-patterns '*.(wav|mp3|flac|ogg|mp4|avi|mkv|webm|iso|dmg|so|o|a|bin|exe|dll|pcap|7z|zip|tar|gz|bz2|rar|deb|pkg|gzip|pdf|mobi|epub|png|jpeg|jpg|gif)'
