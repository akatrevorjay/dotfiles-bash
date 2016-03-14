#!/bin/bash
# ___________________
# keychain-wrapper.sh
#
# -- Simple wrapper to auto-spawn keychain for a target command.
#
# * Installation via shell pipe:
#
#     curl -sL https://gist.github.com/akatrevorjay/5487632/raw/keychain-wrapper.sh | bash
#
# * Checks if shell is interactive and acts accordingly; lots of apps exec
#   these so output is critical to be what's expected there.
#
# * This has to be in a directory BEFORE your target in $PATH.
#   It does have basic infinite loop protection in case you happen to not read
#   this however, as I've done it by accident myself over the years ;)
#
# * Updated for keychain 2.8.1 now that it doesn't override PATH
#
# ~trevorj --sometime-very-long-ago--
#
set -eo pipefail
shopt -s nullglob

# Space separated
: ${SSH_KEYS:="$HOME/.ssh/*_rsa $HOME/.ssh/*.pem"}
: ${GPG_KEYS:="9871F640 FFE86CB2 E810DFD7 BC54FEAE $GPGKEY"}

# Better left untouched unless you know what you're doing.
: ${KEYCHAIN_FILE_GLOB:="$HOME/.keychain/$HOSTNAME-sh*"}

# Keychain arguments
: ${KEYCHAIN_ARGS:="--quiet --nogui --timeout 300 --ignore-missing --confhost --quick --noinherit"}

# Be quieter in non-interactive shells
if shopt -oq posix; then
    KEYCHAIN_ARGS+=" --quiet --noask"
fi

SELF="$(basename "$0")"
ABS_SELF="$(realpath -es "$0" || echo "$0")"

function e              { echo "[$SELF]" "$@"; }
function debug          { [[ -z "$DEBUG" ]] || e "$@"; }
function error          { e "$@" >&2; }
function death          { error "$@"; exit 1; }
function debug_verbose  { debug "$*"; "$@"; }

function install_wrapper {
    : ${WRAPPER_PATH:="$HOME/.bin/keychain-wrapper.sh"}
    : ${WRAPPER_TARGETS:="ssh gpg gpg2"}
    : ${WRAPPER_URL:="https://gist.github.com/akatrevorjay/5487632/raw/keychain-wrapper.sh"}
    WRAPPER_NAME="$(basename "$WRAPPER_PATH")"
    WRAPPER_BIN="$(dirname "$WRAPPER_PATH")"

    e "Installing \"$WRAPPER_NAME\" to \"$WRAPPER_PATH\""
    mkdir -pv "$WRAPPER_BIN"
    cd "$WRAPPER_BIN"

    e "Downloading latest"
    curl --silent --show-error -L "$WRAPPER_URL" > "$WRAPPER_NAME.new"
    chmod +x "$WRAPPER_NAME.new"
    mv -v "$WRAPPER_NAME.new" "$WRAPPER_NAME"

    e "Symlinking targets: $WRAPPER_TARGETS"
    for i in $WRAPPER_TARGETS; do
        [[ ! -e "$i" ]] || continue
        debug "Symlinking target: \"$i\""
        ln -sv "$WRAPPER_NAME" "$i"
    done

    e "All done."

    echo
    e 'Put a directory in the beginning of $PATH somewhere in your shell init,'
    e '  ala ~/.bashrc, with a line such as the following at the end of the file:'
    e "    export PATH=\"$WRAPPER_BIN:\$PATH\""
}

# Act accrdingly to what kind of wrapper we are
TARGET="$SELF"
case "$TARGET" in
    s)  TARGET="ssh" ;&
    ssh*)
        : ${KEYS:="$SSH_KEYS"}
        : ${AGENTS:="ssh"}
        ;;

    t)  TARGET="telnet" ;&
    gpg*|telnet)
        : ${KEYS:="$GPG_KEYS"}
        : ${AGENTS:="gpg"}
        ;;

    *)
        # Install if we're ran through a pipe or arg is "install"
        if [[ $# -eq 1 && "$1" == "install" ]]; then
            WRAPPER_PATH="$ABS_SELF" install_wrapper
            exit 0
        elif [[ $# -eq 0 && "$SELF" == "bash" ]]; then
            # Running through a pipe, just do an install
            install_wrapper
            exit 0
        fi

        # Default to all keys
        : ${KEYS:="$SSH_KEYS $GPG_KEYS"}
        # Default to all agents applicable
        : ${AGENTS:="ssh gpg"}
        ;;
esac

debug "Keys: $KEYS"
debug "Agents: $AGENTS"

# Put agents in the argument list as applicable
[[ -z "$AGENTS" ]] \
    || KEYCHAIN_ARGS+=" --agents ${AGENTS// /,}"

# Find wrapped executable in PATH
debug "Finding wrapped target for \"$TARGET\""
for path in $(type -pa "$TARGET" 2>/dev/null); do
    # Verify absolute paths don't match ourselves (fruity loops detection)
    abs_path=$(realpath -es "$path")
    [[ "$abs_path" != "$ABS_SELF" ]] || continue

    # We have a winner
    NEW_TARGET="$path"
    break
done
debug "Wrapped target: $NEW_TARGET"

# Assert new target
[[ -n "$NEW_TARGET" ]] \
  || death "Could not find wrapped \"$TARGET\" in PATH."

# Run keychain
if [[ -n "$KEYS" && -n "$KEYCHAIN_FILE_GLOB" && -z "$__KEYCHAIN_WRAPPER" ]]; then
    # For fruity loop detection in case anything we run happens to run ssh
    # (newer keychain does to get the version!)
    export __KEYCHAIN_WRAPPER=yes

    type -p keychain >/dev/null 2>&1 \
        || death "Could not find keychain. Install it through apt/homebrew/whatevs."

    debug_verbose keychain $KEYCHAIN_ARGS $KEYS \
        || error "keychain had a bad retval: $?"
fi

debug "Sourcing keychain files from glob: $KEYCHAIN_FILE_GLOB"
for KEYCHAIN_FILE in $KEYCHAIN_FILE_GLOB; do
    debug "Keychain file: $KEYCHAIN_FILE"

    # Assert keychain file exists
    [[ -f "$KEYCHAIN_FILE" ]] \
        || death "Could not include \"$KEYCHAIN_FILE\""

    # Source keychain vars
    . "$KEYCHAIN_FILE"
done

# Finally run our wrapped target
debug_verbose exec "$NEW_TARGET" "$@"
