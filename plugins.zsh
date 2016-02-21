#!/bin/zsh

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$SHELL_CONF_DIR/zsh-custom"
ZSH_CACHE_DIR="$SHELL_CONF_DIR/zsh-cache"

zplug "$SHELL_CONF_DIR/plugins/pyenv", from:local, nice:-5
#zplug "$SHELL_CONF_DIR/plugins/bash_completion", from:local, nice:-5
zplug "$SHELL_CONF_DIR/plugins/better_man", from:local

zplug "erichs/composure", of:"composure.sh"

zplug "junegunn/fzf", as:command, of:"bin/fzf*", do:"./install --bin"
zplug "$SHELL_CONF_DIR/plugins/fzf", from:local

export ENHANCD_FILTER=fzf:peco:gof
export ENHANCD_COMMAND=ecd
zplug "b4b4r07/enhancd", of:enhancd.sh

#zplug "b4b4r07/auto-fu.zsh"
#zplug "$SHELL_CONF_DIR/plugins/auto-fu", from:local

#zplug "mollifier/anyframe"
#zplug "$SHELL_CONF_DIR/plugins/anyframe", from:local

# MUST be AFTER zsh-syntax-highlighting
zplug "zsh-users/zsh-history-substring-search", nice:16

# Easily cd to gitroot
zplug "mollifier/cd-gitroot"

# Easily deal with autoload functions, even hot reload
zplug "mollifier/zload"

## GitHub-like contribution calendar
#zplug "k4rthik/git-cal", as:command

# zsh-completions
fpath+=( \
    "$SHELL_CONF_DIR/zsh-plugged/repos/zsh-users/zsh-completions/src" \
)
zplug "zsh-users/zsh-completions"

## Add history-substring-search-* widgets to list of widgets that clear the autosuggestion
#ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)
#zplug "tarruda/zsh-autosuggestions", nice:12

# Set priority to load command like a nice command
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
zplug "zsh-users/zsh-syntax-highlighting", nice:15

#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)
#zplug "jimmijj/chromatic-zsh", nice:15

##
## OMZ plugins
##

zplug "plugins/zsh_reload", from:oh-my-zsh, ignore:oh-my-zsh.zsh
zplug "plugins/fasd", from:oh-my-zsh, ignore:oh-my-zsh.zsh
zplug "plugins/autoenv", from:oh-my-zsh, ignore:oh-my-zsh.zsh
zplug "plugins/safe-paste", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/history-substring-search", from:oh-my-zsh, ignore:oh-my-zsh.zsh
zplug "plugins/dirpersist", from:oh-my-zsh, ignore:oh-my-zsh.zsh
zplug "plugins/dirhistory", from:oh-my-zsh, ignore:oh-my-zsh.zsh
zplug "plugins/battery", from:oh-my-zsh, ignore:oh-my-zsh.zsh
zplug "plugins/bgnotify", from:oh-my-zsh, ignore:oh-my-zsh.zsh
zplug "plugins/command-not-found", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/colored-man-pages", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/man", from:oh-my-zsh, ignore:oh-my-zsh.zsh

zplug "plugins/python", from:oh-my-zsh, ignore:oh-my-zsh.zsh
zplug "plugins/pip", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/vitualenv", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/vitualenvwrapper", from:oh-my-zsh, ignore:oh-my-zsh.zsh
zplug "plugins/autopep8", from:oh-my-zsh, ignore:oh-my-zsh.zsh
zplug "plugins/pep8", from:oh-my-zsh, ignore:oh-my-zsh.zsh
zplug "plugins/pylint", from:oh-my-zsh, ignore:oh-my-zsh.zsh

#zplug "plugins/git", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/git-extras", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/git-flow-avh", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/git-hubflow", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/github", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/gitignore", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/aws", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/httpie", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/vi-mode", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/docker", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/docker-compose", from:oh-my-zsh, ignore:oh-my-zsh.zsh
#zplug "plugins/redis-cli", from:oh-my-zsh, ignore:oh-my-zsh.zsh

