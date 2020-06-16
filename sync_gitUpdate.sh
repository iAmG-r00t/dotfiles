#!/bin/bash
# script to run my sync dotfiles script 
# and update the git repo
# By th3gr00t

bold=`tput bold`
red='\e[0;31m'
reset='\033[0m'
blue='\e[1;34m'
green='\e[1;32m'
brown='\e[0;33m'
no_color='\e[0m'
blink='\e[5m'


# first we run the sync script
$HOME/Gitools/desktop-setup/sync.sh
sleep 1

# delete some backup file for desktop.sh script file
if [[ -f desktop.sh.old.bak ]]
then

    echo -e "${no_color}[+] ${brown} Deleting old file ${red}desktop.sh.old.bak${brown} ......${reset}"
    rm $HOME/Gitools/desktop-setup/desktop.sh.old.bak
fi
sleep 1

# checking git status
echo ""
echo -e "${no_color}[+] ${blue}Checking git status${reset}"
echo ""
git status | sed '/add\|checkout\|added/d'

# Encrypt all git files with git secret
echo ""
git secret hide
echo ""

# Add untracked files and modified files to git
git ls-files -m | xargs git add
git ls-files -o --exclude-standard | xargs git add

# Check git status
git status | sed '/add\|checkout\|added\|HEAD/d'
