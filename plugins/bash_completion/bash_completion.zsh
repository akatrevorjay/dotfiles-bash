#!/bin/zsh

autoload -Uz bashcompinit
bashcompinit

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
case "$SYSTEM" in
    linux)
        if [ -f /etc/bash_completion ]; then
            emulate bash -c "source /etc/bash_completion"
        fi
        ;;
    darwin)
        # bash-completion2 from homebrew-versions (requires bash 4+)
        if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
            emulate bash -c "source $(brew --prefix)/share/bash-completion/bash_completion"
        fi
        ;;
esac
