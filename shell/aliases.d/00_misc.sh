#!/bin/bash

#alias rdesktop='rdesktop -g 1280x1024'
#alias mstsc='rdesktop'

alias nobyobu='export LC_BYOBU=0'

alias rehash='which pyenv >/dev/null 2>&1 && pyenv rehash; hash -r'

#alias free='free -mt'
alias idle='nice -n19 ionice -c3'

alias zls='zfs list -o name,used,avail,refer,mountpoint,usedbysnapshots,compress,compressratio,usedbychildren,usedbydataset,usedbyrefreservation,usedbysnapshots'
alias zfsls='zls'

alias pipsi='~/.pyenv/versions/utils/bin/pipsi'

