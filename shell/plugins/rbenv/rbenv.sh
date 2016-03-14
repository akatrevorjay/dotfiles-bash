
: ${RBENV_ROOT:="$HOME/.rbenv"}
export RBENV_ROOT

[[ -n "$RBENV_ROOT" ]] || return 1

path_prepend "$RBENV_ROOT/bin" "$RBENV_ROOT/shims"
__SAVE_PATH="$PATH"

## rbenv
alias rv='rbenv'
#alias activate='rbenv activate'
#alias deactivate='rbenv deactivate'
if has_cmd rbenv; then
    #eval "$(rbenv init --no-rehash - "$CURRENT_SHELL")"
    eval "$(rbenv init -)"

    # If we don't do the above then this is needed
    #source "$RBENV_ROOT/completions/rbenv."$CURRENT_SHELL""

    function rbenv_prompt_info() {
        rbenv version-name || :
    }
else
    function rbenv_prompt_info() {
        echo "system: $(ruby -V 2>&1 | cut -f 2 -d ' ')"
    }
fi

## What the fuck rbenv
#export PATH="$__SAVE_PATH"
#unset __SAVE_PATH
