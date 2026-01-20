#!/bin/sh
set -eu

kb_name="$(hyprctl devices | awk '
    /^Keyboard / {
        name=$2;
        sub(/:$/, "", name);
        if (first == "") { first = name }
        next
    }
    $1 == "main:" && $2 == "yes" {
        print name;
        exit
    }
    END {
        if (first != "") { print first }
    }
')"

if [ -n "${kb_name:-}" ]; then
    hyprctl switchxkblayout "$kb_name" 0 >/dev/null 2>&1 || true
fi

exec hyprlock
