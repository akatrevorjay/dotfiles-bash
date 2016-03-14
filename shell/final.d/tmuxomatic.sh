: "${TMUX_SESSION_PREFIX:="term"}"
autoload -Uz tmuxomatic

[[ -n "$TMUX" ]] || tmuxomatic
