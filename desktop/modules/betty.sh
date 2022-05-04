#!/bin/bash

# Betty module
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

function betty_module() {

	# Install's vim from github
	echo -e "	-> Doing some minor checks.\n"

	command -v betty &>/dev/null

	# shellcheck disable=SC2181
	if [ $? -ne 0 ]; then
		echo -e "		Installing: ${blue}betty${reset} ...\n"
		git clone https://github.com/holbertonschool/Betty.git /tmp/betty \
		&& cd /tmp/betty/ && sudo bash install.sh && cd - \
		&& rm -rf /tmp/betty

		curl -fsSL -o betty https://raw.githubusercontent.com/iAmG-r00t/dotfiles/master/desktop/modules/betty_script \
		&& chmod a+x betty && sudo mv betty /usr/local/bin/
		echo -e "\n"
	else
		echo -e "		${green}Betty is already installed.${reset}\n"
	fi
}

echo -e "${bold}[+] ${brown} Desktop: ${cyan}${module}${brown} 🧾 installation module running.${reset}\n"

betty_module

echo -e "${magenta} ✅ Completed${reset}\n"
