#!/bin/bash

: ${GOPATH:="$HOME/go"}
#: ${GOBIN:="$GOROOT/bin"}
#: ${GOARCH:="$(uname -m)"}
#: ${GOOS:="${SYSTEM:-$(uname -s)}"}
#export GOROOT GOBIN GOARCH GOOS

#: ${GOENV_ROOT:="~/.goenv"}

path_append "$GOPATH/bin"

export \
    GOPATH \
    GO15VENDOREXPERIMENT=1 \
    && :

