#!/bin/zsh

fpath+=( \
    "$SHELL_CONF_DIR/repos/zsh-completions/src" \
)

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)

plugins+=( \
    zsh-syntax-highlighting \
)

