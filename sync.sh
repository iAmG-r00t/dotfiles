#!/bin/bash
# Script to back up important files and directories
# by @th3-gr00t

bold=`tput bold`
red='\e[0;31m'
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
	src="${HOME}/${1}"

   if [ ! -f "$dest" ]
   then

	echo -e "${no_color}${bold}[+] ${brown}File ${blue}${dest} ${red}not present ${brown}${blink}backing it up ...${reset}"
   	sleep 1
   	cp ${src} ${dest}

   else

	diff=$(diff -q ${src} ${dest} | cut -d ' ' -f5)

	if [[ -f ${src} ]]
	then
		if [[ "$diff" == "differ" ]]
		then
			cp ${src} ${dest}
			echo -e "${no_color}${bold}[+] ${green}Backed up file: ${brown}${src} ... ${green}to file ${brown}${dest}${reset}"
			echo ""
			sleep 2
		else

		    echo -e "${no_color}${bold}[+] ${red}File at path: ${blue}${dest}${reset} is ${red}already up to date${reset}${blue}, ${blue}no need of backing it up again.${reset}"
		    sleep 1
		fi
    	fi
   fi
}

backup .dotfiles/.bash/.bash_aliases .bash/.bash_aliases
backup .dotfiles/.bash/.bashrc .bash/.bashrc
backup .dotfiles/.bash/.bash_profile .bash/.bash_profile
backup .dotfiles/.bash/.bash_aliases.d/.bash_aliases .bash/.bash_aliases.d/.bash_aliases
backup .dotfiles/.bash/tmux-workspaces/analyze.sh .bash/tmux-workspaces/analyze.sh
backup .dotfiles/.bash/tmux-workspaces/AnythingCanGoHere.sh .bash/tmux-workspaces/AnythingCanGoHere.sh
backup .dotfiles/.bash/tmux-workspaces/AutomationLab.sh .bash/tmux-workspaces/AutomationLab.sh
backup .dotfiles/.bash/tmux-workspaces/scan_servers.sh .bash/tmux-workspaces/scan_servers.sh
backup .dotfiles/.bash/tmux-workspaces/appsec.sh .bash/tmux-workspaces/appsec.sh
backup .dotfiles/.bash/tmux-workspaces/tm.sh .bash/tmux-workspaces/tm.sh
backup .dotfiles/.bash/tmux-workspaces/workspaces.sh .bash/tmux-workspaces/workspaces.sh
backup .dotfiles/.pass/contrasenas.kdbx .pass/contrasenas.kdbx
backup .dotfiles/.tmux/.tmux.conf .tmux/.tmux.conf
backup .dotfiles/.vim/vimrc .vim/vimrc
backup .dotfiles/.vim/.ycm_extra_conf.py .vim/.ycm_extra_conf.py
backup .dotfiles/eddie/greetings.txt .eddie/greetings.txt
backup .dotfiles/.i3/bluetooth.sh .i3/bluetooth.sh
backup .dotfiles/.i3/.config .i3/.config
backup .dotfiles/.i3/every-5-minutes.sh .i3/every-5-minutes.sh
backup .dotfiles/.i3/lowbatt.sh .i3/lowbatt.sh
backup .dotfiles/.i3/suspendbattery.sh .i3/suspendbattery.sh
backup .dotfiles/.i3/.i3-blocks/i3blocks.conf .i3/.i3-blocks/i3blocks.conf
backup .dotfiles/.i3/.i3-blocks/i3blocks2.conf .i3/.i3-blocks/i3blocks2.conf
backup .oh-my-zsh/custom/aliases.zsh .omz/custom/aliases.zsh
backup .oh-my-zsh/custom/cheats.zsh .omz/custom/cheats.zsh
backup .oh-my-zsh/custom/latex.zsh .omz/custom/latex.zsh
backup .oh-my-zsh/custom/servers.zsh .omz/custom/servers.zsh
backup .oh-my-zsh/custom/tmux.zsh .omz/custom/tmux.zsh
backup .oh-my-zsh/custom/vim-plugins.zsh .omz/custom/vim-plugins.zsh
backup .oh-my-zsh/oh-my-zsh.sh .omz/oh-my-zsh.sh
backup .oh-my-zsh/.zshrc .omz/.zshrc

function backup_i3_stuff(){
	function copy(){
			dest="${HOME}/Gitools/desktop-setup/dotfiles/.i3/.i3-blocks/${2}/"
    			src="${HOME}/.dotfiles/.i3/.i3-blocks/${1}/"

   			see=$(comm -23 <(ls ${src} |sort) <(ls ${dest} |sort))

    			if [ -z "$see" ]; then
      			   echo -e "${no_color}${bold}[+] ${green}All good${brown}, folder ${blue}${dest} ${brown}is ${green}up to date${reset}"

    			else

      			   echo -e "${no_color}${bold}[+] ${brown}Updating folder ${blue}${dest} ${brown}....${reset}"
			   copy ${src}/* ${dest}/

    			fi

	}

	copy blocks blocks
	copy scrots scrots
}

function favorite-apps(){

	replace=$(gsettings list-recursively| grep 'favorite-apps' | sed 's/.*\[\([^]]*\)].*/\1/')
	diff=$(diff -q <(gsettings list-recursively| grep 'favorite-apps' | sed 's/.*\[\([^]]*\)].*/\1/') <(cat $HOME/Gitools/desktop-setup/desktop.sh | grep favorite-apps |  sed 's/.*\[\([^]]*\)].*/\1/') | cut -d ' ' -f5)

	if [[ "$diff" == "differ" ]]
	then

	echo ""
	sleep 2

	echo -e "${no_color}${bold}[+] ${brown}Updating Favorite Apps ${no_color} ${blink}${blue}..........${reset}"

	sed -i.old.bak '/favorite-apps/ s/\[.*]/['"$replace]"'/' $HOME/Gitools/desktop-setup/desktop.sh

	else

	echo ""
	sleep 2

	echo -e "${no_color}${bold}[+] ${brown}Favorite Apps already up to date ${no_color} ${blink}${blue}..........${reset}"

	fi

}

favorite-apps
backup_i3_stuff
echo -e "${green}${bold}[+] ${blink}Done${reset}"
