
# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

#Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
alias .4='cd ../../../../'
alias .5='cd ../../../../..'



### LS Shortcuts 
alias l="ls -lF ${colorflag}" # List all files colorized in long format
alias la="ls -laF ${colorflag}" # List all files colorized in long format, including dot files
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'" # List only directories
alias ls="command ls ${colorflag}" # Always use color output for `ls`



# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"


# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


 
#Display the directory structure recursively in a tree format.
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'" 