#!/usr/bin/env bash
# shellcheck disable=SC1087,SC2046
gnome-terminal --maximize -- nvim -c 'bro ol'
# terminator -mx nvim -c 'bro ol'
# konsole --fullscreen -e nvim -c 'bro ol'
echo -e "$(basename -- "$0") exited with code=\033[0;32m$?\033[0;31m"
