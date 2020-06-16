#!/bin/bash
# Tmux worspace for Network Scans :)
# By th3gr00t

# Session Name
session="Scan-Servers"
sessionexists=$(tmux list-sessions | grep $session)

# Only create tmux workspace if session doesn't exist
if [ "$sessionexists" = "" ]
then
	# Start a new session with the session name
	tmux new-session -d -s $session

	# Create windows and go to the folder location
	tmux rename-window -t 1 'Files'
	tmux send-keys -t 'Files' 'cd /home/$USER/Drudgery/engagements' C-m 'clear' C-m
	tmux split-window -t 'Files' -v
	tmux send-keys -t 'Files' 'cd /home/$USER/Drudgery/engagements' C-m 'clear' C-m


	tmux new-window -t $session -n 'SS1'
	tmux send-keys -t 'SS1' 'ss1' C-m

	tmux new-window -t $session -n 'SS2'
	tmux send-keys -t 'SS2' 'ss2' C-m

	tmux new-window -t $session -n 'SS3'
	tmux send-keys -t 'SS3' 'ss3' C-m

	tmux new-window -t $session -n 'SS4'
	tmux send-keys -t 'SS4' 'ss4' C-m
fi

# Attach session
tmux attach-session -t $session:1