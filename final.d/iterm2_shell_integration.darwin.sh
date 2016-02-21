#!/bin/sh
f="$HOME/.iterm2_shell_integration.$CURRENT_SHELL"
[[ ! -e "$f" ]] || . "$f"
unset f
