#!/usr/bin/env bash

# This script is inspired by: https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-cht.sh
languages=$(echo "go lua c typescript nodejs" | tr ' ' '\n')
core_utils=$(echo "xargs find sed awk" | tr ' ' '\n')

selected=$(printf "$languages\n$core_utils" | fzf)
read -p "enter query: " query

if printf $languages | grep -qs $selected; then
	query=$(echo $query | tr ' ' '+')
	tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
	tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
