## Lab Walkthrough
#The lab provided the remote VM IP: 10.10.137.96

#ssh login
ssh tryhackme@10.10.137.96
#then input password that was provided by the lab

#On successful login
#confirm the account you are using
whoami
#view effective user and groups
id
#current working directory
pwd
#list files, reveal hidden files
ls -la
#Running processes
ps aux | less



##if login would have failed i would have
#check connectivity
ping 10.10.137.96

#Check port availability
nc -vz 10.10.137.96 22
nmap -p 22 10.10.137.96

#Confirm correct username and IP, and check for typos


##Some experiments I tried 
#Copying files
scp tryhackme@10.10.137.96:/path/to/remote/file ./localfile

#Execute commands remotely
ssh tryhackme@10.10.137.96 "ls -la /home/tryhackme; whoami" 
