#!/bin/bash
# Script to install my most fundamental softwares
# by @th3-gr00t

bold=`tput bold`
reset='\033[0m'
blue='\e[1;34m'
green='\e[1;32m'
brown='\e[0;33m'
no_color='\e[0m'
blink='\e[5m'

#Installing required dependancies
function softwares(){
   echo -e "${no_color}${bold}[+] ${brown}Dah! Get through this you biteers!${no_color} ${blink}${blue}Installing Important packages!!${reset}"
   sleep 2

   function install(){

    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
      echo -e "${no_color}${bold}[+] ${blink}${blue}Installing: ${1}...."

          sudo apt install -y $1
    else
    
      echo -e "${green}Already installed: ${1}"

    fi
   }

   sudo apt update

	 install zsh
	 install curl
	 install git
	 install apt-transport-https
   install software-properties-common
	 install ca-certificates
   install gnupg-agent
	 install wget
   install vim-nox
   install tmux
	 install mosh
   install cherrytree
   install python3-pip
   install python-pip
   install figlet
   install lolcat
   install xclip
   install texlive-full
   install evince
   install cmake
   install build-essential
   install python3-dev
   install mono-complete
   install dirmngr 
   install gpg-agent
   install gnupg
   install ufw

  echo -e "${green}Done Installing all required packages!!"
sleep 2
}

