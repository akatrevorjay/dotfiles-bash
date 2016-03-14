
__SAVE_PATH=""

function save_path() {
    # What the fuck pyenv
    __SAVE_PATH="$PATH"
}

function restore_path() {
    # What the fuck pyenv
    PATH="$__SAVE_PATH"
    unset __SAVE_PATH
}

function first_path() {
    local test_eval="${1:-'test -e "$path"'}"
    shift

    for path in "$@"; do
        eval $test_eval || continue

        echo "$path"
        break
    done
}

: ${PYENV_ROOT:="$(first_path 'test -d "$path"' "$HOME/.pyenv" "/usr/local/var/pyenv")"}
export PYENV_ROOT

if [[ -z "$PYENV_ROOT" ]]; then
    error "PYENV_ROOT could not be found."
    return 1
fi

: ${PYENV_VIRTUALENV_DISABLE_PROMPT:=1}
export PYENV_VIRTUALENV_DISABLE_PROMPT

path_prepend \
    $(first_path 'test -d "$path"' "$PYENV_ROOT/shims") \
    $(first_path 'test -x "$path/pyenv"' "$PYENV_ROOT/bin") \
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

