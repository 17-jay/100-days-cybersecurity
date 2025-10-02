##Downloading files
wget http:127.0.0.1:8000/myfile.txt

## Transferring Files 
#copy file from local to remote (did this in the lab)
scp important.txt ubuntu@192.168.1.30:/home/ubuntu/transferred.txt
#important.txt is the local file being sent
#ubuntu@192.168.1.30 is the remote user + IP
#/home/ubuntu/transferred.txt → destination path on remote

#Copy file from remote to local
scp ubuntu@192.168.1.30:/home/ubuntu/doc.txt notes.txt
#doc.txt - remote file
#notes.txt - local file created

##Processes 101
# List processes in the current shell
ps
#List all processes for all users (standard format)
ps -ef
#List all processes for all users (BSD format)
ps aux
#List processes not associated with a terminal
ps -x
# List processes by a specific user
ps -u <username>
#Find a process by name or PID
ps aux | grep <process_name_or_pid>
#Display a process tree
pstree

#Interactive, real-time view of processes. Displays CPU, memory usage, and more.
top


##Signals (kill command)
sigterm #“Terminate” – requests a process to shut down gracefully (save data, release resources) before exiting
sigkill #“Kill immediately” – forcefully stops the process
sigstop #“Stop/pause” – suspends a process but does not kill it

#Starts a basic HTTP server in the current directory
python3 -m http.server 8080


##Managing services
#systemctl is used to manage systemd services
systemctl [option] <service>
# here are the [options];

# start - starts a service immediately.
# stop - stops a service.
# enable - enables service to start at boot.
# disable - disables service at boot.

#example
sudo systemctl start apache2
sudo systemctl enable apache2




#Foregrounding & Backgrounding
#Foreground process
echo "hi jj" #simple and basic

#Send process to background
ctrl + z # then resume in the background with:
bg

#Bring backgrounded process to foreground
fg


##Automation with cron
#Cron automates tasks on a schedule.
#crontab = special file with time + command format

*  *  *  *  *  command
│  │  │  │  │
│  │  │  │  └─ day of week (0–6, Sun=0)
│  │  │  └──── month (1–12)
│  │  └─────── day of month (1–31)
│  └────────── hour (0–23)
└───────────── minute (0–59)

#Example: Backup every 12 hours
0 */12 * * * cp -R /home/Documents /var/backups
# 0 - run at minute 0.
# */12 - every 12 hours.
# * * * - every day, month, and weekday.
# cp -R - recursive copy

#Edit crontab for current user
crontab -e

# List current crontab entries
crontab -l

# Remove current crontab
crontab -r