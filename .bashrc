
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=
HISTFILESIZE=
HISTIGNORE="ls -rtl:cd:c:up[dg]:upgl:alias:cl:[bf]g:cl"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
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

alias agr='alias | grep -i'
alias c='clear'
alias cdssh='cd ~/.ssh'
alias cl='clear;ls -rtl'
alias clean-chromium-cache='rm -Rf ~/.cache/chromium/'
alias dist='sudo apt dist-upgrade'
alias dmesg='dmesg -T'
alias ebash='vi ~/.bashrc'
alias full='sudo apt full-upgrade'
alias gg='cd ~/Git'
alias gl="git log --date=format:'%d-%m-%Y %H:%M:%S' --pretty=format:'%Cred%h - %Cblue%an - %Cgreen%ad : %C(yellow)%s'"
alias ins='sudo apt install -y'
alias ip='ip -c'
alias l='ls -rtl'
alias lsssh='ls -rtl ~/.ssh'
alias manila='var=$(TZ='Asia/Manila' date +%Hh%M); echo "Oras sa Manila : ${var}"'
alias mount='mount | column -t'
alias raspiu='sudo rpi-update'
alias rezo='nmap -sn 192.168.1.0/24'
alias sbash='source ~/.bashrc'
alias search='apt search'
alias sizecache='du -ms ~/.cache/chromium/'
alias sl='ls'
alias supp='sudo apt remove --purge -y'
alias svp='sudo $(history -p !-1)'
alias tokyo='var=$(TZ='Asia/Tokyo' date +%Hh%M); echo "A Tokyo, il est ${var}"'
alias topmem='ps aux | awk '\''{print $6/1024 " MB\t\t" $11}'\'' | sort -rn | head -20'
alias t='/opt/vc/bin/vcgencmd measure_temp'
alias upd='sudo apt update'
alias upgl='apt list --upgradable'
alias upg='sudo apt upgrade -y'
alias vi='vim'

# Functions

ex() 
{
 if [ -f $1 ] 
 then
  case $1 in
   *.tar.bz2)   tar xvjf $1    ;;
   *.tar.gz)    tar xvzf $1    ;;
   *.tar.xz)    tar xvJf $1    ;;
   *.bz2)       bunzip2 $1     ;;
   *.rar)       unrar x $1     ;;
   *.gz)        gunzip $1      ;;
   *.tar)       tar xvf $1     ;;
   *.tbz2)      tar xvjf $1    ;;
   *.tgz)       tar xvzf $1    ;;
   *.zip)       unzip $1       ;;
   *.Z)         uncompress $1  ;;
   *.7z)        7z x $1        ;;
   *.xz)        unxz $1        ;;
   *.exe)       cabextract $1  ;;
   *)           echo "'$1': pb avec extraction" ;;
   esac
 else
  echo "'$1' n'est pas un fichier valide"
 fi
}

noSpaces()
{
 for i in *
 do
  mv "$i" "`echo $i | tr " " "."`"
 done
}

noUnderscores()
{
 for i in *
 do
  mv "$i" "`echo $i | tr "_" "."`"
 done
}

oneSpace()
{
 mv "$1" "`echo $1 | tr " " "."`"
}

oneUnderscore()
{
 mv "$1" "`echo $1 | tr "_" "."`"
}

# Backups and Syncs

alias bkpo='rsync -arv /run/media/${USER}/OZI_16G/ ~/Documents/BKP_OZI --delete '
alias bkpm='rsync -arv ~/Documents/BKP_OZI/ /run/media/${USER}/Maxtor/BKP_OZI/'
alias bkpo2m='rsync -arv /media/pi/OZI/ /media/pi/Maxtor/BKP_OZI/ --delete'
alias bkp2san='rsync -arv ~/Documents/ /media/pi/AEDB-DC20/BKP_KEY/RPI4_Backup/ --delete'
alias bkp2ozi='rsync -arv ~/Documents/ /media/pi/OZI_16G/RPI4_Backup/ --delete'
alias bkpw='rsync -avzh root@192.168.1.4:/var/www/dokuwiki/data/pages/ /home/${USER}/Documents/BKP_Wiki/ --delete'

export EDITOR=/usr/bin/vim

. "/home/pi/.local/share/lscolors.sh"
