#!/bin/bash

# GO module
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

function go_module() {

	#Checking if go is present 
	echo -e "	-> Doing some minor checks.\n"
	
	command -v go &>/dev/null

	# shellcheck disable=SC2181
	if [ $? -ne 0 ]; then
		echo -e "		Installing: ${blue}Go${reset} ...\n"
		version=$(curl -s https://go.dev/dl/ | grep -oP 'id=\K["]go[0-9].*["]' | sed 's/\"\|go//g' | \
		sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | grep -v beta | tail -n 1) && \
		curl -Ss https://go.dev/dl/"$version".linux-amd64.tar.gz | \
		sudo tar -C /usr/local -xzf- && mkdir -p ~/gotools && \
		sed -i "/unset file/i # Make Go Work\nexport GOPATH=~/gotools\nexport PATH=\${PATH}:/usr/local/go/bin:\${GOPATH}/bin\n" ~/.bashrc
		# shellcheck source=/dev/null
		source ~/.bashrc
	else
		echo -e "		${green}Go is already installed.${reset}\n"
	fi
}

echo -e "${bold}[+] ${brown} Desktop: ${cyan}${module}${brown} 🧾 installation module running.${reset}\n"

go_module

echo -e "\n"
echo -e "${magenta} ✅ Completed${reset}\n"
