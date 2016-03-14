#!/bin/zsh

zplug "plugins/osx", from:oh-my-zsh, ignore:oh-my-zsh.zsh
zplug "plugins/brew", from:oh-my-zsh, ignore:oh-my-zsh.zsh
zplug "plugins/brew-cask", from:oh-my-zsh, ignore:oh-my-zsh.zsh

# Use lib/clipboard plugin only on Mac
#zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
#zplug "lib/clipboard", from:oh-my-zsh, ignore:oh-my-zsh.zsh

