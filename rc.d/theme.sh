#!/bin/bash

for f_rel in {"${CURRENT_SHELL}-",}theme; do
    f_abs="$SHELL_CONF_DIR/$f_rel"
    [[ -e "$f_abs" && -x "$f_abs" ]] || continue
    debug "Chosen theme: $f_rel"
    . "$f_abs"
    break
done

