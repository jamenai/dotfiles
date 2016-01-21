#########NETWORK ################### 
	# Stop after sending count ECHO_REQUEST packets #
	alias ping='ping -c 5'
	# Do not wait interval 1 second, go fast #
	alias fastping='ping -c 100 -s.2'

	#12: Show open ports
	#Use netstat command to quickly list all TCP/UDP port on the server:

	 
	alias ports='netstat -tulanp'


	#13: Wakeup sleeping servers
	#Wake-on-LAN (WOL) is an Ethernet networking standard that allows a server to be turned on by a network message. You can quickly wakeup nas devices and server using the following aliases:

	 
	## replace mac with your actual server mac address #
	#alias wakeupnas01='/usr/bin/wakeonlan 00:11:32:11:15:FC'
	#alias wakeupnas02='/usr/bin/wakeonlan 00:11:32:11:15:FD'
	#alias wakeupnas03='/usr/bin/wakeonlan 00:11:32:11:15:FE'


	#14: Control firewall (iptables) output
	#Netfilter is a host-based firewall for Linux operating systems. It is included as part of the Linux distribution and it is activated by default. This post list most common iptables solutions required by a new Linux user to secure his or her Linux operating system from intruders.

 # IP addresses
		alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
		alias localip="ipconfig getifaddr en0"
		alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

		## shortcut  for iptables and pass it via sudo#
		alias ipt='sudo /sbin/iptables'
		 
		# display all rules #
		alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
		alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
		alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
		alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
		alias firewall=iptlist


		#15: Debug web server / cdn problems with curl
 
# get web server headers #
alias header='curl -I'
 
# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""