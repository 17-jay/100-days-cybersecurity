# Day 08: SOC Drill – Basics Test #1



## 📌 Part A – Multiple Choice (10 Questions)

**Q1.** Which protocol translates IP addresses to MAC addresses?  
- a) DNS  
- b) ARP 
- c) DHCP  
- d) ICMP  
# my answer was b - correct

**Q2.** What’s the default SSH port?  
- a) 21  
- b) 22   
- c) 25  
- d) 80  
# my answer was b - correct

**Q3.** Which step comes **first** in the Incident Response lifecycle?  
- a) Containment  
- b) Preparation   
- c) Eradication  
- d) Recovery  
# my answer was a - incorrect
- answer was b. Reason - People often pick Containment first because they think of the lifecycle as starting when the attack begins. But in reality, the lifecycle starts much earlier — with Preparation.

**Q4.** A user reports slowness. You check network logs and see multiple connections from the same external IP in a short period. Which attack does this suggest?  
- a) Phishing  
- b) Brute Force   
- c) DoS/DDoS  
- d) SQL Injection  
# my answer was c - correct

**Q5.** In Linux, which command shows active network sockets and connections?  
- a) ps  
- b) netstat / ss  
- c) ls -la  
- d) top  
# my answer was b - correct

**Q6.** What’s the function of DHCP?  
- a) Resolves domain names  
- b) Assigns IP addresses dynamically   
- c) Encrypts data packets  
- d) Forwards web traffic  
# my answer was b - correct

**Q7.** Which log file on a Linux system typically records authentication attempts?  
- a) /var/log/messages  
- b) /var/log/auth.log   
- c) /etc/passwd  
- d) /etc/shadow  
# my correct answer was b

**Q8.** If your IDS detects a malicious connection, what’s the Blue Team’s **next step**?  
- a) Ignore and continue  
- b) Preparation  
- c) Containment   
- d) Malware development  
# my answer was c - correct

**Q9.** What is the default gateway in networking?  
- a) The first usable IP address in the subnet  
- b) The router’s IP used to access external networks   
- c) The host’s broadcast address  
- d) The DNS server  
# my answer was b - correct

**Q10.** Which tool is commonly used for packet capture and traffic analysis?  
- a) Wireshark   
- b) Netcat  
- c) Nmap  
- d) Ping  
# a - correct



## 📌 Part B – Hands-On Log Analysis (30 min)

You are provided the following snippet from `/var/log/auth.log`:

```log
Sep 30 09:15:23 ubuntu sshd[1024]: Failed password for invalid user admin from 185.232.67.89 port 54872 ssh2
Sep 30 09:15:26 ubuntu sshd[1024]: Failed password for invalid user admin from 185.232.67.89 port 54872 ssh2
Sep 30 09:15:30 ubuntu sshd[1024]: Accepted password for tryhackme from 10.10.137.96 port 54890 ssh2
Sep 30 09:15:45 ubuntu sshd[1024]: Failed password for invalid user root from 185.232.67.89 port 54872 ssh2

Identify the attacker’s IP.
185.232.67.89
Count the number of failed login attempts.
3
Which account was successfully logged in?
10.10.137.96
Suggest one containment step to stop this attack.
- the most effective way is to block this specific IP address. Use a firewall rule.
Run a Linux command to check all active SSH sessions. Document the command here
- w 
- this command shows users,their IPs, login time, and what they're doing
