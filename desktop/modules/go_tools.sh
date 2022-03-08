#!/bin/bash

# Go tools modules
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

function tool_check() {

	command -v "$1" &>/dev/null

	# shellcheck disable=SC2181
	if [ $? -ne 0 ]; then
			
		echo -e "		Installing ${blue}$1${reset} go tool.\n"
		return 0
	else
		echo -e "		${green}$1 is already installed.${reset}\n"
		return 1
	fi
}

function go_tools() {
	echo -e "	Installing several go tools."
	
	# pup install
	if tool_check pup; then go get github.com/ericchiang/pup && spc; fi

	# naabu install
	if tool_check naabu; then GO111MODULE=on go get -v github.com/projectdiscovery/naabu/v2/cmd/naabu && echo " "; fi

	# mapcidr install
	if tool_check mapcidr; then GO111MODULE=on go get -v github.com/projectdiscovery/mapcidr/cmd/mapcidr && echo " "; fi

	# ep cli emoji picker
	if tool_check ep; then go get github.com/bcongdon/ep && echo " "; fi

	# metabigor osint tool
	if tool_check metabigor; then GO111MODULE=on go get github.com/j3ssie/metabigor && echo " "; fi

	# ffuf Fast web fuzzer
	if tool_check ffuf; then go get -u github.com/ffuf/ffuf && echo " "; fi

	# gowitness web screenshot
	if tool_check gowitness; then go get -u github.com/sensepost/gowitness && echo " "; fi
	echo -e "\n"
}

echo -e "${bold}[+] ${brown} Desktop: ${cyan}${module}${brown} 🧾 installation module running.${reset}\n"

go_tools

echo -e "${magenta} ✅ Completed${reset}\n"
