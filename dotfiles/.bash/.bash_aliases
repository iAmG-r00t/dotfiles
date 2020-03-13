# tmux aliases
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias tks='tmux kill-server'
alias tad='tmux attach -d -t'
alias tkst='tmux kill-session -t'
alias tm='tmux new-session -t r00t'
alias reload='source ~/.bashrc'
alias tools='source ~/.bash_profile'
alias lf='ls -p | grep -v / --color=auto'
alias ls='ls --color=auto'
alias lock='gnome-screensaver-command -l'
alias lhf='ls -d .?*'
alias dir='dir --color=auto'
alias off='shutdown now'
alias svs='wg show'
alias of='xdg-open'
alias b='cd -'
alias h='cd ~'
alias pi='sudo apt install -y'
alias pu='sudo apt purge'
alias clh='cat /dev/null > ~/.torical && history -c'
alias kp='pidof $1 | xargs kill -9'
alias wget="wget --hsts-file ~/.cache/wget/.wget-hsts"
alias vi="vi -i ~/.cache/vim/info"
alias vim="vim -i ~/.cache/vim/info"
alias docker="sudo docker"
alias update-OMZ='cd '$ZSH' && git stash && upgrade_oh_my_zsh && git stash pop'
# Works with lenovo ThinkPad Yoga 260
alias touchoff="xinput --disable $(xinput --list | egrep -io "Wacom.+Finger.+id=([0-9]+)" | awk '{print substr($8,length($8)-0)}')"
alias touchon="xinput --enable $(xinput --list | egrep -io "Wacom.+Finger.+id=([0-9]+)" | awk '{print substr($8,length($8)-0)}')"
alias public-ip='curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+''

