#!/bin/bash

# Essentials Module
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

path="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
# shellcheck disable=SC2128
filename=$(basename "$BASH_SOURCE")
module="${filename%%.*}"

# --Errors-- #

# POE: Points Out Errors
report_error() {
	echo -e "\n* ${brown}Error on line ${red}$1${reset} file: ${magenta}${filename}${reset}\n"
}

trap 'report_error $LINENO' ERR

# --functions-- #
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

function basic() { : Basic tools.
	get curl									# curl install
	get git										# git install
	get wget									# wget install
	get mosh									# the mobile shell
	get jq										# command-line JSON processor
	get tree 									# recursive directory listing
	get fzf										# fuzzy file finder
	get ufw										# uncomplicated firewall
	get xclip									# command line interface to the X11 clipboard
	get speedtest-cli					# speedtest on the terminal
	get asciinema							# record your terminal sessions
	get htop									# interactive system-monitor and process viewer
}

function ngrok() { : Ngrok install.
	bash "$path"/modules/ngrok.sh				  # installs ngrok
}

function bat() {	: A cat clone with wings install.
	bash "$path"/modules/batcat.sh				# installs batcat
}

function dev_tools() { : Tools for bash, python and C programming.
	sudo apt update -qq
	get python3											        # python3 install
	sudo apt install python3-pip						# pip3 install
	sudo pip3 install virtualenv						# virtualenv
	sudo pip install virtualenvwrapper			# virtualenvwrapper
	sudo pip install grip								    # grip markdown Github preview
	get shellcheck										      # shell script analysis script
	get valgrind										        # c memory leak checker
	bash "$path"/modules/betty.sh						# betty; Holberton-style C code checker
}

function vim() { : VIM install.
	get build-essential									# for building vim
	get libpython3-dev									# Python3 Support
	get cmake											      # For Building YCM plugin
	get fonts-powerline									# vim-airline plugin fonts
  get vim                             # install vim works better with my vimrc file out of the box
	#bash "$path"/modules/vim.sh				# install vim doesn't work properly with my vimrc config file out of the box
}

function tmux() { : TMUX install.
	get build-essential							# for building tmux
	get libevent-dev								# for building tmux
	get ncurses-dev									# for building tmux
	get bison										    # for building tmux
	get pkg-config									# for building tmux
	bash "$path"/modules/tmux.sh		# install tmux
}

function go() { : Go install.
	bash "$path"/modules/go.sh						  # installs go
}

function go_tools() { : Go tools install.
	get libpcap-dev									# for naabu go tool
	bash "$path"/modules/go_tools.sh				# installs gotools
}

function wireguard() { Wireguard VPN install.
	get wireguard									          # fast, modern, secure VPN tunnel
}

function mullvad() { : Mullvad VPN install.
	bash "$path"/modules/mullvad.sh					# mullvad VPN
}

function tailscale() { : Tailscale VPN install.
	bash "$path"/modules/tailscale.sh				# install tailscale
}

function docker() { : Docker & Docker Compose install.
	bash "$path"/modules/docker.sh					# installs both docker and dockercompose
}

function r3_tools() { : Installs reversing tools.
	get gdb											                # installs GDB
	get gdbserver									              # installs gdbserver
	bash "$path"/modules/GDBplugins.sh				  # installs gdb plugins
	bash "$path"/modules/udis86.sh					    # installs udis86
	get python3										              # pwntools requirements
	get python3-pip									            # '
	get python3-dev									            # '
	get git											                # '
	get libssl-dev									            # '
	get libffi-dev									            # '
	get build-essential							            # '
	python3 -m pip install --upgrade pip			  # '
	python3 -m pip install --upgrade pwntools		# install pwntools
	get ipython3									              # installs i3

	#-- hyper terminal install --#

	command -v hyper &>/dev/null

	# shellcheck disable=SC2181
	if [ $? -eq 0 ]; then
		curl -LSs -o /tmp/hyper.deb https://releases.hyper.is/download/deb
		sudo dpkg -i /tmp/hyper.deb && rm /tmp/hyper.deb
	fi

	#hyper plugins
	hyper i hyperinator
	hyper i hyperpwn
}

function sublime_text() { : Sublime Text install.
	get apt-transport-https
	bash "$path"/modules/subl.sh					  # sublime text install
}

function keepassxc() {	: KeePassXC Password Manager install.
	bash "$path"/modules/keepassXC.sh				# installs keepassxc
}

function clean_up() { : Cleans up APT and package stuff.
	echo -e "	Doing some clean up.\n"
	sudo apt autoremove -y -qq && sudo apt remove -y -qq && sudo apt clean -qq
	if [[ -f ~/.wget-hsts ]]; then
		rm ~/.wget-hsts
	fi
}

echo -e "${bold}[+] ${brown} Desktop: ${cyan}${module}${brown} 🧾 module is running.${reset}\n"

sudo apt update -qq							        # system update

echo -e "\n${magenta}Available Tool Sections:${reset}\n"

typeset -f | awk '/ \() $/{fn=$1} /^ *:/{ print fn $0 }' | awk '!/report|get/' | column -s ':' -t | sed 's/.$//'


PS3=$'\n'$'\e[95m'"Option: "$'\033[0m'
options=("All" "Specific" "Exit")

echo -e "\n${brown}Would you want to install ${blue}All${brown} the tools or ${blue}Specific${brown} ones?${reset}"
select opt in "${options[@]}"; do
  case $opt in
  "Specific")
    echo ""
	# shellcheck disable=SC2162
    read -p $'\e[0;33m Enter the tool sections you would want to install (\e[1;34m eg: dev_tools essentials ... \e[0;33m) : \033[0m' func
    functions=$(echo "$func" | tr ' ' '\n')
    echo -e "\n${blue}Installing the following [tools/tool]:${reset} $functions\n\n"
    break
    ;;
  "All")
    functions=$(typeset -f | awk '/ \(\) $/ && !/^main / {print $1}' | awk '!/report|get/')
    echo -e"\n${blue}Installing all tools.${reset}\n"
    break
    ;;
  "Exit")
	exit
	;;
  *)
    echo -e "\t\t${red}Kindly choose between option ${blue}1 ${red}and ${blue}2${red}."
  esac
done

exec 3>&1
exec 1> >(paste /dev/null -)

eval "$functions"

exec 1>&3 3>&-
echo -e "${magenta} ✅ Set-up Completed${reset}\n"
