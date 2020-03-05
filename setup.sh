#!/bin/bash
# Script to setup my whole desktop enviroment
# by @th3-gr00t

bold=`tput bold`
reset='\033[0m'
blue='\e[1;34m'
no_color='\e[0m'
blink='\e[5m'
brown='\e[0;33m'

#./software.sh
./dotfiles/dotfiles.sh
./wg/wg.sh
./desktop.sh

#Update and clean
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean

#Reload configs
source ~/.bashrc
#Remove default bash-history
rm ~/.bash_history
#Install VIM Plugins
vim +PlugInstall +qall
#Installing TMUX Plugins
# start a server but don't attach to it
tmux start-server
# Create a new session but don't attach to it either
tmux new-session -d
# Install the plugins
~/.dotfiles/.tmux/plugins/tpm/scripts/install_plugins.sh
# killing the server is not required, I guess
tmux kill-server

# Enabling Uncomplicated Firewall
sudo ufw enable
sudo ufw status verbose

figlet "... Here's to getting back into the groove" | lolcat
sleep 5
echo -e "${no_color}${bold}[+] ${brown}Ohhhh one more thing ...${no_color} ${blink}${blue}Bye enjoy ...${reset}"
sleep 5
clear
