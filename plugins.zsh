#!/bin/zsh

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$SHELL_CONF_DIR/zsh-custom"

zplug "$SHELL_CONF_DIR/plugins/pyenv", of:"*.plugin.zsh", from:local, nice:-5

zplug "erichs/composure", of:"composure.sh"

zplug "junegunn/fzf", of:"shell/*.zsh"

fpath+=( \
    "$SHELL_CONF_DIR/zsh-plugged/repos/zsh-users/zsh-completions/src" \
)
zplug "zsh-users/zsh-completions"

# Add history-substring-search-* widgets to list of widgets that clear the autosuggestion
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)
zplug "tarruda/zsh-autosuggestions", nice:12

# Set priority to load command like a nice command
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
zplug "zsh-users/zsh-syntax-highlighting", nice:15

#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)
#zplug "jimmijj/chromatic-zsh", nice:15

zplug "zsh-users/zsh-history-substring-search"

export ENHANCD_FILTER=fzf:peco:gof
#export ENHANCD_DIR="$SHELL_CONF_DIR/.enhancd"
zplug "b4b4r07/enhancd", of:"*.plugin.zsh", on:"junegunn/fzf"

zplug "mollifier/anyframe"
zplug "mollifier/cd-gitroot"

##
## OMZ plugins
##

zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "plugins/fasd", from:oh-my-zsh
zplug "plugins/autoenv", from:oh-my-zsh
zplug "plugins/safe-paste", from:oh-my-zsh
#zplug "plugins/history-substring-search", from:oh-my-zsh
zplug "plugins/dirpersist", from:oh-my-zsh
zplug "plugins/dirhistory", from:oh-my-zsh
zplug "plugins/battery", from:oh-my-zsh
zplug "plugins/bgnotify", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
#zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/man", from:oh-my-zsh

zplug "plugins/python", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
#zplug "plugins/vitualenv", from:oh-my-zsh
#zplug "plugins/vitualenvwrapper", from:oh-my-zsh
zplug "plugins/autopep8", from:oh-my-zsh
zplug "plugins/pep8", from:oh-my-zsh
zplug "plugins/pylint", from:oh-my-zsh

#zplug "plugins/git", from:oh-my-zsh
#zplug "plugins/git-extras", from:oh-my-zsh
#zplug "plugins/git-flow-avh", from:oh-my-zsh
#zplug "plugins/git-hubflow", from:oh-my-zsh
#zplug "plugins/github", from:oh-my-zsh
#zplug "plugins/gitignore", from:oh-my-zsh
#zplug "plugins/aws", from:oh-my-zsh
#zplug "plugins/httpie", from:oh-my-zsh
#zplug "plugins/vi-mode", from:oh-my-zsh
#zplug "plugins/docker", from:oh-my-zsh
#zplug "plugins/docker-compose", from:oh-my-zsh
#zplug "plugins/redis-cli", from:oh-my-zsh

