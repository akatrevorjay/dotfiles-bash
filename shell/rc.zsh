# Purposefully no shebang.

# Mark that we're during init

: "${SHELL_CONF_DIR:="$HOME/.shell"}"

: "${ZPLUG_HOME:="$SHELL_CONF_DIR/zsh-plugged"}"
: "${ZPLUG_REPO:="b4b4r07/zplug"}"

export SHELL_CONF_DIR ZPLUG_HOME ZPLUG_REPO

zplug_repo_dir="$ZPLUG_HOME/repos/$ZPLUG_REPO"

[[ ! -f "$SHELL_CONF_DIR/debug" ]] || DEBUG=true
[[ ! -f "$SHELL_CONF_DIR/verbose" ]] || set -v
[[ ! -f "$SHELL_CONF_DIR/trace" ]] || set -xv

. "$SHELL_CONF_DIR/lib.sh"

shellconf-zplug-setup() {
    # Ensure zplug is available.
    # Check if zplug is installed
    if [[ ! -d "$zplug_repo_dir" ]]; then
        mkdir -p "$zplug_repo_dir/../"
        git clone https://github.com/b4b4r07/zplug.git "$zplug_repo_dir"
    fi
}

shellconf-zplug-apply() {
    local verbose=""
    [[ -z "$DEBUG" ]] || verbose="--verbose"
    # Source zplug, also keep it up to date.
    zplug "b4b4r07/zplug"
    zplug check $verbose || zplug install $verbose
    zplug load $verbose
}

shellconf-init() {
    local __SHELL_CONF_INIT=true
    export __SHELL_CONF_INIT_GLOBAL=true
    debug "ShellConf: Init"

    if [ ! -d "$SHELL_CONF_DIR" ]; then
        error "SHELL_CONF_DIR=\"$SHELL_CONF_DIR\" does not exist"
        return 1
    fi

    # Base shellconf structure that's extremely ugly in glob form.
    # This wasn't originally a glob, nor was this using zplug.
    # Should look into cleaning this up at a future date.
    zplug "$SHELL_CONF_DIR", from:local, of:"(lib|rc.d)/+(^[./])+(.darwin|.$CURRENT_SHELL|.sh)(#q*)", nice:-15
    zplug "$SHELL_CONF_DIR", from:local, of:"(aliases.d|completion.d)/+(^[./])+(.darwin|.$CURRENT_SHELL|.sh)(#q*)"

    # Shellconf ZSH plugins
    for f in "$SHELL_CONF_DIR/plugins"+(.$SYSTEM|.$CURRENT_SHELL); do
        . "$f"
    done

    zplug "$SHELL_CONF_DIR", from:local, of:"(final.d)/+(^[./])+(.darwin|.$CURRENT_SHELL|.sh)(#q*)", nice: 15

    shellconf-zplug-apply
    unset __SHELL_CONF_INIT_GLOBAL
}

# Need these for those nasty globs below.
setopt extended_glob kshglob

shellconf-zplug-setup
. "$zplug_repo_dir/zplug"


# vim: set ts=4 sw=4 tw=0 ft=sh et :
