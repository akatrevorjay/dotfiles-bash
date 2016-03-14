
for p in "$HOME"/.gem/ruby/*; do
    # remove trailing slash
    p="${p%/}"

    [ -d "$p/bin" ] || continue

    path_prepend "$p/bin"
done

