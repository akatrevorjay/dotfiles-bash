#!/bin/sh
# Don't run this within tmux as it's broken.
[[ -z "$TMUX" ]] || return 1

f="$HOME/.iterm2_shell_integration.$CURRENT_SHELL"
[[ ! -e "$f" ]] || . "$f"
unset f
