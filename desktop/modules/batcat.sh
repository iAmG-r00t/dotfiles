#!/bin/bash

# BatCat module
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

function batcat_module() {

	echo -e "	-> Doing some minor checks.\n"

	command -v bat &>/dev/null

	# shellcheck disable=SC2181
	if [ $? -ne 0 ]; then
		echo -e "		Installing: ${blue}batcat${reset} ...\n"
		curl -s https://api.github.com/repos/sharkdp/bat/releases/latest \
		| grep "browser_download_url.*" \
		| grep "bat_.*._amd64.deb" \
		| cut -d : -f 2,3 \
		| tr -d '"' \
		| wget -qi - \
		&& sudo dpkg -i bat_*_amd64.deb && rm bat_*_amd64.deb
		echo " "
	else
		echo -e "		${green}batcat is already installed.${reset}\n"
	fi
}

echo -e "${bold}[+] ${brown} .....: ${cyan}${module}${brown} 🧾 installation module running.${reset}\n"

batcat_module

echo -e "${magenta} ✅ Completed${reset}\n"
