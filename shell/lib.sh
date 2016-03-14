
function -shellconf-log {
	[[ -n "$SC_LOG_LEVEL" ]] || \
		local SC_LOG_LEVEL="${FUNCNAME[1]}"

	case "$SC_LOG_LEVEL" in
		debug|warn|warning|error|death) ;;
		*) SC_LOG_LEVEL="info" ;;
	esac

	## Find what generated this output
	if [[ -z "$SC_LOG_FUNC" ]]; then
		local j=0 i=; for i in "${FUNCNAME[@]:1:3}"; do
            let j+=1
            case "$i" in
                debug|e|error|info|death)			continue ;;
                #$HOOK|main|source)					break ;;
                *) local SC_LOG_FUNC="$i";	break ;;
            esac
        done
	fi

	if [[ -z "$SC_LOG_SOURCE" ]]; then
		local SC_LOG_SOURCE="${BASH_SOURCE[$j]#$PWD/}"
		SC_LOG_SOURCE="${SC_LOG_SOURCE#./}:${BASH_LINENO[$(($j - 1))]}"
	fi

	[[ -n "$SC_LOG_HOOK" ]] || \
		local SC_LOG_HOOK="${hook:-unset}"

    local date=$(printf "%(%F %I:%M%P)T" -1)
    echo "[$date] [$(printf "%18s" "$SC_LOG_SOURCE")] [$(printf "%8s" "$SC_LOG_HOOK")] ${SC_LOG_FUNC}: $*"
}

function -shellconf-echo   { echo "$0[$$]" "${@:2}" "#$1" ; }
function debug             { [ -z "$DEBUG" ] || -shellconf-echo DEBUG "$@"; }
function e                 { [ -n "$QUIET" ] || -shellconf-echo INFO "$@"; }
function info              { e "$@"; }
function warn              { [ -n "$QUIET" ] || -shellconf-echo WARNING "$@"; }
function warning           { warn "$@"; }
function error             { -shellconf-echo ERROR "$@" >&2; }
function death             { error "$@"; exit 1; }
function debug_call        { debug 'call:' "$@"; "$@"; }

if [ -z "$CURRENT_SHELL" ]; then
    error "CURRENT_SHELL is not set"
    CURRENT_SHELL="unknown_shell"
fi

SYSTEM="$(uname -s | tr '[:upper:]' '[:lower:]')"
[ -n "$SYSTEM" ] || SYSTEM="unknown_system"

# vim: set ts=4 sw=4 tw=0 ft=sh et :
