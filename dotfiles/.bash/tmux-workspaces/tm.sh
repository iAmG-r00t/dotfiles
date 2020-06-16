#!/bin/bash
# Tmux workspaces and session management
# By th3gr00t

if [ -z "${TMUX}" ]; then

	# present menu for user to choose which workspace to open
	PS3=$'\n'$'\e[95m'"Please choose your session: "$'\033[0m'

	options=($(tmux list-sessions -F "#S" 2>/dev/null) "New Session" "Exit Program")
	echo -e "\e[0;34m------------------\033[0m"
	echo -e "\e[0;35mAvailable sessions\033[0m"
	echo -e "\e[0;34m------------------\033[0m"
	echo " "
	select opt in "${options[@]}"
	do
		case $opt in
			"New Session")
				read -rp "Enter new session name: " SESSION_NAME
				tmux new -s "$SESSION_NAME"
				break
				;;
			"Exit Program")
				exit
				break;;
			*)
				tmux attach-session -t "$opt"
				break
				;;
		esac
	done

else

	# Switch to available sessions when inside tmux session
	# present menu for user to choose which session to switch to
	PS3=$'\n'$'\e[95m'"Please choose the session you would love to switch to: "$'\033[0m'

	options=($(tmux list-sessions -F "#S" 2>/dev/null) "Detach Session" "Kill Session" "Exit Program")
	echo -e "\e[0;34m------------------\033[0m"
	echo -e "\e[0;35mAvailable sessions\033[0m"
	echo -e "\e[0;34m------------------\033[0m"
	echo " "
	select opt in "${options[@]}"
	do
		case $opt in
			"Detach Session")
				tmux detach
				break
				;;
			"Kill Session")
				tmux kill-session
				break
				;;
			"Exit Program")
				exit
				break;;
			*)
				tmux switch-client -t "$opt"
				break
				;;
		esac
	done

fi