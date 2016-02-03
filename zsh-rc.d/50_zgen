#!/bin/zsh

# load zgen
source "${HOME}/.shell/zsh-zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    #zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    #zgen oh-my-zsh plugins/command-not-found

    #zgen oh-my-zsh plugins/zsh_reload
    #zgen oh-my-zsh plugins/fasd
    #zgen oh-my-zsh plugins/autoenv
    ##zgen oh-my-zsh plugins/history-substring-search
    #zgen oh-my-zsh plugins/dirpersist
    #zgen oh-my-zsh plugins/safe-paste
    #zgen oh-my-zsh plugins/battery
    ##zgen oh-my-zsh plugins/colorize
    ##zgen oh-my-zsh plugins/catimg
    #zgen oh-my-zsh plugins/command-not-found
    ##zgen oh-my-zsh plugins/emoji-clock
    ##zgen oh-my-zsh plugins/lol
    ##zgen oh-my-zsh plugins/vi-mode
    ##zgen oh-my-zsh plugins/tmux
    ##zgen oh-my-zsh plugins/thefuck

    ##zgen oh-my-zsh plugins/git
    ##zgen oh-my-zsh plugins/git-extras
    ##zgen oh-my-zsh plugins/git-flow-avh
    ##zgen oh-my-zsh plugins/git-hubflow
    ##zgen oh-my-zsh plugins/gitignore
    ##zgen oh-my-zsh plugins/github
    ##zgen oh-my-zsh plugins/docker
    ##zgen oh-my-zsh plugins/docker-compose
    ##zgen oh-my-zsh plugins/redis-cli

    #zgen oh-my-zsh plugins/python
    #zgen oh-my-zsh plugins/pip
    ##zgen oh-my-zsh plugins/fabric
    ##zgen oh-my-zsh plugins/django
    ##zgen oh-my-zsh plugins/virtualenv
    ##zgen oh-my-zsh plugins/virtualenvwrapper
    ##zgen oh-my-zsh plugins/node
    ##zgen oh-my-zsh plugins/npm
    ##zgen oh-my-zsh plugins/go

    ##zgen oh-my-zsh plugins/heroku
    ##zgen oh-my-zsh plugins/aws

    zgen load zsh-users/zsh-syntax-highlighting
    #zgen load /path/to/super-secret-private-plugin

    # bulk load
    zgen loadall <<EOPLUGINS
        zsh-users/zsh-history-substring-search
        #/path/to/local/plugin
EOPLUGINS
    # ^ can't indent this EOPLUGINS

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    #zgen oh-my-zsh themes/arrow
    zgen oh-my-zsh themes/agnoster

    # save all to init script
    zgen save
fi

