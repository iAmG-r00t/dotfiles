# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="avit"
#ZSH_THEME="minimal"
ZSH_THEME="mrtazz"

# save and reload history after each command
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# for setting history length see HISTSIZE and SAVEHIST in bash(1)
HISTSIZE=50000
SAVEHIST=10000
HISTFILE=$ZSH/.zsh_history
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_expire_dups_first

# To enable command auto-correction.
ENABLE_CORRECTION="true"

# To display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# User configuration
#Ignores saving bash duplicate commands and the ones that start with spaces
HISTCONTROL=ignoreboth:erasedups

# Plugins
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
colored-man-pages
extract
copydir
copyfile
zsh-autosuggestions
zsh-syntax-highlighting
z
)

#ZSH directory
source $ZSH/oh-my-zsh.sh

# Use vi as the default editor
export EDITOR=vi

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# I'd quite like for Go to work please.
#If you face any go errors like 'import path does not begin with hostname'
# unset GOROOT
#export GOROOT=/usr/local/go/bin
#export PATH=${PATH}:${GOROOT}/bin:${GOPATH}/bin
export PATH=${PATH}:/usr/local/go/bin
export GOPATH=${HOME}/Gotools


#Eddie
python3 ~/.dotfiles/eddie/randline.py ~/.dotfiles/eddie/greetings.txt $USER
