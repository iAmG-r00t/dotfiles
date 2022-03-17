#!/bin/bash

# Ngrok Module
# author: iAmG-r00t a.k.a th3_gr00t a.k.a Peter Numi.

# Debug mode
#set -x

# Exit or error
set -e

# --script-variables-- #

# colors
bold=$(tput bold)
reset='\033[0m'
cyan='\e[4;36m'
blue='\e[1;34m'
#green='\e[1;32m'
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

function ngrok_module() {

	# Download ngrok
	echo -e "		Downloading ${blue}ngrok${reset} from source...\n"
	wget -P "$HOME" "$(curl -s https://ngrok.com/download | grep -o -E -m 1 'https://bin.equinox.io/c/[A-Za-z0-9]{4,}/ngrok-stable-linux-amd64.tgz')"
	command -v tar &>/dev/null || sudo apt install tar && echo "Done"
	command -v tar &>/dev/null && tar xvzf "$HOME"/ngrok-stable-linux-amd64.tgz -C "$HOME" && rm "$HOME"/ngrok-stable-linux-amd64.tgz
	[ -f "$HOME"/ngrok ] && mv "$HOME"/ngrok "$HOME"/.ngrok

}

echo -e "${bold}[+] ${brown} Desktop: ${cyan}${module}${brown} 🧾 installation module running.${reset}\n"

ngrok_module

echo -e "\n"
echo -e "${magenta} ✅ Completed${reset}\n"
