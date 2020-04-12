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
      echo -e "${no_color}${bold}[+] ${blink}${blue}Installing: ${1}....${reset}"

          sudo apt install -y $1
    else
    
      echo -e "${green}Already installed: ${1}${reset}"

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
   install htop
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
   install fish
   install gnome-screensaver
   install moreutils
   install i3
   install i3blocks
   install feh
   install arandr
   install rofi
   install i3lock-fancy
   install xss-lock
   install xautolock
   install pavucontrol
   install lxappearance
   install xbacklight
   install fonts-font-awesome
   install microcode.ctl
   install intel-microcode

  echo -e "${green}Done Installing all required packages!!${reset}"
sleep 2
}

#Installing snap packages
function snap-packages(){
  echo -e "${no_color}${bold}[+] ${blink}${blue}Installing Snap Packages!!${reset}"

  function install(){

    package=$(find /snap/bin/ -name $1)  

    if [ -z "$package" ]; then

      echo -e " "
      echo -e "${no_color}${bold}[+] ${blink}${blue}Installing: ${1}....${reset}"

      sudo snap install $1

      echo -e "${green}Done installing ${1}!!${reset}"
      echo -e " "

    else

      echo -e "${green}Already installed: ${1}${reset}"

    fi
    }

    install wireguard-ammp
    install docker
    install walc
    install libreoffice
    install sublime-text
    install signal-desktop
    install discord
    install cherrytree
    install zoom-client
    install obs-studio
    install code-insiders
    install asciinema
    install telegram-desktop
    install mpv
}




function docker-compose(){
   echo -e "${no_color}${bold}[+] ${blink}${blue}Installing docker-compose!!${reset}"
   sleep 2

   function install(){
   
   file=$(find /usr/local/bin/ -name $1)  

   if [ -z "$file" ]; then
      echo -e "${no_color}${bold}[+] ${blink}${blue}Installing: ${1}....${reset}"

      sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      sudo chmod +x /usr/local/bin/docker-compose
      sudo ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose

   else
    
      echo -e "${green}Already installed: ${1}${reset}"

   fi
   }
       install docker-compose

echo -e "${green}Done installing ${1}!!${reset}"
sleep 2
}

#Installing mullvad VPN
function mullvad-vpn(){
  echo -e "${no_color}${bold}[+] ${blink}${blue}Installing Mullvad VPN!!${reset}"
  sleep 2

  function install(){

    which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    
    echo -e "${no_color}${bold}[+] ${blink}${blue}Installing: ${1}....${reset}"

    echo -e "${brown}Please check Mullvad version from Download page and enter it here, example: 2020.3 and press [ENTER]${reset}"

    read VERSION

    wget https://mullvad.net/media/app/MullvadVPN-${VERSION}_amd64.deb
    sudo dpkg -i MullvadVPN-${VERSION}_amd64.deb
    rm MullvadVPN-${VERSION}_amd64.deb
    echo -e "${green}Done installing Mullvad VPN!!${reset}"

  else

    echo -e "${green}Already installed: ${1}${reset}"

  fi
  }

    install mullvad

sleep 2
}

#Installing Oh-My-ZSH
function OMZ(){
   echo -e "${no_color}${bold}[+] ${blink}${blue}Installing Oh-My-ZSH!!${reset}"
   sleep 2

   function install(){

    dir="/home/${USER}/.oh-my-zsh"

 if [[  ! -d $dir ]]; then

    echo -e "${no_color}${bold}[+] ${blink}${blue}Installing: ${1}....${reset}"
    echo "  "
   
    #Installing Oh-My-ZSH in the background
    0>/dev/null sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    echo -e "${green}Done installing Oh-My-ZSH shell!!${reset}"

 else

   echo -e "${green}Already installed: ${1}${reset}"

 fi  
  }

    install oh-my-zsh

sleep 2
}

#Installing keepass and plugins
function keepass2-plugins(){
   echo -e "${no_color}${bold}[+] ${blink}${blue}Installing Keepass2 and Plugins!!${reset}"
   sleep 2

   function install(){
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
      echo -e "${no_color}${bold}[+] ${blink}${blue}Installing: ${1}....${reset}"

   sudo add-apt-repository ppa:dlech/keepass2-plugins ;\
   sudo add-apt-repository ppa:dlech/keepass2-plugins-beta ;\
   sudo add-apt-repository ppa:jtaylor/keepass ;\
   sudo apt update ;\
   sudo apt install -y $1
        
	#keepass2-plugin-keeagent (facing error's pulling it from github repo)
   wget https://bitbucket.org/devinmartin/keecloud/downloads/KeeCloud.1.2.1.11.plgx
   wget https://github.com/dlech/KeeAgent/releases/download/v0.11.2/KeeAgent.plgx
   sudo mv KeeAgent.plgx /usr/lib/keepass2/Plugins/
   sudo mv KeeCloud.1.2.1.11.plgx /usr/lib/keepass2/Plugins/
   sudo chown root:root /usr/lib/keepass2/Plugins/KeeCloud.1.2.1.11.plgx

   else
    
      echo -e "${green}Already installed: ${1}${reset}"

    fi
   }
       install keepass2

echo -e "${green}Done installing Keepass2 and its Plugins!!${reset}"
sleep 2
}

