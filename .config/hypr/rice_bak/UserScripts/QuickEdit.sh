#!/bin/bash
# Rofi menu for Quick Edit / View of Settings (SUPER E)

configs="$HOME/.config/hypr/configs"
UserConfigs="$HOME/.config/hypr/UserConfigs"

menu() {
	printf "1. view Env-variables\n"
	printf "2. view Window-Rules\n"
	printf "3. view Startup_Apps\n"
	printf "4. view User-Keybinds\n"
	printf "5. view Monitors\n"
	printf "6. view Laptop-Keybinds\n"
	printf "7. view User-Settings\n"
	printf "8. view Workspace-Rules\n"
	printf "9. view Default-Settings\n"
	printf "10. view Default-Keybinds\n"
}

main() {
	choice=$(menu | rofi -i -dmenu -config ~/.config/rofi/config-compact.rasi | cut -d. -f1)
	case $choice in
	1)
		alacritty -e nvim "$UserConfigs/ENVariables.conf"
		;;
	2)
		alacritty -e nvim "$UserConfigs/WindowRules.conf"
		;;
	3)
		alacritty -e nvim "$UserConfigs/Startup_Apps.conf"
		;;
	4)
		alacritty -e nvim "$UserConfigs/UserKeybinds.conf"
		;;
	5)
		alacritty -e nvim "$UserConfigs/Monitors.conf"
		;;
	6)
		alacritty -e nvim "$UserConfigs/Laptops.conf"
		;;
	7)
		alacritty -e nvim "$UserConfigs/UserSettings.conf"
		;;
	8)
		alacritty -e nvim "$UserConfigs/WorkspaceRules.conf"
		;;
	9)
		alacritty -e nvim "$configs/Settings.conf"
		;;
	10)
		alacritty -e nvim "$configs/Keybinds.conf"
		;;
	*) ;;
	esac
}

main

