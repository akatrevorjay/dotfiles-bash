#!/bin/bash
man () {
  case "$(type -t "$1"):$1" in
    builtin:*) help "$1" | "${PAGER:-less}";;     # built-in
    *[[?*]*) help "$1" | "${PAGER:-less}";;       # pattern
    *) command -p man "$@";;  # something else, presumed to be an external command
                              # or options for the man command or a section number
  esac
}
