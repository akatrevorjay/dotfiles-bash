#!/bin/bash

# Only interactive shells thanks.
shopt -oq posfix || return 0

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
case "$SYSTEM" in
    linux)
        if [ -f /etc/bash_completion ]; then
            . /etc/bash_completion
        fi
        ;;
    darwin)
        # bash-completion2 from homebrew-versions (requires bash 4+)
        if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
            . $(brew --prefix)/share/bash-completion/bash_completion
        fi
        ;;
esac

