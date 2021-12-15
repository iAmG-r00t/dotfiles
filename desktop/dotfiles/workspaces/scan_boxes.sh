#!/bin/bash
# Tmux worspace for Network Scans :)
# By th3gr00t

# Session Name
session="Scan-Boxes"
sessionexists=$(tmux list-sessions | grep $session)

# Only create tmux workspace if session doesn't exist
if [ "$sessionexists" = "" ]; then
	# Start a new session with the session name
	tmux new-session -d -s $session

	# Create windows and go to the folder location
	tmux rename-window -t 1 'Files'
	tmux send-keys -t 'Files' "cd /home/$USER/Documents" C-m 'clear' C-m
	tmux split-window -t 'Files' -v
	tmux send-keys -t 'Files' "cd /home/$USER/Documents" C-m 'clear' C-m

	tmux new-window -t $session -n 'Box1'
	tmux send-keys -t 'Box1' 'mosh box1' C-m

	tmux new-window -t $session -n 'Box2'
	tmux send-keys -t 'Box2' 'mosh box2' C-m

	tmux new-window -t $session -n 'Box3'
	tmux send-keys -t 'Box3' 'mosh box3' C-m

	tmux new-window -t $session -n 'Box4'
	tmux send-keys -t 'Box4' 'mosh box4' C-m

	tmux new-window -t $session -n 'Box5'
	tmux send-keys -t 'Box5' 'mosh box5' C-m

	tmux new-window -t $session -n 'Box6'
	tmux send-keys -t 'Box6' 'mosh box6' C-m

	tmux new-window -t $session -n 'Box7'
	tmux send-keys -t 'Box7' 'mosh box7' C-m

	tmux new-window -t $session -n 'Box8'
	tmux send-keys -t 'Box8' 'mosh box8' C-m

	tmux new-window -t $session -n 'Box9'
	tmux send-keys -t 'Box9' 'mosh box9' C-m

	tmux new-window -t $session -n 'Box10'
	tmux send-keys -t 'Box10' 'mosh box10' C-m

	tmux new-window -t $session -n 'Box11'
	tmux send-keys -t 'Box11' 'mosh box11' C-m

	tmux new-window -t $session -n 'Box12'
	tmux send-keys -t 'Box12' 'mosh box12' C-m

	tmux new-window -t $session -n 'Box13'
	tmux send-keys -t 'Box13' 'mosh box13' C-m

	tmux new-window -t $session -n 'Box14'
	tmux send-keys -t 'Box14' 'mosh box14' C-m

	tmux new-window -t $session -n 'Box15'
	tmux send-keys -t 'Box15' 'mosh box15' C-m

	tmux new-window -t $session -n 'Box16'
	tmux send-keys -t 'Box16' 'mosh box16' C-m

	tmux new-window -t $session -n 'Box17'
	tmux send-keys -t 'Box17' 'mosh box17' C-m

	tmux new-window -t $session -n 'Box18'
	tmux send-keys -t 'Box18' 'mosh box18' C-m

	tmux new-window -t $session -n 'Box19'
	tmux send-keys -t 'Box19' 'mosh box19' C-m

	tmux new-window -t $session -n 'Box20'
	tmux send-keys -t 'Box20' 'mosh box20' C-m
fi

# Attach session
tmux attach-session -t $session:1
