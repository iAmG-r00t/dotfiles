#!/bin/bash

# pip2 module
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

function pip2_module() {

	echo -e "	-> Doing some minor checks.\n"
	command -v python2 &> /dev/null

	# shellcheck disable=SC2181
	if [ $? -ne 0 ]; then
		echo -e "               Installing: ${blue}python2 and pip2${reset} ...\n"
			sudo apt install -y python2

		# get pip2 and install it
		curl -s https://bootstrap.pypa.io/get-pip.py -o get-pip.py
		sudo python2 get-pip.py
		rm get-pip.py
	else
		echo -e "            	Checking if pip2 is installed.\n"

		nopip="$(python2 -m pip |& grep -q 'No module named' && echo nopip2 || echo okay)"

		if [[ "$nopip" == nopip2  ]]; then
			echo -e "               Installing: ${blue}pip2${reset} ...\n"
			# get pip2 and install it
                	curl -s https://bootstrap.pypa.io/pip/2.7/get-pip.py -o /tmp/get-pip.py
                	sudo python2 /tmp/get-pip.py
                	rm /tmp/get-pip.py
		fi

		if [[ "$nopip" == okay ]]; then
			echo -e "		${green}python2 and pip2 are both already installed.${reset}\n"
		fi
	fi
}

echo -e "${bold}[+] ${brown} .....: ${cyan}${module}${brown} 🧾 installation module running.${reset}\n"

pip2_module

echo -e "\n"
echo -e "${magenta} ✅ Completed${reset}\n"
