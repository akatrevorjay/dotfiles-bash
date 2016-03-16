
: "${TMUXOMATIC_AUTO:=true}"
: "${TMUX_SESSION_PREFIX:="term"}"
autoload -Uz tmuxomatic

if bool_is_true "$TMUXOMATIC_AUTO"; then
    [[ -n "$TMUX" ]] || tmuxomatic
fi

