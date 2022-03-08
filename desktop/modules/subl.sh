#!/bin/bash

# Sublime module
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

#path="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
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

function sublime_module() {

	# minor checks, gets repo for sublime
	echo -e "	-> Doing some minor checks.\n"

	command -v subl &>/dev/null

	# shellcheck disable=SC2181
	if [ $? -ne 0 ]; then
		echo -e "		Installing: ${blue}sublime text${reset} ...\n"
		# install gpg key
		curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/sublime.gpg --import
		sudo chmod 644 /etc/apt/trusted.gpg.d/sublime.gpg

		# select stable channel
		echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

		# update and install
		sudo apt-get update -qq &&
			sudo apt-get install sublime-text -y -qq
		echo -e "\n"
	else
		echo -e "		${green}Sublime is already installed.${reset}\n"
	fi

}

echo -e "${bold}[+] ${brown} Desktop: ${cyan}${module}${brown} 🧾 installation module running.${reset}\n"

sublime_module

echo -e "${magenta} ✅ Completed${reset}\n"
