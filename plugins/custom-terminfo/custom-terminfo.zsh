
function __custom_terminfo() {
    local f="$SHELL_CONF_DIR/$TERM.ti"
    [[ -f "$f" ]] || return 0
    tic "$f"
}

__custom_terminfo
