#!/usr/bin/env bash

go_projects=$(find ~/code/go -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)
misc_projects=$(find ~/code/misc -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)
projects=$(echo $go_projects $misc_projects)

selected=$(echo $projects | tr ' ' '\n' | fzf --prompt="Selected projects: ")

if [[ $go_projects == *$selected* ]]; then
	cd ~/code/go/$selected
elif [[ $misc_projects == *$selected* ]]; then
	cd ~/code/misc/$selected
fi
