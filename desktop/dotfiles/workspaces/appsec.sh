#!/bin/bash
# Tmux worspace for Mobile Application Security Testing
# By th3gr00t

# Session Name
session="AppSec"
sessionexists=$(tmux list-sessions | grep $session)

# Only create tmux workspace if session doesn't exist
if [ "$sessionexists" = "" ]; then
	# Start a new session with the session name
	tmux new-session -d -s $session

	# Create windows and go to the folder location
	tmux rename-window -t 1 'ADB'
	tmux send-keys -t 'ADB' "cd /home/$USER" C-m 'clear' C-m

	tmux new-window -t $session -n 'Burp'
	tmux send-keys -t 'Burp' 'tools' C-m

	tmux new-window -t $session -n 'Frida'
	tmux send-keys -t 'Frida' "cd /home/$USER/tools" C-m 'clear' C-m

	tmux new-window -t $session -n 'Anything'
fi

# Attach session
tmux attach-session -t $session:1
