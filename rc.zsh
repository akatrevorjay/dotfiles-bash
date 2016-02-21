# Purposefully no shebang.

# Mark that we're during init
export __SHELL_CONF_INIT=true

: "${SHELL_CONF_DIR:="$HOME/.shell"}"

export SHELL_CONF_DIR

[[ ! -f "$SHELL_CONF_DIR/debug" ]] || DEBUG=true
[[ ! -f "$SHELL_CONF_DIR/verbose" ]] || set -v
[[ ! -f "$SHELL_CONF_DIR/trace" ]] || set -xv

. "$SHELL_CONF_DIR/lib.sh"

shellconf-zplug-setup() {
    : ${ZPLUG_HOME:="$SHELL_CONF_DIR/zsh-plugged"}
    export ZPLUG_HOME

    # Ensure zplug is available.
    # Check if zplug is installed
    local zplug_repo_dir="$ZPLUG_HOME/repos/b4b4r07/zplug"
    if [[ ! -d "$zplug_repo_dir" ]]; then
        mkdir -p "$zplug_repo_dir/../"
        git clone https://github.com/b4b4r07/zplug.git "$zplug_repo_dir"
    fi

    # Need these for those nasty globs below.
    setopt extended_glob kshglob

    # Source zplug, also keep it up to date.
    . "$ZPLUG_HOME/repos/b4b4r07/zplug/zplug"
    zplug "b4b4r07/zplug"
}

shellconf-zplug-apply() {
    local verbose=""
    [[ -z "$DEBUG" ]] || verbose="--verbose"
    zplug check $verbose || zplug install $verbose
    zplug load $verbose
}

shellconf-init() {
    debug "ShellConf: Init"

    if [ ! -d "$SHELL_CONF_DIR" ]; then
        error "SHELL_CONF_DIR=\"$SHELL_CONF_DIR\" does not exist"
        return 1
    fi

    shellconf-zplug-setup

    # Base shellconf structure that's extremely ugly in glob form.
    # This wasn't originally a glob, nor was this using zplug.
    # Should look into cleaning this up at a future date.
    zplug "$SHELL_CONF_DIR", from:local, of:"(lib|rc.d)/+(^[./])+(.darwin|.$CURRENT_SHELL|.sh)(#q*)", nice:-15
    zplug "$SHELL_CONF_DIR", from:local, of:"(aliases.d|completion.d)/+(^[./])+(.darwin|.$CURRENT_SHELL|.sh)(#q*)"
    zplug "$SHELL_CONF_DIR", from:local, of:"(final.d)/+(^[./])+(.darwin|.$CURRENT_SHELL|.sh)(#q*)", nice: 15

    # Shellconf ZSH plugins
    . "$SHELL_CONF_DIR/plugins.zsh"

    shellconf-zplug-apply
}


unset __SHELL_CONF_INIT

# vim: set ts=4 sw=4 tw=0 ft=sh et :
