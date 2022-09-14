#!/usr/bin/env bash
# Script to setup afew things in a server

# author: iAmG-r00t a.k.a th3_gr00t a.k.a Peter Numi.

# Debug mode
#set -x

# Exit or error
set -e

# colors
bold=$(tput bold)
reset='\033[0m'
#blue='\e[1;34m'
green='\e[1;32m'
brown='\e[0;33m'
magenta="\e[95m"
red="\033[1;31m"
#no_color='\e[0m'
#blink='\e[5m'



# Report errors when file exits out
server_sh="${BASH_SOURCE[0]:?server_script}"
filename=$(basename "${server_sh}")
#[ -z "$BASH_SOURCE[@]" ] || filename=$(basename "${server_sh}")
err_report() {
  echo " "
  echo -e "* ${brown}Error on line ${red}$1${reset} file: ${magenta}${filename}${reset}"
  echo " "
}

trap 'err_report $LINENO' ERR

# to delete
curl -fsSL https://raw.githubusercontent.com/iAmG-r00t/dotfiles/master/server/vim.sh | bash

echo -e "\n"
echo -e "${bold}[+] ${reset}${brown}First doing a simple update and upgrade.\n${reset}"
sudo apt update -qq && sudo apt upgrade -qq -y
echo -e "\n"

echo -e "${bold}[+] ${reset}${brown}Installing some important packages for effeciency and productivity.\n${reset}"

echo -e "    ${bold}[>]${reset} ${green}Installing mosh and fzf.\n${reset}"

# install mosh and fzf
sudo apt install wget mosh fzf -y && echo -e "\n"

echo -e "    ${bold}[>]${reset} ${green}Installing tmux.\n${reset}"

# install tmux from github release files
#---------------------------------------
sudo apt-get remove tmux -y -qq && sudo apt-get install -qq -y libevent-dev ncurses-dev build-essential bison pkg-config && \
curl -s https://api.github.com/repos/tmux/tmux/releases/latest | grep "browser_download_url.*" \
| grep "browser_download_url.*" | grep "tmux-.*.tar.gz" | cut -d : -f 2,3 \
| tr -d '"' | wget -qi - && tar -zxf tmux-*.tar.gz && cd tmux-*/ && ./configure && \
make && sudo make install && cd ../ && rm -r tmux-*
#---------------------------------------

echo -e "\n"

echo -e "    ${bold}[>]${reset} ${green}Installing bat.\n${reset}"

# install bat from github relase files
#-------------------------------------
curl -s https://api.github.com/repos/sharkdp/bat/releases/latest \
| grep "browser_download_url.*" \
| grep "bat_.*._amd64.deb" \
| cut -d : -f 2,3 \
| tr -d '"' \
| wget -qi - && sudo dpkg -i bat_*_amd64.deb && rm bat_*_amd64.deb
#-------------------------------------

echo -e "\n"

# Get configuration files from github
echo -e "${bold}[+]${reset} ${brown}Downloading bashrc file from github.\n${reset}"
wget -q --show-progress https://raw.githubusercontent.com/iAmG-r00t/dotfiles/master/server/bashrc -P ~/
mv ~/.bashrc ~/.bashrc.original
mv ~/bashrc ~/.bashrc
echo -e "\n"

echo -e "${bold}[+]${reset} ${brown}Downloading tmux configuration file from github.\n${reset}"
wget -q --show-progress https://raw.githubusercontent.com/iAmG-r00t/dotfiles/master/server/tmux.conf -P ~/
mv ~/tmux.conf ~/.tmux.conf
echo -e "\n"

# vim setup
curl -fsSL https://raw.githubusercontent.com/iAmG-r00t/dotfiles/master/server/vim.sh | bash

# clean up
echo -e "${bold}[+]${reset} ${brown}Cleaning up server.\n${reset}"
sudo apt autoremove -y && sudo apt remove -y && sudo apt clean
echo -e "\n"
[ -f ~/.viminfo ] && rm ~/.viminfo
[ -f ~/.wget-hsts ] && rm ~/.wget-hsts
