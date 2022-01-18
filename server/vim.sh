#!/bin/bash

# Script to setup vim stuff

# author: iAmG-r00t a.k.a th3_gr00t a.k.a Peter Numi.

# Debug mode
#set -x

# Exit or error
set -e

# colors
bold=$(tput bold)
reset='\033[0m'
blue='\e[1;34m'
#green='\e[1;32m'
brown='\e[0;33m'
magenta="\e[95m"
red="\033[1;31m"
#no_color='\e[0m'
#blink='\e[5m'

# Report errors when file exits out
filename=$(basename "${BASH_SOURCE[@]}")
err_report() {
	  echo -e "\n* ${brown}Error on line ${red}$1${reset} file: ${magenta}${filename}${reset}\n"
}

trap 'err_report $LINENO' ERR

echo -e "${bold}[+] ${reset}${brown}This is a basic vim vanilla setup.\n${reset}"

echo -e "${bold}[>]${reset}	${blue}Creating .vim directory in your home directory.\n${reset}"
mkdir -p ~/.vim/{ftplugin,mysnippets}

echo -e "${bold}[>]${reset}	${blue}Copying important file to the .vim directory in your home directory.\n${reset}"
wget -q --show-progress https://raw.githubusercontent.com/iAmG-r00t/dotfiles/main/server/vim/vimrc -P ~/.vim/
wget -q --show-progress https://raw.githubusercontent.com/iAmG-r00t/dotfiles/main/server/vim/{c,markdown}.vim -P ~/.vim/ftplugin/
wget -q --show-progress https://raw.githubusercontent.com/iAmG-r00t/dotfiles/main/server/vim/c.snippets -P ~/.vim/mysnippets/

echo -e "${bold}[>]${reset}     ${blue}Creating a soft link for vimrc file.\n${reset}".
ln -s ~/.vim/vimrc ~/.vimrc

echo -e "${bold}[>]${reset}     ${blue}Sourcing vimrc file to installing vim plug and vim plugins.\n${reset}"
# shellcheck source=/dev/null
source ~/.vimrc

echo -e "${bold}[+] ${reset}${brown}Basic vanilla vim setup is done.\n${reset}"
