#!/bin/sh

# make less more friendly for non-text input files, see lesspipe(1)
for lesspipe in lesspipe lesspipe.sh; do
    which "$lesspipe" >/dev/null 2>&1 || continue
    #eval "$(SHELL=/bin/sh lesspipe)"
    eval "$("$lesspipe")"
done

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

# enable color support of ls and such
if which dircolors >/dev/null 2>&1; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

#PAGER="m"

# Don't allow others to write to my terminal
mesg n 2>&1 >/dev/null || :

