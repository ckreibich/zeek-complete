# -*- shell-script -*-
# shellcheck shell=bash
#
# This file gets sourced by Bash's completion setup and typically lives in one
# of the following paths:
#
# - /etc/bash_completion.d
# - /usr/local/etc/bash_completion.d
# - /usr/share/bash-completion/completions
#
# You can also say "source path/to/this/zeek" explicitly.
#
# This script requires the separate zeek-completer Python script for all the
# heavy lifting. Make sure it's in your PATH.
#
# The default option is to get normal completion if the script cannot come up
# with one, and nospace indicates that the completion script takes care of any
# whitespace suffixes itself.
#
zeek-completer 2>/dev/null && complete -o default -o nospace -C zeek-completer zeek
