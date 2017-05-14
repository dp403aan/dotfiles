# -----------------------------------------------
# fichier: ~/.bashrc
# auteur: poulpoul
# -----------------------------------------------
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

shopt -s cdable_vars      # if cd arg is not valid, assumes its a var defining a dir
shopt -s cdspell          # autocorrects cd misspellings
shopt -s checkwinsize     # update the value of LINES and COLUMNS after each command if altered
shopt -s cmdhist          # save multi-line commands in history as single line
shopt -s dotglob          # include dotfiles in pathname expansion
shopt -s expand_aliases   # expand aliases
shopt -s extglob          # enable extended pattern-matching features
shopt -s histappend       # append to (not overwrite) the history file
shopt -s hostcomplete     # attempt hostname expansion when @ is at the beginning ofa word
shopt -s nocaseglob       # pathname expansion will be treated as case-insensitive

HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000
HISTIGNORE="ls -rtl:cd:c:maj:syncc:history"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Prompt perso (voidandany.free.fr)

GRAY="\[\e[0;33m\]"
CYAN="\[\e[0;36m\]"
LIGHT_CYAN="\[\e[01;36m\]"
RED="\[\e[1;31m\]"
SQUARE='\342\226\210'
 
if [ "$UID" -eq "0" ]  # Si root 
then
 PS1="\n$RED$SQUARE $CYAN\u @ $LIGHT_CYAN\w\n\`if [ \$? = "0" ]; then echo '${LIGHT_CYAN}'; else echo '${RED}'; fi\`$SQUARE $CYAN\t $GRAY#\!$LIGHT_CYAN $ \[\033[0;39m\]"
else
 PS1="\n$LIGHT_CYAN$SQUARE $CYAN\u @ $LIGHT_CYAN\w\n\`if [ \$? = "0" ]; then echo '${LIGHT_CYAN}'; else echo '${RED}'; fi\`$SQUARE $CYAN\t $GRAY#\!$LIGHT_CYAN $ \[\033[0;39m\]"
fi


# Aptitude - Dpkg
#alias ins='sudo aptitude install -y'
#alias maj='sudo aptitude update; sudo aptitude safe-upgrade'
#alias pol='apt-cache policy'
#alias show='apt-cache show'
#alias cherche='apt-cache search'
#alias vire='sudo aptitude remove --purge'
#alias menage="sudo aptitude purge '(~c|~g)' --purge-unused"
#alias dep='apt-rdepends'
#alias ListePaquetsInstalles='dpkg --get-selections | grep -v deinstall > ListePaquetsInstalles'
#alias pkgr='dpkg -l|grep';           # liste des paquets dont le nom contient $1
#alias pkl='dpkg -l';                 # pour voir l'etat local du paquet $1
#alias pkL='dpkg -L';                 # la liste des fichiers du paquet $1

# Places
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias bu='cd /home/${USER}/Desktop/'
alias sli='cd /run/media/${USER}/SLIDER/ && ls -rtl'
alias wd='cd /run/media/${USER}/WD && ls -rtl'
alias verb='cd /run/media/${USER}/VERBATIM && ls -rtl'
alias pnoy='var=$(TZ='Asia/Manila' date +%Hh%M); echo "Oras sa Filipinas ? => ${var}"'
alias tokyo='var=$(TZ='Asia/Tokyo' date +%Hh%M); echo "A Tokyo, il est ${var}"'
alias bang='var=$(TZ='Asia/Bangkok' date +%Hh%M); echo "A Bangkok, il est ${var}"'
alias sc='cd ~/Scripts'
alias pe='cd ~/Scripts/Perl'
alias py='cd ~/Scripts/Python'
alias rezo='nmap -sP 192.168.0.0-50'
alias thu='thunar .'
alias heure=' figlet $(date +%T)'
alias v2='cd /run/media/${USER}/SLIDER/IT/V2/'

# Pacman
alias maj='sudo pacman -Syu'
alias pacs='sudo pacman -S'
alias pacr='sudo pacman -Rs'
alias pacu='sudo pacman -U'
alias pacral='sudo pacman -Rsn'
alias pacor='pacman -Qm'
alias pacf='pacman -Ss'
alias paq='pacman -Q | grep -ie$1'
alias paqi='pacman -Qi'
alias paco='pacman -Qo'	        # Fichiers appartenant au paquet
alias mefi='makepkg -efi --noconfirm'
alias pacex='pacman -Qte'	# Paquets installés explicitement
alias aurup='package-query -AQm'
alias aurf='package-query -As --sort w'
alias paclist="pacman -Qe | sed -e "s-.*/\(.*\)-\1-" | cut -d ' ' -f 1 > packages_list_`date +%d%m%Y`.txt"

# Logs
alias logx='tail -n 30 -f /var/log/Xorg.0.log | ccze -A'
alias loger='tail -n 30 -f /var/log/errors.log | ccze -A'
alias logs='cd /var/log'

# Git
alias g='cd ~/Git'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gsb='git show-branch'
alias gco='git checkout'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'
alias gcl='git config --list' # --global

# Openbox
alias open='cd ~/.config/openbox && ls -rtl'
alias obr='vi ~/.config/openbox/rc.xml'
alias obm='vi ~/.config/openbox/menu.xml'
alias oba='vi ~/.config/openbox/autostart.sh'
alias or='openbox --reconfigure'

