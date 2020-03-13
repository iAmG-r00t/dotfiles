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
	dest="${HOME}/Gitools/desktop-setup/${2}"
	src="${HOME}/.dotfiles/${1}"

	if test -f ${src}; then
	cp ${src} ${dest}
	echo -e "${no_color}${bold}[+] ${green}Backed up file: ${brown}${1} ... ${green}to location ${brown}${dest}${reset}"
	echo ""
	sleep 2
    else
    echo -e "${red}File at path: ${blue}${src} is not present ...${brown} can't back it up!!${reset}"
    echo ""
    sleep 1
    fi
}

backup .bash/.bash_aliases dotfiles/.bash
backup .bash/.bashrc dotfiles/.bash
backup .bash/.bash_profile dotfiles/.bash
backup .bash/.bash_aliases.d/.bash_aliases dotfiles/.bash/.bash_aliases.d
backup .pass/contrasenas.kdbx dotfiles/.pass
backup .tmux/.tmux.conf dotfiles/.tmux
backup .vim/vimrc dotfiles/.vim
backup .vim/.ycm_extra_conf.py dotfiles/.vim
backup eddie/greetings.txt dotfiles/.eddie

#Not necessary
#cp ~/.ngrok/ngrok.yml ~/Gitools/desktop-setup/dotfiles/.ngrok
cp ~/.oh-my-zsh/.zshrc ~/Gitools/desktop-setup/dotfiles/.omz
cp ~/.oh-my-zsh/custom/*.zsh ~/Gitools/desktop-setup/dotfiles/.omz/custom
