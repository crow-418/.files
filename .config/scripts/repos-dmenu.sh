#!/bin/sh
set -eu

terminal="st"

dmenu_flags="-i -p 'Projects:'"

# Pick repo
configs="$(ls -1d "$HOME"/repos/*/ 2>/dev/null | xargs -n1 basename)"
[ -n "$configs" ] || exit 0
repo="$(printf '%s\n' $configs | eval dmenu $dmenu_flags)"
[ -n "$repo" ] || exit 0
dir="$HOME/repos/$repo"

exec $terminal -e tmux new-session -As $repo -c $dir
