#!/bin/sh
#export CCACHE_NLEVELS=5

for p in "/usr/lib/ccache" "/usr/local/opt/ccache/libexec"; do
    [[ ! -d "$p" ]] || path_prepend "$p"
done
unset p

! which distcc >/dev/null 2>&1 || export CCACHE_PREFIX=distcc
