# Day 03 – TryHackMe Lab: Introduction to the Internet

## Objective
Understand how the Internet works, the role of ISPs, and the protocols enabling global communication.

## Key Topics
- **The Internet**
  - A worldwide network of interconnected networks.
  - Uses the TCP/IP protocol suite for communication.

- **How LAN connects to the Internet**
  - Home/office LAN → Router → Internet Service Provider (ISP) → Global Internet.

- **Public vs Private IP Addresses**
  - **Private IPs** – Used inside LANs, not routable on the Internet.
  - **Public IPs** – Provided by ISPs, globally unique, routable on the Internet.

- **NAT (Network Address Translation)**
  - Allows multiple devices in a LAN to share one public IP.
  - Router translates private IPs to the public IP.

- **DNS (Domain Name System)**
  - Converts human-readable domain names (e.g., `tryhackme.com`) into IP addresses.

- **Protocols**
- **HTTP**
  - TCP 80 → Normal websites

- **HTTPS**
  - TCP 443 → Secure websites

- **SMTP**
  - TCP 25 → Mail server ↔ Mail server
  - TCP 587 → Email client ↔ Mail server
  - TCP 465 → Older secure email (still in use)

- **FTP**
  - TCP 21 → Commands (control)
  - TCP 20 → File transfers (active mode)
  - Random high ports (1024–65535, or admin-set) → File transfers (passive mode)

- **ICMP**
  - No port numbers → Used for ping / traceroute


## What I Learnt
- The Internet is essentially a "network of networks."
- ISPs provide the bridge between private LANs and the global Internet.
- NAT and DNS are essential services enabling scalable and user-friendly communication.
