#!/bin/bash
# Script to setup my dotfiles
# by @th3-gr00t

bold=`tput bold`
reset='\033[0m'
blue='\e[1;34m'
green='\e[1;32m'
brown='\e[0;33m'
no_color='\e[0m'
blink='\e[5m'
red='\033[1;31m'


#======================================================================================#



#First Function
function dotfiles(){

sleep 2
echo -e "${no_color}${bold}[+] ${brown}Well... Let's go then, you great beast${no_color} ${blink}${blue}Setting up dotfiles!!${reset}"
sleep 2
echo ""

echo -e "${no_color}${bold}[+] ${blink}${blue}Creating directories!!${reset}"
sleep 1
echo ""

# making directories
function make(){
	here="${HOME}/${1}"

	sudo mkdir -p ${here}
	echo "${no_color}${bold}[+] ${green}Created directory: ${blue}${here}${reset}"
	echo ""
}

make .local/share/fonts
make .config/fontconfig/conf.d/
make .dotfiles/.bash/.original
make .dotfiles/.bash/.bash_aliases.d
make .dotfiles/.tmux/plugins
make .dotfiles/.vim
make .dotfiles/eddie
make .dotfiles/.pass

echo -e "${no_color}${bold}[+] ${blink}${blue}Original files being backed up!!${reset}"
sleep 2
echo ""

# moving files
# Back old-stuff first
function move(){
	src="${HOME}/${1}"
	dst="${HOME}/${2}"

	if test -f ${src}; then
       sudo mv ${src} ${dst}
       echo "${no_color}${bold}[+] ${green}backed up file: ${brown}${1} to file path: ${blue}${dst}${reset}"
       echo ""
    else
       echo "${red}File at path: ${blue}${src} is not present${reset}"
       echo ""
    fi
}

move .bash_logout .dotfiles/.bash/.original
move .bashrc .dotfiles/.bash/.original
move .profile .dotfiles/.bash/.original/.bash_profile.original
move .zshrc .oh-my-zsh/.zshrc.original
move .oh-my-zsh/oh-my-zsh.sh .oh-my-zsh/oh-my-zsh.original
move .shell.pre-oh-my-zsh .oh-my-zsh


function remove(){
	this="${HOME}/${1}"

	if test -f ${this}; then
       sudo rm ${this}
       echo "${no_color}${bold}[+] ${green}Deleted file: ${blue}${this}${reset}"
       echo ""
    else
       echo "${red}File at path: ${blue}${this} is not present${reset}"
       echo ""
    fi
}

remove .wget-hsts
remove .viminfo
remove .oh-my-zsh/custom/example.zsh

echo -e "${no_color}${bold}[+] ${blink}${blue}Copying dotfiles to their respective locations!!${reset}"
sleep 2
echo ""

# Copying my dotfiles
function copy(){
	dest="${HOME}/${1}"

	cp -r ${1} ${dest}
	echo "${no_color}${bold}[+] ${green}Copied file: ${brown}${1} at location ${blue}${dest}${reset}"
	echo ""
}

copy dotfiles/.bash/.bash_aliases .dotfiles/.bash
copy dotfiles/.bash/.bash_profile .dotfiles/.bash
copy dotfiles/.bash/.bashrc .dotfiles/.bash
copy dotfiles/.bash/.bash_aliases.d/.bash_aliases .dotfiles/.bash/.bash_aliases.d
copy dotfiles/.tmux/.tmux.conf .dotfiles/.tmux/.tmux.conf
copy dotfiles/.omz/oh-my-zsh.sh .oh-my-zsh
copy dotfiles/.omz/.zshrc .oh-my-zsh
copy dotfiles/.omz/custom/aliases.zsh .oh-my-zsh/custom
copy dotfiles/.omz/custom/cheats.zsh .oh-my-zsh/custom
copy dotfiles/.omz/custom/servers.zsh .oh-my-zsh/custom
copy dotfiles/.omz/custom/tmux.zsh .oh-my-zsh/custom
copy dotfiles/.omz/custom/latex.zsh .oh-my-zsh/custom
copy dotfiles/.omz/custom/vim-plugins.zsh .oh-my-zsh/custom
copy dotfiles/.vim/vimrc .dotfiles/.vim
copy dotfiles/.pass/contraseñas.kdbx .dotfiles/.pass/contraseñas.kdbx

echo -e "${no_color}${bold}[+] ${green}Done setting up dotfiles${reset}"
echo ""

# Edit zshrc local config file and make it to stop calling compinit
echo "${no_color}${bold}[+] ${blue}Editing ${brown}some${reset} ${blue}files ..."
sleep 1
sudo sed -i.bak -e '107 s/^#//' /etc/zsh/zshrc
sudo sed -i.bak /TEMPLATES/s/^/#/ /etc/xdg/user-dirs.defaults
sudo sed -i.bak /PUBLICSHARE/s/^/#/ /etc/xdg/user-dirs.defaults
sudo sed -i.bak /DOCUMENTS/s/^/#/ /etc/xdg/user-dirs.defaults
sudo sed -i.bak /MUSIC/s/^/#/ /etc/xdg/user-dirs.defaults
sudo sed -i.bak /VIDEOS/s/^/#/ /etc/xdg/user-dirs.defaults
sudo sed -i.bak /TEMPLATES/s/^/#/ ~/.config/user-dirs.dirs
sudo sed -i.bak /PUBLICSHARE/s/^/#/ ~/.config/user-dirs.dirs
sudo sed -i.bak /DOCUMENTS/s/^/#/ ~/.config/user-dirs.dirs
sudo sed -i.bak /MUSIC/s/^/#/ ~/.config/user-dirs.dirs
sudo sed -i.bak /VIDEOS/s/^/#/ ~/.config/user-dirs.dirs
sleep 5
echo "${no_color}${bold}[+] ${blue}Opening file manager Nautilus, kindly proceed and remove the bookmarks by right click then click remove ... and some new bookmarks{reset}"
nohup nautilus &
sleep 2
echo -e "${no_color}${bold}[+] ${green}Done${reset}"
}



