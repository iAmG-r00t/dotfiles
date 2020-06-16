#!/bin/bash
# Tmux worspace for any data analysis
# By th3gr00t

# Session Name
session="analyze"

# create tmux session
function session1(){

	# Start a new session with the session name
	tmux new-session -d -s $session

	# Create windows and go to the folder location
	tmux rename-window -t 1 'How'
	tmux send-keys -t 'How' 'cd /home/$USER/Drudgery/engagements' C-m 'clear' C-m
	tmux split-window -t 'How' -h
	tmux send-keys -t 'How' 'cd /home/$USER/Drudgery/engagements' C-m 'clear' C-m


	tmux new-window -t $session -n 'When'
	tmux send-keys -t 'When' 'tools' C-m

	tmux new-window -t $session -n 'Where'
	tmux send-keys -t 'Where' 'tools' C-m

	# Attach session
	tmux attach-session -t $session:1

}

function session2(){
	i=1
	
	new_session="${session}_${i}"

	# Start a new session with the session name
	tmux new-session -d -s $new_session

	# Create windows and go to the folder location
	tmux rename-window -t 1 'How'
	tmux send-keys -t 'How' 'cd /home/$USER/Drudgery/engagements' C-m 'clear' C-m
	tmux split-window -t 'How' -h
	tmux send-keys -t 'How' 'cd /home/$USER/Drudgery/engagements' C-m 'clear' C-m

	tmux new-window -t $new_session -n 'When'
	tmux send-keys -t 'When' 'tools' C-m

	tmux new-window -t $new_session -n 'Where'
	tmux send-keys -t 'Where' 'tools' C-m

	# Attach session
	tmux attach-session -t $new_session:1
}

if [ -z "${TMUX}" ]; then

	# present menu for user to choose which workspace to open
	PS3=$'\n'$'\e[95m'"Please choose your session: "$'\033[0m'

	options=($(tmux list-sessions -F "#S" | grep ${session} 2>/dev/null) "Create ${session} Session" "Exit Program")
	echo -e "\e[0;34m--------------------------\033[0m"
	echo -e "\e[0;35mAnalyze workspace session\033[0m"
	echo -e "\e[0;34m--------------------------\033[0m"
	echo " "
	select opt in "${options[@]}"
	do
		case $opt in
			"Create ${session} Session")
				tmux has-session -t $session 2>/dev/null

				if [ $? != 0 ]; then
				  session1
				else
				  session2
				fi
				
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