#Instaling brave browser
function brave(){
  echo -e "${no_color}${bold}[+] ${blink}${blue}Installing Brave browser!!${reset}"
   sleep 2

   function install(){
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
      echo -e "${no_color}${bold}[+] ${blink}${blue}Installing: ${1}....${reset}"

      curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
      echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
      sudo apt update ;\
      sudo apt install -y $1

   else
    
      echo -e "${green}Already installed: ${1}${reset}"

    fi
   }
       install brave-browser

echo -e "${green}Done installing Brave browser!!${reset}"
sleep 2
}

#Instaling Go
function Go(){
  echo -e "${no_color}${bold}[+] ${blink}${blue}Setting up Go!!${reset}"
   sleep 2

   function install(){
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
      echo -e "${no_color}${bold}[+] ${blink}${blue}Installing: ${1}....${reset}"

       # Dirty dirty dirty
       # Stolen from tomnomnom too

      echo -e "${brown}What version of Go do you want to install, example: 1.13.5 and press [ENTER]${reset}"

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

        echo -e "${green}Done setting up Go !!${reset}"

    else

      echo -e "${green}Already installed: ${1}${reset}"

    fi
   }
       install go

sleep 2
}


#Installing Git Secret
function git-secret(){

echo -e "${no_color}${bold}[+] ${blink}${blue}Installing Git Secret!!${reset}"
   sleep 2

   function install(){
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
      echo -e "${no_color}${bold}[+] ${blink}${blue}Installing: ${1}....${reset}"

   echo "deb https://dl.bintray.com/sobolevn/deb git-secret main" | sudo tee -a /etc/apt/sources.list
   wget -qO - https://api.bintray.com/users/sobolevn/keys/gpg/public.key | sudo apt-key add -
   sudo apt update ;\
   sudo apt install -y $1

   else
    
      echo -e "${green}Already installed: ${1}${reset}"

    fi
   }
       install git-secret

echo -e "${green}Done Installing Git Secret !!${reset}"
sleep 2
}

#Install weechat
function weechat(){
  version=(lsb_release -r)

echo -e "${no_color}${bold}[+] ${blink}${blue}Installing Weechat!!${reset}"
   sleep 2

   function install(){
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
      echo -e "${no_color}${bold}[+] ${blink}${blue}Installing: ${1}....${reset}"

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
  sudo apt install -y $1

  else
    
      echo -e "${green}Already installed: ${1}${reset}"

    fi
   }
       install weechat

echo -e "${green}Done Installing Weechat!!${reset}"
sleep 2
}

#Install pspg from PostgreSQL repo for csv viewer and mysql stuff
function pspg(){

  echo -e "${no_color}${bold}[+] ${blink}${blue}Installing pspg (csv and DB viewer)!!${reset}"

  function install(){
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
      echo -e "${no_color}${bold}[+] ${blink}${blue}Installing: ${1}....${reset}"

  curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
  sudo sh -c 'echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
  sudo apt update ;\
  sudo apt install -y $1

  else
    
      echo -e "${green}Already installed: ${1}${reset}"

    fi
   }
       install pspg

echo -e "${green}Done Installing pspg!!${reset}"
sleep 2
}

function i3-gaps(){

  #----------------------
  #i3-gaps installation:
  #----------------------
  #Repository for i3-gaps, polybar and other stuff
  #Source: https://launchpad.net/~kgilmer/+archive/ubuntu/speed-ricer
  #sudo add-apt-repository ppa:kgilmer/speed-ricer

echo -e "${no_color}${bold}[+] ${blink}${blue}Installing i3-gaps !!${reset}"

  sudo apt update
  sudo apt install -y libxcb1-dev \
                      libxcb-keysyms1-dev \
                      libpango1.0-dev \
                      libxcb-util0-dev \
                      libxcb-icccm4-dev \
                      libyajl-dev \
                      libstartup-notification0-dev \
                      libxcb-randr0-dev \
                      libev-dev \
                      libxcb-cursor-dev \
                      libxcb-xinerama0-dev \
                      libxcb-xkb-dev \
                      libxkbcommon-dev \
                      libxkbcommon-x11-dev \
                      autoconf \
                      xutils-dev \
                      libtool \
                      automake \
                      libxcb-xrm-dev
  
  mkdir tmp; cd tmp
  git clone https://www.github.com/Airblader/i3 i3-gaps; cd i3-gaps
  git checkout gaps && git pull
  autoreconf --force --install
  rm -rf build; mkdir build; cd build; ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
  make; sudo make install
  cd ../../../; rm -rf tmp

echo -e "${green}Done Installing i3-gaps!!${reset}"
sleep 2
}


#Update... upgrade.. and clean!!
function clean(){
   echo -e "${no_color}${bold}[+] ${blink}${blue}Updating and cleaning leftovers!!${reset}"
   sleep 2

   sudo apt update
   sudo apt upgrade -y ;\
   sudo apt autoremove -y

echo -e "${green}Done cleaning up!!${reset}"
sleep 2

}


#Bringing all of them together!!
echo -e "${brown}${bold}Lighten up! No matter what happens, remember, there'll always be mead${reset}"
sleep 2

softwares
snap-packages
docker-compose
mullvad-vpn
OMZ
keepass2-plugins
brave
Go
git-secret
weechat
pspg
i3-gaps
clean

echo -e "${blue}${bold}Right here, I got you where I want${reset}"
sleep 2