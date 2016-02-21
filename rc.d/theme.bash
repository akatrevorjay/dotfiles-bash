#!/bin/bash

## PS theming
#function bash_theme {
#    local theme="$1"
#    local p="$SHELL_CONF_DIR/themes"
#    local dcf f
#    for f in "$p/"{$theme,default}{-$USER,}{.{$CURRENT_SHELL,sh},}; do
#        [[ -e "$f" ]] || continue
#        . "$f"
#        declare -F -f "$theme" >/dev/null 2>&1 && "$theme"
#
#        for dcf in "$p/"{$theme,default}{-$USER,}{.{$CURRENT_SHELL,sh,}.dircolors "$HOME/.dircolors"; do
#            [[ -e "$dcf" ]] || continue
#            eval "$(dircolors -b "$dcf")"
#        done
#
#        # Glue prompt to first column
#        export PS1="\[\033[G\]$PS1"
#
#        unset PS1_PRE PS1_POST
#        break 2
#    done
#}

#bash_theme git-prompt
#bash_theme b-con

. "$SHELL_CONF_DIR/themes/airline.sh"

