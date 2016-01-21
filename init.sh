#!/bin/bash
_myos="$(uname)"


PATH="/usr/local/bin:$PATH"
PATH="$PATH:$HOME/.dotfiles/bin"



 for src in $(find -H "$DOTFILESROOT" -maxdepth 2 -name '*.sh' -not -path '*.git*' -not -name 'init.sh')
  do
  	#echo "ADD FILE $src"
  	if($src != "$DOTFILESROOT/bootstrap.sh" && $src != "$DOTFILESROOT/init.sh"); then
    	. $src
    #else
    	#echo "Exclude file. $src"
    fi
  done

myinfo

export PS1="\[\033[01;33m\][$USER@$HOSTNAME]\[\033[0;00m\] \[\033[01;32m\]\w\\$\[\033[0;00m\] "
echo "\n"
echo "Welcome to the dark side of the moon, $USER!"
echo -e "Today is $(date)\nUptime: $(uptime)"
echo "Your personal settings have been loaded successfully."

export PATH




##############NOTES#########################

#fortune | cowsay
#arithmetic   -> Simple Math game
#Worm -> snake 

