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
# This script requires the separate zeek-complete Python script for all the
# heavy lifting. Make sure it's in your PATH.

_zeek_complete()
{
    # This is a workaround to make completion work reasonably well in the
    # presence of "=" and ":" characters in the completions, which are normally
    # considered part of word breaks via the COMP_WORDBREAKS variable.  See
    # https://stackoverflow.com/a/12495480 as well as the contents of
    # /usr/share/bash-completion/bash_completion or similars.
    local cur prev
    _comp_get_words -n := cur prev

    # COMPREPLY is the interface to the complete command for returning
    # completions. Populate it with the output of our script. We put the COMP_
    # variables in the environment since they're not otherwise available to
    # zeek-complete.
    export COMP_TYPE COMP_LINE COMP_POINT
    mapfile -t COMPREPLY < <( zeek-complete zeek "$cur" "$prev" )

    # Part II of the above workaround:
    _comp_ltrim_colon_completions "$cur"
}

# Without the above workarounds you can invoke zeek-complete e.g. like this:
# zeek-complete 2>/dev/null && complete -o default -o nospace -C zeek-complete zeek

zeek-complete 2>/dev/null && complete -o nospace -F _zeek_complete zeek
