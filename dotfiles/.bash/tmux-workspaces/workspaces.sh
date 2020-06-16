#!/bin/bash
# List workspaces
# By th3gr00t

	
# present menu for user to list workspaces to open
PS3=$'\n'$'\e[95m'"Please choose your workspace: "$'\033[0m'

options=("AppSec" "Scan Servers" "Anything Can Go Here" "Automation Lab" "Analyze" "Exit Program")
echo -e "\e[0;34m---------------\033[0m"
echo -e "\e[0;35mTmux Workspaces\033[0m"
echo -e "\e[0;34m---------------\033[0m"
echo " "
select opt in "${options[@]}"

do
	case $opt in
		"AppSec")
			sh /home/$USER/.dotfiles/.bash/tmux-workspaces/appsec.sh
			break;;
		"Scan Servers")
			sh /home/$USER/.dotfiles/.bash/tmux-workspaces/scan_servers.sh
			break;;
		"Anything Can Go Here")
			/home/$USER/.dotfiles/.bash/tmux-workspaces/AnythingCanGoHere.sh
			break;;
		"Automation Lab")
			sh /home/$USER/.dotfiles/.bash/tmux-workspaces/AutomationLab.sh
			break;;
		"Analyze")
			/home/$USER/.dotfiles/.bash/tmux-workspaces/analyze.sh
			break;;
		"Exit Program")
			exit
			break;;
	esac
done