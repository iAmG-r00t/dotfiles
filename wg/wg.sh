#!/bin/bash
# Script to set-up wireguard configs
# by @th3-gr00t

bold=`tput bold`
reset='\033[0m'
blue='\e[1;34m'
green='\e[1;32m'
brown='\e[0;33m'
no_color='\e[0m'
blink='\e[5m'

sleep 2
echo -e "${blue}${bold}People don't know the half of it, but they don't need to know either.${reset}"
sleep 2

sudo cp *.conf /etc/wireguard

echo -e "${green}${bold}Done copying Wireguard configs!!. "

sleep 2

