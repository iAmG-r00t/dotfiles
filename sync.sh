#!/bin/bash
# Script to back up important files and directories
# by @th3-gr00t

bold=`tput bold`
reset='\033[0m'
blue='\e[1;34m'
green='\e[1;32m'
brown='\e[0;33m'
no_color='\e[0m'
blink='\e[5m'

sleep 2
echo -e "${no_color}${bold}[+] ${brown}Our greatest glory is not in never falling, but in rising every time we fall ...${no_color} ${blink}${blue}Backing up!!${reset}"
echo ""
sleep 3

function backup(){
	dest="${HOME}/Gitools/desktop-setup/dotfiles/${2}"
	src="${HOME}/.dotfiles/${1}"

	if test -f ${src}; then
	cp ${src} ${dest}
	echo -e "${no_color}${bold}[+] ${green}Backed up file: ${brown}${src} ... ${green}to file ${brown}${dest}${reset}"
	echo ""
	sleep 2
    else
    echo -e "${red}File at path: ${blue}${src} is not present ...${brown} can't back it up!!${reset}"
    echo ""
    sleep 1
    fi
}

#First Update i3config to the i3 dotfiles folder
cp ${HOME}/.config/i3/config ${HOME}/.dotfiles/.i3/.config

backup .bash/.bash_aliases .bash/.bash_aliases
backup .bash/.bashrc .bash/.bashrc
backup .bash/.bash_profile .bash/.bash_profile
backup .bash/.bash_aliases.d/.bash_aliases .bash/.bash_aliases.d/.bash_aliases
backup .pass/contrasenas.kdbx .pass/contrasenas.kdbx
backup .tmux/.tmux.conf .tmux/.tmux.conf
backup .vim/vimrc .vim/vimrc
backup .vim/.ycm_extra_conf.py .vim/.ycm_extra_conf.py
backup eddie/greetings.txt .eddie/greetings.txt
backup .i3/bluetooth.sh .i3/bluetooth.sh
backup .i3/.config .i3/.config
backup .i3/every-5-minutes.sh .i3/every-5-minutes.sh
backup .i3/lowbatt.sh .i3/lowbatt.sh
backup .i3/suspendbattery.sh .i3/suspendbattery.sh
backup .i3/.i3-blocks/i3blocks.conf .i3/.i3-blocks/i3blocks.conf
backup .i3/.i3-blocks/i3blocks2.conf .i3/.i3-blocks/i3blocks2.conf


function favorite-apps(){
echo -e "${no_color}${bold}[+] ${brown}Updating Favorite Apps ${no_color} ${blink}${blue}..........${reset}"
echo ""
sleep 2 
	replace=$(gsettings list-recursively| grep 'favorite-apps' | sed 's/.*\[\([^]]*\)].*/\1/')

sed -i.old.bak '/favorite-apps/ s/\[.*]/['"$replace]"'/' /home/w0lf/Gitools/desktop-setup/desktop.sh

}


#Not necessary
#cp ~/.ngrok/ngrok.yml ~/Gitools/desktop-setup/dotfiles/.ngrok
cp ~/.oh-my-zsh/.zshrc ~/Gitools/desktop-setup/dotfiles/.omz
cp ~/.oh-my-zsh/custom/*.zsh ~/Gitools/desktop-setup/dotfiles/.omz/custom
#Syncing i3 stuff in the background
cp -r ~/.dotfiles/.i3/.i3-blocks/blocks/* ~/Gitools/desktop-setup/dotfiles/.i3/.i3-blocks/blocks
cp -r ~/.dotfiles/.i3/.i3-blocks/scrots/* ~/Gitools/desktop-setup/dotfiles/.i3/.i3-blocks/scrots
favorite-apps
echo -e "${green}${bold}[+] ${blink}Done${no_color}"