#!/bin/bash
# Script to set up the look and feel of my desktop
# by @th3-gr00t

bold=`tput bold`
reset='\033[0m'
blue='\e[1;34m'
green='\e[1;32m'
brown='\e[0;33m'
no_color='\e[0m'
blink='\e[5m'


sleep 2
echo -e "${no_color}${bold}[+] ${brown}To me, beauty and makeup and color is like the finishing touch on everything${no_color} ${blink}${blue}Final touches!!${reset}"
sleep 3

function remove(){
	this="${HOME}/${1}"

	if test -d ${this}; then
       sudo rm -rf ${this}
       echo -e "${no_color}${bold}[+] ${green}Deleted directory: ${blue}${this}${reset}"
       echo ""
    else
       echo -e "${red}Directory at path: ${blue}${this} is not present${reset}"
       echo ""
    fi
}

#Cleaning up
remove Documents
remove Music
remove Public
remove Templates
remove Videos

function make(){
	here="${HOME}/${1}"

	mkdir -p ${here}
	echo -e "${no_color}${bold}[+] ${green}Created directory: ${blue}${here}${reset}"
	echo ""
}

#Creating some required directories
make Pictures/Wallpapers
make Pictures/Icons
make Drudgery
make Gitools
make Gotools
make Scripts

function copy(){
	dest="${HOME}/${2}"

	cp ${1} ${dest}
	echo -e "${no_color}${bold}[+] ${green}Copied file: ${brown}${1} at location ${blue}${dest}${reset}"
	echo ""
}

#Copy some some images for lock-screen and display-screen
copy img/desktop.jpg Pictures/Wallpapers/desktop.jpg
copy img/lock.jpg Pictures/Wallpapers/lock.jpg

#Copy one user icon image and set language ...
sudo cp img/grey-icon.png /var/lib/AccountsService/icons/$USER
sudo update-locale LC_ALL=en_US.UTF-8

#Beautifications
gsettings set org.gnome.nautilus.desktop trash-icon-name 'Vermins'
gsettings set org.gnome.nautilus.desktop home-icon-visible true
gsettings set org.gnome.nautilus.desktop home-icon-name '127.0.0.1'
gsettings set org.gnome.desktop.background picture-uri 'file:///home/'$USER'/Pictures/Wallpapers/desktop.jpg'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///home/'$USER'/Pictures/Wallpapers/lock.jpg'
gsettings set org.gnome.desktop.screensaver user-switch-enabled false
gsettings set org.gnome.shell favorite-apps "['kazam.desktop', 'org.gnome.Screenshot.desktop', 'gnome-control-center.desktop', 'org.gnome.Nautilus.desktop', 'tagspaces.desktop', 'org.gnome.Terminal.desktop', 'code_code.desktop', 'sublime-text_subl.desktop', 'cherrytree_cherrytree.desktop', 'firefox.desktop', 'brave-browser.desktop', 'mullvad-vpn.desktop', 'keepass2.desktop', 'libreoffice_libreoffice.desktop', 'walc_walc.desktop', 'telegram-desktop_telegram-desktop.desktop', 'signal-desktop_signal-desktop.desktop', 'discord_discord.desktop', 'Zoom.desktop']"
gsettings set org.gnome.settings-daemon.peripherals.keyboard bell-mode 'off'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 20
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true

echo -e "${no_color}${bold}[+] ${blink}${blue}Setting up icon ...${reset}"
sudo sed -i "/^SystemAccount=.*/i Icon=/var/lib/AccountsService/icons/$USER" /var/lib/AccountsService/users/$USER
echo -e "${green}Done setting up desktop enviroment feel!!${reset}"
sleep 2