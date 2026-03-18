# Day 16 - HTB Machine: CAP 🐧

## Overview
CAP is an easy-rated Linux machine on Hack The Box covering two core concepts:
1. **IDOR (Insecure Direct Object Reference)** - a web vulnerability
2. **Linux Capabilities abuse** - a privilege escalation technique

**Machine IP:** 10.129.9.76 | **Difficulty:** Easy | **OS:** Linux

---

## Concepts Learned

### 1. HTB VPN Networks
HTB has two separate VPN networks — you must connect to the correct one:

| VPN Type | IP Range | Used For |
|----------|----------|----------|
| Starting Point VPN | 10.10.x.x | Beginner guided labs |
| Labs VPN | 10.129.x.x | Regular machines like CAP |

If you get "Destination Host Unreachable", you are likely on the wrong VPN.

### 2. Nmap – Network Scanning
Nmap discovers open ports and running services on a target.

| Flag | Meaning |
|------|---------|
| `-p-` | Scan all 65,535 ports |
| `--min-rate 10000` | Speed — send at least 10,000 packets/sec |
| `-Pn` | Skip ping, assume host is up (needed when ICMP is blocked) |
| `-sC` | Run default scripts (banners, vuln checks) |
| `-sV` | Detect service versions |

**CAP open ports:** 21 (FTP), 22 (SSH), 80 (HTTP)

### 3. IDOR – Insecure Direct Object Reference
A web vulnerability where changing a parameter in the URL lets you access another user's data without authorization.

- App redirected to `/data/1` after a Security Snapshot
- Changing the URL to `/data/0` exposed a PCAP file belonging to user nathan
- The server never checked if the requesting user owned that resource

### 4. PCAP Analysis with Wireshark
A PCAP file stores recorded network traffic. Wireshark is used to inspect it.

- Filtered traffic using `ftp` in the Wireshark filter bar
- Found nathan's credentials in **plaintext** — FTP does not encrypt traffic
- **Credentials found:** `nathan : Buck3tH4TF0RM3!`

### 5. Password Reuse
The FTP password also worked on SSH — a common real-world mistake called credential reuse.

### 6. HTB Flag Locations (Convention)
| Flag | Location |
|------|----------|
| User flag | `/home/<username>/user.txt` |
| Root flag | `/root/root.txt` |

### 7. Linux Capabilities – Privilege Escalation
Capabilities are special permissions assigned to binaries, allowing privileged operations without full root access.

- `getcap -r / 2>/dev/null` found `/usr/bin/python3.8` had `cap_setuid`
- `cap_setuid` allows changing the process User ID to 0 (root)
- Python called `os.setuid(0)` then spawned `/bin/bash` as root

---

## Attack Chain
```
Nmap → ports 21, 22, 80
  → Web app IDOR (/data/0) → Download PCAP
  → Wireshark → FTP plaintext creds (nathan:Buck3tH4TF0RM3!)
  → SSH as nathan → user.txt
  → getcap → python3.8 cap_setuid → root shell → root.txt
```

## Key Takeaways
- Verify you're on the correct HTB VPN before troubleshooting
- Always test sequential IDs in URLs (IDOR)
- FTP sends credentials in plaintext — use SFTP/SCP instead
- Password reuse is dangerous — use unique passwords per service
- Linux capabilities can be as dangerous as SUID — always enumerate them