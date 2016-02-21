#!/bin/sh

: ${PYENV_ROOT:="$HOME/.pyenv"}

path_prepend "$PYENV_ROOT/bin" "$PYENV_ROOT/shims"
__SAVE_PATH="$PATH"

## pyenv
alias pv='pyenv'
alias activate='pyenv activate'
#alias deactivate='pyenv deactivate'
if has_cmd pyenv; then
    #eval "$(pyenv init - --no-rehash "$CURRENT_SHELL")"
    eval "$(pyenv init - "$CURRENT_SHELL")"

    # If we don't do the above then this is needed
    #source "$PYENV_ROOT/completions/pyenv."$CURRENT_SHELL""

    ## virtualenv
    #export PYENV_VIRTUALENV_CACHE_PATH="$CACHES_DIR/pip"
    # Used to check if this bin existed, but can't do that without each plugin being in PATH, ugh
    eval "$(pyenv virtualenv-init - "$CURRENT_SHELL")" || :

    ## virtualenvwrapper
    #export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
    pyenv virtualenvwrapper || :

    function pyenv_prompt_info() {
        echo "$(pyenv version-name)"
    }
else
    function pyenv_prompt_info() {
        echo "system: $(python -V 2>&1 | cut -f 2 -d ' ')"
    }
fi

# What the fuck pyenv
export PATH="$__SAVE_PATH"
unset __SAVE_PATH

