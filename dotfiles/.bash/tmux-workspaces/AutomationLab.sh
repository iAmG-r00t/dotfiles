#!/bin/bash
# Tmux worspace for Automation Creative scripts development :)
# By th3gr00t

# Session Name
session="AutomationLab"
sessionexists=$(tmux list-sessions | grep $session)

# Only create tmux workspace if session doesn't exist
if [ "$sessionexists" = "" ]
then
	# Start a new session with the session name
	tmux new-session -d -s $session

	# Create windows and go to the folder location
	tmux rename-window -t 1 'Run_n_View'
	tmux send-keys -t 'Run_n_View' 'cd /home/$USER/Drudgery/Grey-Documentation' C-m 'clear' C-m
	tmux split-window -t 'Run_n_View' -h
	tmux send-keys -t 'Run_n_View' 'cd /home/$USER/Drudgery/Grey-Documentation' C-m 'clear' C-m


	tmux new-window -t $session -n 'TestingGrounds'

	tmux new-window -t $session -n 'Cyborg'

	tmux new-window -t $session -n 'OutputViewer'
	tmux send-keys -t 'OutputViewer' 'tools' C-m
	tmux send-keys -t 'OutputViewer' 'cd /home/$USER/Drudgery/Grey-Documentation' C-m 'clear' C-m
fi

# Attach session
tmux attach-session -t $session:1