#Installing wireguard
function wireguard(){
   echo -e "${no_color}${bold}[+] ${blink}${blue}Installing wireguard!!${reset}"
   sleep 2

   sudo add-apt-repository ppa:wireguard/wireguard ;\
   sudo apt update ;\
   sudo apt install -y \
        wireguard \
        resolvconf

   sudo cp wg/*.conf /etc/wireguard/
echo -e "${green}Done installing Wireguard!!"
sleep 2
}

#Installing sublime-text
function sublime(){
   echo -e "${no_color}${bold}[+] ${blink}${blue}Installing sublime-text!!${reset}"
   sleep 2

   wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
   echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
   sudo apt update ;\
   sudo apt install -y \
        sublime-text
echo -e "${green}Done installing sublime-text!!"
sleep 2
}

#Installing docker and docker-compose
function docker(){
   echo -e "${no_color}${bold}[+] ${blink}${blue}Installing docker!!${reset}"
   sleep 2
   
   sudo apt remove docker docker-engine docker.io containerd runc
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"
   sudo apt update ;\
   sudo apt install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io

   sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   sudo chmod +x /usr/local/bin/docker-compose
   sudo ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose

echo -e "${green}Done installing docker and docker-compose!!"
sleep 2
}

#Installing mullvad VPN
function mullvad-vpn(){
  echo -e "${no_color}${bold}[+] ${blink}${blue}Installing Mullvad VPN!!${reset}"
  sleep 2

  echo -e "${brown}Please check Mullvad version from Download page and enter it here, example: 2020.3 and press [ENTER]"

  read VERSION

  wget https://mullvad.net/media/app/MullvadVPN-$VERSION_amd64.deb
  sudo dpkg -i MullvadVPN-$VERSION_amd64.deb
  rm MullvadVPN-$VERSION_amd64.deb
echo -e "${green}Done installing Mullvad VPN!!"
sleep 2
}

#Installing Oh-My-ZSH
function OMZ(){
   echo -e "${no_color}${bold}[+] ${blink}${blue}Installing Oh-My-ZSH!!${reset}"
   sleep 2

   #Installing Oh-My-ZSH in the background
   0>/dev/null sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
echo -e "${green}Done installing Oh-My-ZSH shell!!"
sleep 2
}

#Installing signal
function signal(){
   echo -e "${no_color}${bold}[+] ${blink}${blue}Installing signal!!${reset}"
   sleep 2

   curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
   echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
   sudo apt update ;\
   sudo apt install -y \
        signal-desktop
echo -e "${green}Done installing signal-desktop!!"
sleep 2
}

#Installing keepass and plugins
function keepass2-plugins(){
   echo -e "${no_color}${bold}[+] ${blink}${blue}Installing Keepass2 and Plugins!!${reset}"
   sleep 2

   sudo add-apt-repository ppa:dlech/keepass2-plugins ;\
   sudo add-apt-repository ppa:dlech/keepass2-plugins-beta ;\
   sudo add-apt-repository ppa:jtaylor/keepass ;\
   sudo apt update ;\
   sudo apt install -y \
        keepass2-plugin-keeagent \
        keepass2
   wget https://bitbucket.org/devinmartin/keecloud/downloads/KeeCloud.1.2.1.11.plgx
   sudo mv KeeCloud.1.2.1.11.plgx /usr/lib/keepass2/Plugins/
   sudo chown root:root /usr/lib/keepass2/Plugins/KeeCloud.1.2.1.11.plgx

echo -e "${green}Done installing Keepass2 and its Plugins!!"
sleep 2
}

#Instaling brave browser
function brave(){
  echo -e "${no_color}${bold}[+] ${blink}${blue}Installing Brave browser!!${reset}"
   sleep 2

   curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
   echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
   sudo apt update ;\
   sudo apt install -y \
        brave-browser

echo -e "${green}Done installing Brave browser!!"
sleep 2
}

#Instaling Go
function Go(){
  echo -e "${no_color}${bold}[+] ${blink}${blue}Setting up Go!!${reset}"
   sleep 2

   # Dirty dirty dirty
   # Stolen from tomnomnom too

  echo -e "${brown}What version of Go do you want to install, example: 1.13.5 and press [ENTER]"

  read VERSION

  wget https://storage.googleapis.com/golang/go$VERSION.linux-amd64.tar.gz
  tar xvfz go$VERSION.linux-amd64.tar.gz

  #If statement to check if directory is present, and if it's present to delete it
  if [ -d "/usr/local/go" ]
  then
    sudo rm -rf /usr/local/go
    sudo mv go /usr/local/
  else
  sudo mv go /usr/local/
  fi

  go get golang.org/x/tools/cmd/goimports
  go get github.com/nsf/gocode

  rm go$VERSION.linux-amd64.tar.gz

echo -e "${green}Done setting up Go !!"
sleep 2
}


#Installing Git Secret
function git-secret(){

echo -e "${no_color}${bold}[+] ${blink}${blue}Installing Git Secret!!${reset}"
   sleep 2

   echo "deb https://dl.bintray.com/sobolevn/deb git-secret main" | sudo tee -a /etc/apt/sources.list
   wget -qO - https://api.bintray.com/users/sobolevn/keys/gpg/public.key | sudo apt-key add -
   sudo apt update ;\
   sudo apt install -y \
        git-secret

echo -e "${green}Done Installing Git Secret !!"
sleep 2
}

#Install weechat
function weechat(){
  version=(lsb_release -r)

echo -e "${no_color}${bold}[+] ${blink}${blue}Installing Weechat!!${reset}"
   sleep 2

   sudo apt-key adv --keyserver hkps://keys.openpgp.org --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E

   if [[ $(lsb_release -rs) == "18.04" ]]; then
    echo "deb https://weechat.org/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/weechat.list
    echo "deb-src https://weechat.org/ubuntu bionic main" | sudo tee -a /etc/apt/sources.list.d/weechat.list

  elif [[ $(lsb_release -rs) == "19.10" ]]; then
    echo "deb https://weechat.org/ubuntu eoan main" | sudo tee /etc/apt/sources.list.d/weechat.list
    echo "deb-src https://weechat.org/ubuntu eoan main" | sudo tee -a /etc/apt/sources.list.d/weechat.list

  else
    echo "deb https://weechat.org/ubuntu $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/weechat.list
    echo "deb-src https://weechat.org/ubuntu $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/weechat.list

  fi

  sudo apt update ;\
  sudo apt install -y \
        weechat-curses \
        weechat-plugins \
        weechat-python \
        weechat-perl

echo -e "${green}Done Installing Weechat!!"
sleep 2
}

#Update... upgrade.. and clean!!
function clean(){
   echo -e "${no_color}${bold}[+] ${blink}${blue}Updating and cleaning leftovers!!${reset}"
   sleep 2

   sudo apt update
   sudo apt upgrade -y ;\
   sudo apt autoremove -y

echo -e "${green}Done cleaning up!!"
sleep 2

}


#Bringing all of them together!!
echo -e "${brown}${bold}Lighten up! No matter what happens, remember, there'll always be mead"
sleep 2

softwares
wireguard
sublime
docker
mullvad-vpn
OMZ
signal
keepass2-plugins
Go
git-secret
weechat
clean

echo -e "${blue}${bold}Right here, I got you where I want"
sleep 2