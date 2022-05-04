#!/bin/bash

# Set-up pwn enviroment
# Credits: @bet4it at github:build an efficient pwn environment
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

function hyperpwn() {
	#Downloads hyper
	curl -LSs -o /tmp/hyper.deb https://releases.hyper.is/download/deb
	sudo dpkg -i /tmp/hyper.deb
	rm /tmp/hyper.deb
}

# --main function-- #

glib_ver=$(ldd --version | head -n 1 | awk -F'\[()]' '{print $2}')

function pwnENV() {

  if [[ -z "$glib_ver" ]]; then
    echo -e "${bold}[+] ${green} GLIB is installed.${reset}\n"    
  else
    echo -e "${red}GLIB is not installed.${reset}\n"
    return 1
  fi

  get gdb
  get gdbserver
  get python3									# pwntools requirements
  get python3-pip								# '
  get python3-dev								# '
  get git										# '
  get libssl-dev								# '
  get libffi-dev								# '
  get build-essential							# '
  python3 -m pip install --upgrade pip			# '
  python3 -m pip install --upgrade pwntools		# install pwntools
  get ipython3

  hyperpwn

  hyper i hyperinator
  hyper i hyperpwn

  #Download GDBplugins
  curl -fsSL https://raw.githubusercontent.com/iAmG-r00t/dotfiles/master/desktop/modules/GDBplugins.sh | bash

}

echo -e "${bold}[+] ${brown} .....: ${cyan}${module}${brown} 🧾 installation module running.${reset}\n"

pwnENV

echo -e "\n"
echo -e "${magenta} ✅ Completed${reset}\n"
