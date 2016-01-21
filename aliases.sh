
###### INIT ##########



export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

####################################

# Shortcuts
alias g="git"
alias h="history"
alias j="jobs"

#TODO IF System = Linux
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
# Enable aliases to be sudo’ed
alias sudo='sudo '
alias s='sudo'
# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
#alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'


# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"


# Canonical hex dump; some systems have this symlinked
#command -v hd > /dev/null || alias hd="hexdump -C"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

alias nethack='telnet nethack.alt.org'


# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'



# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias sound="tput bel"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"


# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r |more"

alias starwars="telnet towel.blinkenlights.nl"





# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"





#4: Start calculator with math support
 
alias bc='bc -l'

#5: Create parent directories on demand
#mkdir command is used to create a directory:
 
alias mkdir='mkdir -pv'



#Make mount command output pretty and human readable format
 
alias mount='mount |column -t'

#8: Command short cuts to save time
 
# handy short cuts #
alias h='history'
alias hg="history | grep"
alias j='jobs -l'


#9: Create a new set of commands
 
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'


#16: Add safety nets

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 # delete directories
alias rd='rm -rf'
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'


alias wtc="curl --silent 'http://whatthecommit.com/index.txt'"


## this one saved by butt so many times ##
alias wget='wget -c'

#copy output of last command to clipboard
alias cl="fc -e -|pbcopy"

alias cpwd='pwd|tr -d "\n"|pbcopy'


# Monitor logs
alias syslog='sudo tail -100f /var/log/syslog'
alias messages='sudo tail -100f /var/log/messages'



#Run the last command as root
alias last='sudo !!'


alias captureScreen='ffmpeg -f x11grab -s 800x600 -r 25 -i :0.0 -sameq /tmp/out.mpg'



alias snake='worm'