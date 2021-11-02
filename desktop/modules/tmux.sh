#!/bin/bash

# Tmux module
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

function tmux_module() {

	# Installs tmux from github
	echo -e "	-> Doing some minor checks.\n"

	command -v tmux &>/dev/null

	# shellcheck disable=SC2181
	if [ $? -ne 0 ]; then
		echo -e "		Installing: ${blue}tmux${reset} ...\n"
		curl -s https://api.github.com/repos/tmux/tmux/releases/latest \
		| grep "browser_download_url.*" | grep "tmux-.*.tar.gz" \
		| cut -d : -f 2,3 | tr -d '"' \
		| wget -P /tmp -qi - \
		&& tar -zxf /tmp/tmux-*.tar.gz -C /tmp/ \
		&& cd /tmp/tmux-*/ && ./configure \
		&& make && sudo make install \
		&& cd - && rm -rf /tmp/tmux*
		echo " "
	else
		echo -e "       	Installing updated tmux version.\n"
		sudo apt-get remove tmux -y -qq \
		&& curl -s https://api.github.com/repos/tmux/tmux/releases/latest \
                | grep "browser_download_url.*" | grep "tmux-.*.tar.gz" \
                | cut -d : -f 2,3 | tr -d '"' \
                | wget -P /tmp -qi - \
                && tar -zxf /tmp/tmux-*.tar.gz -C /tmp/ \
                && cd /tmp/tmux-*/ && ./configure \
                && make && sudo make install \
                && cd - && rm -rf /tmp/tmux*
                echo " "
	fi
}

echo -e "${bold}[+] ${brown} .....: ${cyan}${module}${brown} 🧾 installation module running.${reset}\n"

tmux_module

echo -e "\n"
echo -e "${magenta} ✅ Completed${reset}\n"