# Misc
alias h='cd ~'
alias c='clear'
alias cl='clear;ls -rtlh'
alias lx='ls -lXB'
alias topten="history | awk '{print \$5}' | sort | uniq -c | sort -rn | head -10"
alias listextensions="find . -type f | awk -F'.' '{print $NF}' | sort| uniq -c | sort -g"
alias jour='var=$(/usr/bin/cal); echo "${var/$(date +%-d)/$(echo -e "\033[1;31m$(date +%-d)\033[0m")}"'
alias mount='mount | column -t'
alias em='shuf -i 1-50 -n 5 | sort -n | xargs && shuf -i 1-11 -n 2 | sort -n | xargs'
alias v='vlc http://mafreebox.freebox.fr/freeboxtv/playlist.m3u &'
alias hgr='history | grep -v hgr | grep -i'
alias randcmd='ls /usr/bin | shuf -n 1'
alias shred='shred -n 35 -z -u -v'
alias plist='ls -R > playslist.m3u'
alias dirs='ls -l|grep "^d"'
alias dots='ls .[a-zA-Z0-9_]*'
alias shot='scrot -d 5 -b -t 20 shot_`date '+%F'`.png'
alias rip='rip(){ mv $1 `echo $1 | sed 's/.avi$/[ripped.by.Poulpoul].avi/'`; }; rip'
alias thumbs='find . -type f -iname "thumbs.db" -print0 | xargs -0 -r rm -v'
alias tree="find . | sed 's/[^/]*\//|   /g;s/| *\([^| ]\)/+--- \1/'"
alias path='echo $PATH | tr ":" "\n"'
alias md='mkdir -pv'
alias agr='alias | grep -i'
alias chx='chmod +x'
alias hdd='sudo smartctl -a -d ata /dev/sda'
alias st='scrot -t 10'
alias st6='scrot -cd 6 -t 33'
alias feh='feh -q -d -g 1365x768'
alias trk='mocp -Q %title >> ~/OUT.out 2> /dev/null'
alias f='xrandr --size 1920x1080'
alias l='xrandr --size 1680x1050'
alias bc='bc -l'
alias kvm64='qemu-system-x86_64 --enable-kvm -m 2048 -k fr -soundhw all -vga std -usb'
alias kbfr='setxkbmap fr'
alias kff='pkill fire'
alias kp='pkill $1'
alias sx='startx'
alias x='exit'
alias r='reboot'
alias svp='sudo $(history -p !-1)'
alias passgen="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 12 | tr -d '\n'; echo" # see pwgen
alias rr='rm -r'

# Jekyll
alias je='cd ~/Scripts/jekyll'
alias js='jekyll serve'
alias po='cd _posts'

# Sync/Backups

alias syncc='rsync -arv /run/media/${USER}/SLIDER/ ~/BKP_SLIDER --delete --exclude 'MUSIC' --exclude 'PS3' --exclude 'FILMS''
alias bkpw='rsync -avzh root@192.168.0.17:/var/www/dokuwiki BKP_Wiki/'
alias bkpr='rsync -avzh root@192.168.0.17:/etc/yunohost/apps/ BKP_Rpi'

############
# Fonctions
############

mkcd () 
{
 mkdir -p "$*"
 cd "$*"
}

function xpdf() { command xpdf "$@" & }

# Usage "bkp filename.txt"
function bkp() { sudo cp $1 ${1}_`date +%d%m%Y_%H%M%S`.bkp ; }

calc() 
{ 
 awk "BEGIN { print $* }" 
}

ccd()
{
 cd $@ && ls -rtl
}

scr() # création de script
{
cat > $1 << EOF
#!/bin/bash
#---------------------------------------------------
# Nom du script......: 
# Auteur.............: 
# Date de creation...: 
# Objet..............:
# Syntaxe............: 
# Modification(s)....: 
#---------------------------------------------------
# Fonctions

# Renseignement des variables

# Début de la procédure
EOF
vi +15 $1
}

# Extraction
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

nospace()
{
 for i in *
 do
  mv "$i" "`echo $i | tr " " "_"`"
 done
}

onespace()
{
 mv "$1" "`echo $1 | tr " " "_"`"
}

vides()
{ 
 find $1 -empty
}

flac2mp3()
{
 for file in *.flac; do flac -cd "$file" | lame -h - "${file%.flac}.mp3"; done
}

trouve()
{
 if [ $# -eq 0 ]
 then
 echo "Usage: Trouve mot"
 return 69 
 else
  for i in "$@"
  do
   find -iname "*$i*" | grep -i $i
  done
 fi
}

long()
{
 if [ $# -lt 1 ]
 then
  echo "Compte le nb de caracteres en argument"
  echo "Usage: long string"
 else
  echo -n $@ | wc -c
 fi
}	

fawk()
{
 first="awk '{print "
 last="}'"
 cmd="${first}\$${1}${last}"
 eval $cmd
}

up()
{
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

utf8()
{
 iconv -f ISO-8859-1 -t UTF-8 $1 > $1.tmp
 rm $1
 mv $1.tmp $1
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).

if [ -f /etc/bash_completion ] && ! shopt -oq posix
then
 . /etc/bash_completion
fi

set -o vi
export PATH=$PATH:/home/${USER}/Scripts
export PATH=$PATH:/home/${USER}/.gem/ruby/2.3.0/bin
export HISTTIMEFORMAT="[%d-%m-%Y] %H:%M $ "
export HISTCONTROL="ignoredups:ignorespace"
export TERM=xterm-256color
export EDITOR=vi

echo $(man $(ls /usr/bin | shuf -n 1)| sed -n "/^NAME/ { n;p;q }")
