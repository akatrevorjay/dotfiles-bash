#!/bin/zsh

source "$SHELL_CONF_DIR/zsh-lib/antigen/antigen.zsh"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundles <<EOBUNDLES
  zsh_reload
  fasd
  autoenv
  history-substring-search
  dirpersist
  safe-paste
  battery
  #colorize
  #catimg
  command-not-found
  #emoji-clock
  #lol
  #vi-mode
  #tmux
  #thefuck

  #git
  #git-extras
  #git-flow-avh
  #git-hubflow
  #gitignore
  #github
  #docker
  #docker-compose
  #redis-cli

  python
  pip
  #fabric
  #django
  #virtualenv
  #virtualenvwrapper
  #node
  #npm
  #go

  #heroku
  #aws
EOBUNDLES


antigen bundles <<EOBUNDLES
  osx
  #gnu-utils
  brew
  brew-cask
EOBUNDLES

# zsh-completions
antigen bundle zsh-users/zsh-completions src

# Load the theme.
antigen theme robbyrussell

#antigen apply