#======================================================================================#



#Second Function
function vim-stuff(){

echo ""
echo -e "${no_color}${bold}[+] ${blink}${blue}Gathering VIM requirements!!${reset}"
sleep 2
echo ""

# vim set-up
#Install powerline status fonts and pip-package
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
echo ""

echo -e "${no_color}${bold}[+] ${blink}${blue}Installing powerline status!!${reset}"
sleep 1
echo ""
pip3 install powerline-status
echo -e "${no_color}${bold}[+] ${green}Done setting up VIM requirements${reset}"
}



#======================================================================================#



#Third Function
function Other(){
echo -e "${no_color}${bold}[+] ${blink}${blue}Setting up other stuff!!${reset}"
sleep 2
echo ""

#Setup eddie
git clone https://github.com/victoriadrake/eddie-terminal.git ~/.dotfiles/eddie
cp -r .eddie/greetings.txt ~/.dotfiles/eddie/greetings.txt
#Set up tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.dotfiles/.tmux/plugins/tpm
#Set up zsh plugins for Oh-My-ZSH
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo ""



echo -e "${no_color}${bold}[+] ${blink}${blue}Creating links!!${reset}"
sleep 2

#Stolen from tomnomnom
function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink 
    echo "${no_color}${bold}[+] ${blue}Removing existing symlink: ${brown}${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "${no_color}${bold}[+] ${blue}Backing up existing file: ${brown}${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "${no_color}${bold}[+] ${blue}Backing up existing dir: ${brown}${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "${no_color}${bold}[+] ${blue}Creating new symlink: ${brown}${dest}"
  ln -sf ${dest} ${dest}
}

linkDotfile .dotfiles/.bash/.bashrc
linkDotfile .dotfiles/.bash/.bash_profile
linkDotfile .dotfiles/.tmux/.tmux.conf
linkDotfile .dotfiles/.vim/vimrc
linkDotfile .oh-my-zsh/.zshrc

echo ""
sleep 1
echo -e "${no_color}${bold}[+] ${green}Done creating links!!${reset}"
}

#======================================================================================#

#Bring all of them together
dotfiles
vim-stuff
Other
echo ""
echo -e "${blue}${bold}We are almost done!!"
sleep 2