#!/usr/bin/env bash

H=30
W=25

if [[ -z "$TMUX" ]]; then
    echo "Error: this script must be run inside tmux" >&2
    exit 1
fi

session=$(tmux ls | awk -F: '
    /attached/ {print $1 "\033[32m *\033[0m"}
    !/attached/ {print $1}
' | fzf --ansi --layout=reverse --style full --prompt="Sessions> " --tmux center,${W}%,${H}%)

session=$(echo "$session" | sed 's/ (attached)$//')

if [ -n "$session" ]; then
    tmux switch-client -t "$session"
fi
