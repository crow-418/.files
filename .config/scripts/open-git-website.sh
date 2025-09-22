#!/usr/bin/env bash

set -euo pipefail

cd $(tmux run "echo #{pane_current_path}")

cmd_exists() { command -v $1 >/dev/null 2>&1; }
open_url() {
    if cmd_exists xdg-open; then
        xdg-open $1 >/dev/null 2>&1 &
    elif cmd_exists open; then
        open $1
    else printf '%s\n' $1; fi
}

git_root=$(git rev-parse --show-toplevel 2>/dev/null || true)
if [ -z $git_root ]; then
    printf 'Not a git repo\n' >&2
    exit 1
fi

remote_name=origin
if ! git remote get-url origin >/dev/null 2>&1; then
    remote_name=$(git remote | awk 'NR==1{print $0}')
fi

remote_url=$(git remote get-url $remote_name 2>/dev/null || true)
if [ -z $remote_url ]; then
    printf 'No remote found\n' >&2
    exit 1
fi

parse_remote() {
    local url=$1 host path
    if [[ $url =~ ^git@([^:]+):(.+)$ ]]; then
        host=${BASH_REMATCH[1]}
        path=${BASH_REMATCH[2]}
    elif [[ $url =~ ^ssh://([^@]+@)?([^/:]+)(:[0-9]+)?/(.+)$ ]]; then
        host=${BASH_REMATCH[2]}
        path=${BASH_REMATCH[4]}
    elif [[ $url =~ ^https?://([^/]+)/(.*)$ ]]; then
        host=${BASH_REMATCH[1]}
        path=${BASH_REMATCH[2]}
    else
        host=$(echo $url | sed -E 's#.*@([^/:]+).*#\1#')
        path=$(echo $url | sed -E 's#.+[:/](.+)$#\1#')
    fi
    path=${path%.git}

    printf "%s|%s" $host $path
}

IFS='|' read -r host path <<<$(parse_remote $remote_url)

# basic URL-encode for spaces
url_encode() { printf '%s' "${1// /%20}"; }

enc_host=$(url_encode $host)
enc_path=$(url_encode $path)

url="https://${enc_host}/${enc_path}"

xdg-open "$url"
printf '%s\n' "$url"