# Keyboard Binds for each application/software and terminal Shortcuts
alias k-b=' echo -e "
\033[1;33mCommand:	What it does \033[0;31m\e[5m(Terminal Based)\033[0m
\e[96mCtrk + A\033[0m	\e[95mMoves the cursor to the start of a line
\e[96mCtrl + E\033[0m	\e[95mMoves the cursor to the end of a line
\e[96mCtrl + W\033[0m   \e[95mDeletes the word before the cursor
\e[96mCtrl + U\033[0m	\e[95mDeletes from the start of the line to the current cursor position
\e[96mCtrl + K\033[0m	\e[95mDeletes from the current cursor position to the end of the line
\e[96mEsc + B\033[0m		\e[95mMoves the cursor to the beginning of the previous or current word
\e[96mAlt + B\033[0m    \e[95mGoes back one word at a time
\e[96mAlt + F\033[0m    \e[95mMoves forward one word at a time
\e[96mAlt + C\033[0m    \e[95mCapitalizes letter where cursor is and moves to end of word
\e[96mCtrl + R          \e[95mReverse search previous executed commands
\e[96mCtrl + S          \e[95mFreez screen
\e[96mCtrl + Q          \e[95mUnfreeze screen 

\033[1;33mCommand:	What it does \033[0;31m\e[5m(Terminator)\033[0m
\e[96mCtrl+Shift+O                 \e[95mSplits terminal Horizontally (-)
\e[96mCtrl+Shift+E                 \e[95mSplits terminal Vertically   (|)
\e[96mCtrl+Shift+<Key Direction>   \e[95mMove parent dragbar to that direction
\e[96mAlt+<Key Direction>          \e[95mMove to the terminal which is located to that direction
\e[96mCtrl+Shift+S                 \e[95mHide or Show Scrollbar
\e[96mCtrl+Shift+F                 \e[95mSearch within terminal scrollbar
\e[96mCtrl+Tab                     \e[95mMove to next terminal within the same window tab
\e[96mCtrl+Shift+Tab               \e[95mMove to previouse terminal within the same window tab
\e[96mCtrl+Shift+C                 \e[95mCopy selected text to clipboard
\e[96mCtrl+Shift+V                 \e[95mCopy Paste clipboard text
\e[96mCtrl+Shift+W                 \e[95mClose the current terminal
\e[96mCtrl+Shift+X                 \e[95mMaximize the current terminal
\e[96mF11                          \e[95mFull screen"'

# Copy files cheats
alias c-f=' echo -e "
\033[1;33mCommand:	What it does \033[0;31m\e[5m(Rsync)\033[0m
\e[96mrsync -t *.csv -e ssh RServer-IP:/path/to/save			\e[95mCopy files to server
\e[96mrsync -avz file.csv -e ssh RServer-IP:/path/to/save		\e[95mCopy one file to a server

\033[1;33mCommand:	What it does \033[0;31m\e[5m(SCP)\033[0m
\e[96mscp -i private-key <file_path> user@RServer-IP:/path/on/Rserver    \e[95mCopy file to server
\e[96mscp -i private-key user@RServer-IP:/path/on/Rserver /path/to/save  \e[95mCopy file from server

\033[1;33mCommand:	What it does \033[0;31m\e[5m(Parallel SCP)\033[0m
\e[96mparallel-scp -h hosts.txt -l user_name -v /path/on/Local /path/to/Rserver \e[95mCopy file to multiple servers"'

# Tmux cheats
alias tmx=' echo -e "
\033[1;33mCommand:	What it does \033[0;31m\e[5m(Tmux)\033[0m
\e[96mtls                  \e[95mList sessions
\e[96mtns session-name     \e[95mNew session with custom name
\e[96mtat session-name     \e[95mAttach to a tmux session
\e[96mCtrl+a :kill-session \e[95mKill attached session

\e[96mCtrl+a c            \e[95mNew window
\e[96mCtrl+a d            \e[95mDetach from session
\e[96mCtrl+a <comma>      \e[95mRename window
\e[96mCtrl+a n            \e[95mSwitch to next screen
\e[96mCtrl+a p            \e[95mSwitch to previous screen
\e[96mCtrl+a w            \e[95mList windows
\e[96mCtrl+a &            \e[95mKill current window
\e[96mCtrl+a <number>     \e[95mSwitch between windows by their number (works from 0-9)
\e[96mCtrl+a -            \e[95mSplit window vertically
\e[96mCtrl+a |            \e[95mSplit window horizontally
\e[96mCtrl+a o            \e[95mSwitch panes
\e[96mCtrl+a <space-bar>  \e[95mSwitch pane from horizontal to vertical view (works vice-verser)
\e[96mCtrl+a { and }      \e[95mSwap the current pane with the previous pane and current pane with the next pane
\e[96mCtrl+d              \e[95mClose pane
\e[96mCtrl+a !            \e[95mBreak pane to its own window

\e[96mCtrl+a [            \e[95mEnter copy Mode
\e[96mAlt+f               \e[95mMove right per word
\e[96mAlt+b               \e[95mMove left per word
\e[96mCtrl+f              \e[95mMove right per letter
\e[96mCtrl+b              \e[95mMove left per letter
\e[96mCtrl + <space-bar>  \e[95mStart of higlight
\e[96mAlt+w               \e[95mCopy higlighted text
\e[96mCtrl+a ]            \e[95mPaste text from tmux copy buffer
\e[96mCtrl+a y			  \e[95mCopy tmux copy buffer to clipboard
\e[96mCtrl+a Y            \e[95mCopy current pane(s) directory

\e[96mCtrl+a I            \e[95mFetch plugins
\e[96mCtrl+a U            \e[95mUpdate plugins"'

# Vi cheat sheets
alias vm=' echo -e "
\033[1;33mCommand:	What it does \033[0;31m\e[5m(Vi)\033[0m
\e[96m :q       \e[95mQuit
\e[96m :w       \e[95mSave/Write
\e[96m :q!      \e[95mQuit without saving
\e[96m  I       \e[95mEnter Insert before cursor
\e[96m  a       \e[95mAppend after cursor

\e[96m Ctrl+r   \e[95mRedo
\e[96m Ctrl+e   \e[95mScroll the window down
\e[96m Ctrl+y   \e[95mScroll the window up
\e[96m Ctrl+f   \e[95mScroll down one page
\e[96m Ctrl+b   \e[95mScroll up one page
\e[96m H        \e[95mMove the cursor to the top of the window
\e[96m M        \e[95mMove the cursor to the middle of the window
\e[96m L        \e[95mMove the cursor to the bottom of the window
\e[96m gg       \e[95mGo to the top of file
\e[96m G        \e[95mGo to the bottom of file

\e[96m .        \e[95mRepeat last command done
\e[96m u        \e[95mUndo last action
\e[96m y        \e[95mYank/Copy

\e[96m dw       \e[95mDelete a from cursor position to end of word
\e[96m o        \e[95mCreate a new line below
\e[96m O        \e[95mCreate a new line above
\e[96m x        \e[95mDelete the character the cursor is over
\e[96m X        \e[95mDelete one character before (to the left of) the cursor
\e[96m dd       \e[95mDelete a line
\e[96m caw      \e[95mChange word
\e[96m cc       \e[95mChange line
\e[96m r<char>  \e[95mReplace character with <char>
\e[96m R        \e[95mTypeover (Replace)
\e[96m s        \e[95mSubstitute 1 char with string
\e[96m S        \e[95mSubstitute rest of line with string
\e[96m n        \e[95mNext string match
\e[96m N        \e[95mPrevious string match

\e[96m :set number    \e[95mInsert line numbers
\e[96m :r file        \e[95mInsert file after current line
\e[96m :/string       \e[95mSearch for string"' 


#Functions placed in ALIAS Mode:
# CSV Editor with pspg
csview(){
	pspg -f '$1' --csv -s
}

# List files in a directory
lfd(){
	ls -p '$1' | grep -v / --color=auto
}

# Show contents of dir after action
cd-ls(){
   cd "$1"
   ls -a
}

# Golang install or upgrade
getgolang(){

   dir="/usr/local/go"
   if [ -e "$dir"];    then
   sudo rm -rf "$dir"   
   else

   wget -q -P tmp/ https://dl.google.com/go/go"$@".linux-amd64.tar.gz
   sudo tar -C /usr/local -xzf tmp/go"$@".linux-amd64.tar.gz
   rm -rf tmp/
   go version
   
   fi
 }

# Restart Service
rs(){
	systemctl restart '$1'
}

#Extract common type of archived file types
ext(){
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.tar.xz)    tar xzf $1     ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

 #Directory navigation using down
don(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

#Screen cheat sheet, depreceated because tmux is the O.G
#\033[1;33mCommand:  What it does \033[0;31m\e[5m(Screen)\033[0m
#\e[96mscreen -S session-name    \e[95mStart screen session with custom name
#\e[96mscreen -r session-name    \e[95mAttach to a detached screen session
#\e[96mscreen -x session-name    \e[95mAttach to an attached screen session
#\e[96mscreen -D session-name    \e[95mDetach an attached screen session
#\e[96mscreen -ls                \e[95mList all screen sessions
#\e[96mCtrl+a d                   \e[95mDetach from attached screen
#\e[96mCtrl+a d                   \e[95mDetach from screen
#\e[96mCtrl+a c                   \e[95mNew screen window
#\e[96mCtrl+a Ctrl+a              \e[95mSwitch to last visited screen window
#\e[96mCtrl+a <number>            \e[95mSwitch to screen window by number (works from 0-9)
#\e[96mCtrl+a n                   \e[95mSwitch to next screen window
#\e[96mCtrl+a p                   \e[95mSwitch to previous screen window
#\e[96mCtrl+a <double-quotes>     \e[95mList screen windows
#\e[96mCtrl+a k                   \e[95mKill current screen window
#\e[96mCtrl+a A                   \e[95mRename screen window
