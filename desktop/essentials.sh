#!/bin/bash

# Essentials Module
# author: iAmG-r00t a.k.a th3_gr00t a.k.a Peter Numi.

# Debug mode
#set -x

# Exit or error
#set -e

# --script-variables-- #

# colors
bold=$(tput bold)
reset='\033[0m'
cyan='\e[4;36m'
blue='\e[1;34m'
green='\e[1;32m'
brown='\e[0;33m'
magenta="\e[95m"
red="\033[1;31m"
#no_color='\e[0m'
#blink='\e[5m'

path="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
# shellcheck disable=SC2128
filename=$(basename "$BASH_SOURCE")
module="${filename%%.*}"

# --Errors-- #

# POE: Points Out Errors
report_error() {
	echo -e "\n* ${brown}Error on line ${red}$1${reset} file: ${magenta}${filename}${reset}\n"
}

trap 'report_error $LINENO' ERR

# --main function-- #

function essentials() {

	function get() {

		command -v "$1" &>/dev/null

		# shellcheck disable=SC2181
		if [ $? -ne 0 ]; then
			echo -e "		Installing: ${blue}${1}${reset} ...\n"
			sudo apt install -y "$1" -qq
			echo " "
		else
			echo -e "		${green}${1} is already installed.${reset}\n"
		fi
	}
	sudo apt update -qq
	get curl
	get git
	get wget
	get build-essential # for building vim and tmux
	get libevent-dev    # for building tmux
	get ncurses-dev     # for building tmux
	get bison           # for building tmux
	get pkg-config      # for building tmux
	get libpcap-dev     # for naabu go tool
	get shellcheck      #shell script analysis script
	get valgrind        #c memory leak checker
	get mosh            #the mobile shell
	get wireguard       #fast, modern, secure VPN tunnel
	get fzf             #fuzzy file finder
	get ufw             #uncomplicated firewall
	get jq              # command-line JSON processor
	get tree            # recursive directory listing
	get python
	get python3
	get pip3
	get python2
	get speedtest-cli #speedtest on the terminal
	get asciinema     #record your terminal sessions

	#install pip2
	bash "$path"/modules/pip2.sh

	#install vim
	bash "$path"/modules/vim.sh

	#install tmux
	#bash "$path"/modules/tmux.sh

	#install batcat
	bash "$path"/modules/batcat.sh

	#install tailscale
	bash "$path"/modules/tailscale.sh

	#install mullvad
	bash "$path"/modules/mullvad.sh

	#install keepassx
	bash "$path"/modules/keepassXC.sh

	#install betty
	bash "$path"/modules/betty.sh

	#install udis86
	bash "$path"/modules/udis86.sh

	#install go
	bash "$path"/modules/go.sh

	#get gotools
	bash "$path"/modules/go_tools.sh

	#get docker & dockercompose
	bash "$path"/modules/go_tools.sh

	#get sublimetext
	bash "$path"/modules/subl.sh
}

function clean_up() {
	echo -e "	Doing some clean up.\n"
	sudo apt autoremove -y -qq && sudo apt remove -y -qq && sudo apt clean -qq
	if [[ -f ~/.wget-hsts ]]; then
		rm ~/.wget-hsts
	fi
}

echo -e "${bold}[+] ${brown} Desktop: ${cyan}${module}${brown} 🧾 module is running.${reset}\n"

essentials
clean_up

echo -e "\n"
echo -e "${magenta} ✅ Completed${reset}\n"
