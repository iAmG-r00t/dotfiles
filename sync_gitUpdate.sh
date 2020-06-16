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


# First we run the sync script
$HOME/Gitools/desktop-setup/sync.sh
sleep 1

# Delete some backup file for desktop.sh script file
if [[ -f desktop.sh.old.bak ]]
then

    echo -e "${no_color}[+] ${brown} Deleting old file ${red}desktop.sh.old.bak${brown} ......${reset}"
    rm $HOME/Gitools/desktop-setup/desktop.sh.old.bak
fi
sleep 1

# My if function
command1=$(git status | grep "Changes to be committed:")
command2=$(git status | grep "nothing to commit, working tree clean")

if [[ "$command1" != "Changes to be committed:" ]]
then

   # Checking git status
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
   git git status | sed '/add\|checkout\|added\|HEAD/d'

   # Git commit message
   echo -e "${no_color}${bold}[+] ${brown}Adding git commit message ...${reset}"
   git commit -m "¯\\_(ツ)_//¯ We call it updates ... :adhesive_bandage:"

   # Git commit
   echo -e "${no_color}${bold}[+] ${brown}Pushing to git master repo ...${reset}"
   git push -u origin master

elif [[ "$command2" == "Your branch is up to date with 'origin/master'." ]]
then
   echo -e "${no_color}${bold}[+] ${brown}Your branch is up to date with ${red}'origin/master'${brown}.${reset}"

else

  # Check git status
  git status | sed '/add\|checkout\|added\|HEAD/d'

  # Git commit message
  echo -e "${no_color}${bold}[+] ${brown}Adding git commit message ...${reset}"
  sleep 1
  git commit -m "¯\\_(ツ)_//¯ We call it updates ... :adhesive_bandage:"

  # Git commit
  echo -e "${no_color}${bold}[+] ${brown}Pushing to git master repo ...${reset}"
  git push -u origin master

fi
