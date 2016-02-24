
load_funcs() {
    #set -xv
    local function_glob='^([_.]*|prompt_*_setup|README*)(-.N:t)'
    local mod_function
    #local plugin_names=(${(@k)zplugs[@]})
    local plugin_paths=${${(@v)zplugs[@]##*dir:}%%,*}
    local p pfpath
    #for p in ${plugin_names[@]}; do
    setopt LOCAL_OPTIONS EXTENDED_GLOB
    for p in ${plugin_paths[@]}; do
        [[ "$p" = /* ]] || continue

        pfpath="$p/functions"
        [[ -d "$pfpath" ]] || continue

        fpath=($pfpath(/FN) $fpath)

        function {
            for mod_function in $pfpath/${~function_glob}; do
                autoload -Uz ${mod_function}
            done
        }
    done
    #set +xv
}

load_funcs

