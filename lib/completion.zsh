

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

#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'     # ignore case
#zstyle ':completion:*' menu select=2                          # menu if nb items > 2
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}         # colorz !
#zstyle ':completion:*' list-colors ''
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

# should this be in keybindings?
bindkey -M menuselect '^o' accept-and-infer-next-history

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
