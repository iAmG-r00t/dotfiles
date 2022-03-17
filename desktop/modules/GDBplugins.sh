#!/bin/bash

# GDB Plugins Module
# author: iAmG-r00t a.k.a th3_gr00t a.k.a Peter Numi.
# credits: https://github.com/apogiatzis/gdb-peda-pwndbg-gef @apogiatzis

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

path="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
toolspath="$HOME/tools"
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

function gdb_plugins() {

	if [ ! -d "$toolspath" ]; then
		mkdir -p "$toolspath"
	fi
	
	if [ -d "$toolspath"/peda ] && [ -d "$toolspath"/peda-arm ] && [ -d "$toolspath"/pwndbg ] && [ -d "$toolspath"/gef ]; then
		echo -e "		${green}GDB Plugins present, proceeding to updating them.${reset}\n"
		echo -e "[+] ${blue}Updating PEDA${reset}\n"
		cd "$toolspath"/peda && git pull

		echo -e "\n[+] ${blue}Updating PEDA-ARM${reset}\n"
		cd "$toolspath"/peda-arm && git pull

		echo -e "\n[+] ${blue}Updating Pwndbg${reset}\n"
		cd "$toolspath"/pwndbg && git pull
		
		echo -e "\n[+] ${blue}Updating GEF${reset}\n"
		cd "$toolspath"/gef && git pull
	else
		# Installs GDB Plugins
		echo -e "		Installing: ${blue}GDB Plugins${reset} ...\n"

		echo -e "[+] ${magenta}Downloading PEDA${reset}\n"
		git clone https://github.com/longld/peda.git "$toolspath"/peda
	    
		echo -e "\n[+] ${magenta}Downloading PEDA ARM${reset}\n"
		git clone https://github.com/alset0326/peda-arm.git "$toolspath"/peda-arm

		echo -e "\n[+] ${magenta}Downloading Pwndbg${reset}\n"
		git clone https://github.com/pwndbg/pwndbg.git "$toolspath"/pwndbg

		cd "$toolspath"/pwndbg && ./setup.sh

		echo -e "\n[+] ${magenta}Downloading GEF${reset}\n"
		git clone https://github.com/hugsy/gef.git "$toolspath"/gef

		echo -e "\n[+] ${blue}Setting .gdbinit${reset}\n"
		if [ -f ~/.gdbinit ] || [ -h ~/.gdbinit ]; then
			cp ~/.gdbinit ~/.gdbinit.bak
		fi
		cp "$path"/../dotfiles/gdb/gdbinit ~/.gdbinit

		{
		echo -e "[+] ${blue}Copying files${reset}\n"
			sudo cp "$path"/../dotfiles/gdb/gdb-peda /usr/bin/gdb-peda &&\
			sudo cp "$path"/../dotfiles/gdb/gdb-peda-arm /usr/bin/gdb-peda-arm &&\
			sudo cp "$path"/../dotfiles/gdb/gdb-peda-intel /usr/bin/gdb-peda-intel &&\
			sudo cp "$path"/../dotfiles/gdb/gdb-pwndbg /usr/bin/gdb-pwndbg &&\
			sudo cp "$path"/../dotfiles/gdb/gdb-gef /usr/bin/gdb-gef
		} || {
		echo "[-] Permission denied"
			exit
		}

		{
		echo "[+] Setting permissions..."
			sudo chmod +x /usr/bin/gdb-*
		} || {
		echo "[-] Permission denied"
			exit
		}

	fi

}

echo -e "${bold}[+] ${brown} .....: ${cyan}${module}${brown} 🧾 installation module running.${reset}\n"

gdb_plugins

echo -e "\n"
echo -e "${magenta} ✅ Completed${reset}\n"
