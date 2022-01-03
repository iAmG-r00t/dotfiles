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

function docker_module() {

	#Checking if go is present 
	echo -e "	-> Doing some minor checks.\n"
	
	command -v docker &>/dev/null

	# shellcheck disable=SC2181
	if [ $? -ne 0 ]; then
		echo -e "		Installing: ${blue}Docker${reset} ...\n"
		# uninstall any older versions of docker
		sudo apt-get remove -qq -y docker docker-engine docker.io containerd runc

		# update system
		sudo apt-get update -qq

		# install some dependancies packages
		sudo apt-get install -qq -y \
    			apt-transport-https \
    			ca-certificates \
    			curl \
    			gnupg \
    			lsb-release

		# add docker official gpg key
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

		# add docker stable repository
		echo \
  		  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  		  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

		# install docker engine
		sudo apt-get update -qq && \
		sudo apt-get install docker-ce docker-ce-cli containerd.io
		
		# manage docker as a non-root user
		sudo groupadd docker

		sudo usermod -aG docker "$USER"

		newgrp docker

		# install docker compose
		sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

		sudo chmod +x /usr/local/bin/docker-compose
		
		# fix an future error on dial unix /var/run/docker.sock: connect: permission denied
		sudo chmod 666 /var/run/docker.sock
	else
		echo -e "		${green}Docker is already installed.${reset}\n"
	fi
}

echo -e "${bold}[+] ${brown} Desktop: ${cyan}${module}${brown} 🧾 installation module running.${reset}\n"

docker_module

echo -e "\n"
echo -e "${magenta} ✅ Completed${reset}\n"
