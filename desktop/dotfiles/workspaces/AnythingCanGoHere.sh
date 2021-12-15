#!/bin/bash
# Tmux worspace for Anthing
# By th3gr00t

# Session Name
session="AnythingCanGoHere"

function session1() {

	# Start a new session with the session name
	tmux new-session -d -s $session

	# Rename and create window
	tmux rename-window -t 1 'Free'

	tmux new-window -t $session -n 'Other'

	# Attach session
	tmux attach-session -t $session:1

}

function session2() {
	i=1

	new_session="${session}_${i}"

	# Start a new session with the session name
	tmux new-session -d -s $new_session

	# Rename and create window
	tmux rename-window -t 1 'Free'

	tmux new-window -t $new_session -n 'Other'

	# Attach session
	tmux attach-session -t $new_session:1
}

if [ -z "${TMUX}" ]; then

	# present menu for user to choose which workspace to open
	PS3=$'\n'$'\e[95m'"Please choose your session: "$'\033[0m'

	#shellcheck disable=SC2207
	options=($(tmux list-sessions -F "#S" | grep ${session} 2>/dev/null) "Create ${session} Session" "Exit Program")
	echo -e "\e[0;34m--------------------------\033[0m"
	echo -e "\e[0;35mAnythingCanGoHere workspace session\033[0m"
	echo -e "\e[0;34m--------------------------\033[0m"
	echo " "
	select opt in "${options[@]}"; do
		case $opt in
		"Create ${session} Session")
			tmux has-session -t $session 2>/dev/null

			#shellcheck disable=SC2181
			if [ $? != 0 ]; then
				session1
			else
				session2
			fi

			break
			;;
		"Exit Program")
			exit
			break
			;;
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

	#shellcheck disable=SC2207
	options=($(tmux list-sessions -F "#S" 2>/dev/null) "Detach Session" "Kill Session" "Exit Program")
	echo -e "\e[0;34m------------------\033[0m"
	echo -e "\e[0;35mAvailable sessions\033[0m"
	echo -e "\e[0;34m------------------\033[0m"
	echo " "
	select opt in "${options[@]}"; do
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
			break
			;;
		*)
			tmux switch-client -t "$opt"
			break
			;;
		esac
	done

fi
