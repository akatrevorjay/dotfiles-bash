#!/bin/bash

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls -Fh --color=auto'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ll -a'
alias duh='du -h'
alias dfh='df -h'

! has_cmd colordiff \
    || alias diff='colordiff'

# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
if has_cmd pygmentize; then
    alias colorcat='pygmentize -O style=monokai -f console256 -g'
    alias cat='colorcat'
fi

#alias rdesktop='rdesktop -g 1280x1024'
#alias mstsc='rdesktop'

alias nobyobu='export LC_BYOBU=0'

alias rehash='which pyenv >/dev/null 2>&1 && pyenv rehash; hash -r'

#alias free='free -mt'
alias idle='nice -n19 ionice -c3'

alias zls='zfs list -o name,used,avail,refer,mountpoint,usedbysnapshots,compress,compressratio,usedbychildren,usedbydataset,usedbyrefreservation,usedbysnapshots'
alias zfsls='zls'

alias pipsi='~/.pyenv/versions/utils/bin/pipsi'
