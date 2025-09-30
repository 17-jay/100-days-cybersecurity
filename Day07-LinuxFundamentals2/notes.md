# Day 07 – TryHackMe Lab: Linux Fundamentals Part 2 (SSH & Remote Access)

## Objective
Learn Secure Shell (SSH) for secure remote command execution, connect to a remote Linux host provided by TryHackMe, and record the steps used to find the target IP and authenticate to a valid user account.



## What is SSH?
- **SSH (Secure Shell)** is a network protocol used to securely connect to a remote machine and run commands as if you were sitting at that machine.
- All data sent over SSH (including passwords and commands) is **encrypted**, so eavesdroppers on the network cannot read it.
- Default SSH port is **22**, but servers can use a different port for security or organizational reasons.



## Typical Uses
- Remote shell access: `ssh user@host`
- Secure copying of files: `scp` and `sftp`
- Remote command execution without interactive shell
- Port forwarding / tunneling for secure access to services


## Authentication Methods
# Password-based authentication
- You enter a password when prompted after running ssh user@host
- Common in labs and small setups, but LESS SECURE for production


## Key-based authentication
- A public/private key pair is used. The public key goes on the server (~/.ssh/authorized_keys) and the private key stays on your machine
- More secure because there's no password transmitted, and keys can be protected with passphrases


## SSH Basic Syntax & Examples
```bash
# Basic interactive SSH (username + IP)
ssh <username>@<ip-address>

# Example used in the lab:
ssh tryhackme@10.10.137.96

# SSH on a non-standard port (example using port 2222)
ssh -p 2222 tryhackme@10.10.137.96

# Run a single command remotely and exit
ssh tryhackme@10.10.137.96 "uname -a; whoami"

# Copy a remote file to local machine
scp tryhackme@10.10.137.96:/home/tryhackme/flag.txt ./flag.txt


#Open the ssh-login.sh for more details





