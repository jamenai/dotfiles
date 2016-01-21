#!/bin/sh
#
# Usage: extract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
#
# credit: http://nparikh.org/notes/zshrc.txt


extract () { # extract files. Ignore files with improper extensions.
    local x
    ee() { # echo and execute
    	echo "$@"
    	$1 "$2"
    }
    for x in "$@"; do
    	[[ -f $x ]] || continue
    	case "$x" in
    		*.tar.bz2 | *.tbz2 )	ee "tar xvjf" "$x"	;;
    		*.tar.gz | *.tgz ) ee "tar xvzf" "$x"	;;
    		*.bz2 )				ee "bunzip2" "$x"	;;
    		*.rar )				ee "unrar x" "$x"   ;;
    		*.gz )				ee "gunzip" "$x"    ;;
    		*.tar )				ee "tar xvf" "$x"   ;;
    		*.zip )				ee "unzip" "$x"     ;;
    		*.Z )				ee "uncompress" "$x" ;;
    		*.7z )				ee "7z x" "$x"      ;;
    	esac
    done
}


# ----------------------------------------------------------------------
# | Search                                                             |
# ----------------------------------------------------------------------

# Search history

qh() {
    #           ┌─ enable colors for pipe
    #           │  ("--color=auto" enables colors only if
    #           │  the output is in the terminal)
    grep --color=always "$*" "$HISTFILE" |       less -RX
    # display ANSI color escape sequences in raw form ─┘│
    #       don't clear the screen after quitting less ─┘
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Search for text within the current directory

qt() {
    grep -ir --color=always "$*" . | less -RX
    #     │└─ search all files under each directory, recursively
    #     └─ ignore case
}

# ----------------------------------------------------------------------
# | Text Processing                                                    |
# ----------------------------------------------------------------------

# Human readable file size
# (because `du -h` doesn't cut it for me)

hrfs() {

    printf "%s" "$1" |
    awk '{
            i = 1;
            split("B KB MB GB TB PB EB ZB YB WTFB", v);
            value = $1;
            # confirm that the input is a number
            if ( value + .0 == value ) {
                while ( value >= 1024 ) {
                    value/=1024;
                    i++;
                }
                if ( value == int(value) ) {
                    printf "%d %s", value, v[i]
                } else {
                    printf "%.1f %s", value, v[i]
                }
            }
        }' |
    sed -e ":l; s/\([0-9]\)\([0-9]\{3\}\)/\1,\2/; t l"
    #                          └─ add commas to the numbers
    #                             (changes "1023.2 KB" to "1,023.2 KB")
}

#log "my string to be logged"
log() {
     echo [`date +%Y-%m-%d\ %H:%M:%S`] $*
}



# Define shell function
#check_process mysql;
#CHECK_RET=$?;
#if [ $CHECK_RET -ne 0 ]; 
    # code block for process exists 
#else
    # code block for process not present
#fi;
check_process() {
    echo "Checking if process $1 exists..."
    [ "$1" = "" ]  && return 0
    PROCESS_NUM=$(ps -ef | grep "$1" | grep -v "grep" | wc -l)
    if [ $PROCESS_NUM -ge 1 ];
    then
            return 1
    else
            return 0
    fi
}


cd (){
    builtin cd "$@" && ls
}


myinfo () {
  printf "CPU: "
  cat /proc/cpuinfo | grep "model name" | head -1 | awk '{ for (i = 4; i <= NF; i++) printf "%s ", $i }'
  printf "\n"

  cat /etc/issue | awk '{ printf "OS: %s %s %s | " , $1 , $2 , $3  }'
  uname -a | awk '{ printf "Kernel: %s " , $3 }'
  uname -m | awk '{ printf "%s | " , $1 }'

  printf "DESKTOP ENV: $XDG_CURRENT_DESKTOP" 
  #kded4 --version | grep "KDE Development Platform" | awk '{ printf "KDE: %s", $4 }'
  printf "\n"
  uptime | awk '{ printf "Uptime: %s %s %s", $3, $4, $5 }' | sed 's/,//g'
  printf "\n"
  #cputemp | head -1 | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
  #cputemp | tail -1 | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
  #cputemp | awk '{ printf "%s %s", $1 $2 }'
}

cls() { cd "$1"; ls;}


#"Sort by size" to display in list the files in the current directory, sorted by their size on disk.
sbs() { du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';} 



#Not Working 
kernelgraph() { 
    lsmod | perl -e 'print "digraph \"lsmod\" {";<>;while(<>){@_=split/\s+/; print "\"$_[0]\" -> \"$_\"\n" for split/,/,$_[3]}print "}"' | dot -Tpng | display -;
}


l() { 
    locate "$1" | grep --color "$1"; 
}


# print the last ten modified files in the specified directory
#last() {
#    ls -lt "$1" | head;
#}

# copy a file to the clipboard from the command line
 cpToCl() {
    cat $1 | xclip -selection clipboard;
}

# shortcut for recursively grepping
 gr() {
    grep -r $1 . ;
}

# shortcut for compiling and running Java programs (I use this for competitions)
# j() {
#    filename="${1%.*}"
#    javac $filename.java
#    if [[ $? == 0 ]]; then
#       java $filename
#    fi
#}

# shortcut for compiling and running C++ programs
g() {
    filename="${1%.*}"
    g++ $filename.cpp -o $filename
    if [[ $? == 0 ]]; then
       ./$filename
    fi
}
