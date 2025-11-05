# ping target to check connectivity
ping <ip address>

# this is what we used to check if the target machine is online
# use nmap to scan for open ports
nmap -sV -p <ip address>
#use the following to skip host discovery and scan all ports(useful when icmp is blocked)
nmap -sV -Pn <TARGET_IP>
#nmap shows you that port 23/tcp is open and running the service "telnet"
# if telnet is not installed, install it with:
sudo apt install telnet 
# then connect to the target using telnet
telnet <target ip> 23


# used the assumption that root's password is 'root' to login
# once logged in, we can explore the file system and read files
whoami        # which user you are
pwd           # present working directory
ls -la        # list files (incl hidden)
id            # user and groups
uname -a      # kernel/OS info
cat flag.txt  # or cat /root/flag.txt if permitted and found
# found the flag in /home/meow/flag.txt



#but if you want:
#service detection but not what’s running on them
nmap -p 22,80 <target> # this scans only ports 22 and 80
#add -sV to detect service versions
nmap -sV -p 22,80 <target>
#without the -p flag, nmap scans the 1000 most common ports 
nmap -sV <target>
#scan the 20 most common ports
nmap --top-ports 20 <target>
#OS Detection
nmap -O <target>
#Aggressive Scan (OS detection, version detection, script scanning, and traceroute)
nmap -A <target>


# the -p specifies which ports to scan