# -*- shell-script -*-
#
# Typically that would be added under one of the following paths:
# - /etc/bash_completion.d
# - /usr/local/etc/bash_completion.d
# - /usr/share/bash-completion/completions

# This requires the separate zeek-completer Python script.
zeek-completer 2>/dev/null && complete -o default -C zeek-completer zeek
