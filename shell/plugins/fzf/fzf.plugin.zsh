# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/trevorj/.shell/zsh-plugged/repos/junegunn/fzf/bin* ]]; then
  export PATH="$PATH:/Users/trevorj/.shell/zsh-plugged/repos/junegunn/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/trevorj/.shell/zsh-plugged/repos/junegunn/fzf/man* && -d "/Users/trevorj/.shell/zsh-plugged/repos/junegunn/fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/trevorj/.shell/zsh-plugged/repos/junegunn/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/trevorj/.shell/zsh-plugged/repos/junegunn/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/trevorj/.shell/zsh-plugged/repos/junegunn/fzf/shell/key-bindings.zsh"

