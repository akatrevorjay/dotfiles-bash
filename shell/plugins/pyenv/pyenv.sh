
autoload -Uz first save-path restore-path

: ${PYENV_ROOT:="$(first 'test -d "$arg"' "$HOME/.pyenv" "/usr/local/var/pyenv")"}
export PYENV_ROOT

if [[ -z "$PYENV_ROOT" ]]; then
    error "PYENV_ROOT could not be found."
    return 1
fi

: ${PYENV_VIRTUALENV_DISABLE_PROMPT:=1}
export PYENV_VIRTUALENV_DISABLE_PROMPT

path_prepend \
    $(first 'test -d "$path"' "$PYENV_ROOT/shims") \
    $(first 'test -x "$path/pyenv"' "$PYENV_ROOT/bin") \
    && :

## pyenv
if ! has_cmd pyenv; then
    function pyenv_prompt_info() {
        echo "system: $(python -V 2>&1 | cut -f 2 -d ' ')"
    }

    return 1
fi

save_path

#eval "$(pyenv init - --no-rehash "$CURRENT_SHELL")"
eval "$(pyenv init --no-rehash - "$CURRENT_SHELL")"

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

alias pv='pyenv'
alias activate='pyenv activate'
#alias deactivate='pyenv deactivate'

restore_path

