# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth:erasedups

# Make some commands not show up in history
HISTIGNORE=" *:ls:cd:cd -:pwd:exit:date:* --help:* -h:apt update"

# save and reload history after each command
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000000
HISTFILESIZE=$HISTSIZE
HISTTIMEFORMAT="%h %d %H:%M:%S "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# get current branch in git repo
function parse_git_branch() {
        BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
        if [ ! "${BRANCH}" == "" ]
        then
                STAT=`parse_git_dirty`
                echo "[${BRANCH}${STAT}]"
        else
                echo ""
        fi
}

# get current status of git repo
function parse_git_dirty {
        status=`git status 2>&1 | tee`
        dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
        untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
        ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
        newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
        renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
        deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
        bits=''
        if [ "${renamed}" == "0" ]; then
                bits=">${bits}"
        fi
        if [ "${ahead}" == "0" ]; then
                bits="*${bits}"
        fi
        if [ "${newfile}" == "0" ]; then
                bits="+${bits}"
        fi
        if [ "${untracked}" == "0" ]; then
                bits="?${bits}"
        fi
        if [ "${deleted}" == "0" ]; then
                bits="x${bits}"
        fi
        if [ "${dirty}" == "0" ]; then
                bits="!${bits}"
        fi
        if [ ! "${bits}" == "" ]; then
                echo " ${bits}"
        else
                echo ""
        fi
}

if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}\[\e[36m\]\`parse_git_branch\`\[\e[m\] \[\e[01;33m\]\u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[01;32m\]\h\[\e[0m\] : [ \[\e[01;35m\]\w\[\e[0m\]\[\e[01;37m\] ] \[\e[0m\]\n\$ "
else
    PS1="${debian_chroot:+($debian_chroot)}\`parse_git_branch\` \u@\h: \w\n\$ "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\`parse_git_branch\`\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Aliases
alias wget="wget --hsts-file ~/.cache/wget/.wget-hsts"
alias vi="vi -i ~/.cache/vim/info"
alias vim="vi -i ~/.cache/vim/info"
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -s"
alias rm="rm -i"
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias update="sudo apt update -qq"
alias upgrade="sudo apt upgrade -qq -y"
alias cleanapt="sudo apt autoremove -y && sudo apt remove -y && sudo apt clean"
alias push="git push"
alias commit="git commit -m "$1""
alias add="git add"
alias reload="source ~/.bashrc"
alias status="git status"

# Enables fzf keybindings for Bash
source /usr/share/doc/fzf/examples/key-bindings.bash

# Enables fuzzy uto-completion for Bash
source /usr/share/doc/fzf/examples/completion.bash

# Make Go Work
export GOPATH=~/gotools
export PATH=${PATH}:/usr/local/go/bin:${GOPATH}/bin

# Detect if tmux in a tmux enviroment then export TERM as xterm-256color
[ -z "$TMUX" ] && export TERM=xterm-256color

mosh_session="$(who | grep -v 'via mosh' | grep -oP '(?<=mosh \[)(\d+)(?=\])')"
[ -n "$mosh_session" ] && kill -9 "$mosh_session"

# Detect if connected through mosh then spawn a tmux session
is_mosh="$(pstree -plus $$ | grep -o mosh-server)"
if [ "$is_mosh" == "mosh-server" ]; then                                            # check if this is a mosh session
  if command -v tmux >/dev/null 2>&1; then                                          # check if tmux is installed
     if [[ -z "$TMUX" ]]; then                                                      # do not allow tmux in tmux
        detached_session="$(t ls | grep -vm1 attached | cut -d: -f1)"               # get detached session name
        if [[ -z "$detached_session" ]]; then                                       # check if detached session is present
           tn Default                                                               # if there is no detached session, create a new session called default
        else
           ta "$detached_session"                                                   # if detached session is present attach to it
        fi
     fi
  fi
fi

# Pass login messages to tmux
MOTD="/run/motd.dynamic"

if [ ! -z "$TMUX" ]; then       # check if we are inside tmux
  if [ -f "$MOTD" ]; then       # check if file file is present
    cat "$MOTD"                 # show motd contents
  fi
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config
# ignoring wildcards
[[ -e "$HOME/.ssh/config" ]] && complete -o "default" \
        -o "nospace" \
        -W "$(grep "^Host" ~/.ssh/config | \
        grep -v "[?*]" | cut -d " " -f2 | \
        tr ' ' '\n')" scp sftp ssh mosh

# make man have color
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

unset file
