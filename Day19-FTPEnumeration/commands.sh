##ping to confimr connectivity
ping 10.129.1.14



## I first uninstalled ftp that was installed by snap and installed it by apt
sudo snap remove nmap
sudo apt update
sudo apt install nmap

##check open ports
sudo nmap 10.129.1.14

##Version detection
sudo nmap -sV 10.129.1.14

##ftp functionality
ftp -?

##ftp connection
ftp 10.129.1.14
### username:
anonymous
##password[put any]
anon123

#ftp>
help #help desk
ls #view contents of the folder we are in
get flag.txt #download file
bye #exit


#view content of pwd
ls

#display content of file
cat flag.txt