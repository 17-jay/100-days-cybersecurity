# Day 17 - HTB Machine: FACTS 🐧

## Overview
FACTS is a Linux machine on Hack The Box covering several key concepts:
1. **Privilege Escalation via CVE-2025-2304** - Role smuggling in Camaleon CMS
2. **S3/MinIO bucket enumeration** - Stealing credentials from cloud storage
3. **SSH key cracking** - Breaking passphrase-protected keys
4. **Facter sudo abuse** - Ruby code execution as root





## Concepts Learned

### 1. Camaleon CMS
A Ruby on Rails based CMS. Identifiable from asset paths in page source:
`/assets/themes/camaleon_first/assets/...`

Always check the CMS name and version — search for known CVEs immediately.

### 2. CVE-2025-2304 — Privilege Escalation (Role Smuggling)
A mass assignment vulnerability in Camaleon CMS where a regular user can
escalate their role from `client` to `admin` by injecting a `role` parameter
into the `updated_ajax` endpoint. No admin credentials needed — just register
a normal account and run the exploit.

### 3. MinIO — S3-Compatible Object Storage
MinIO is an open source S3-compatible storage server. It was running on port
**54321**. After gaining admin access to the CMS, S3 credentials were found
in the CMS settings panel. These credentials were used to enumerate and
download files from internal storage buckets — including an SSH private key.

### 4. AWS CLI with Custom Endpoints
The standard AWS CLI tool can talk to non-AWS S3-compatible storage like
MinIO by using the `--endpoint-url` flag. This is a very common pattern in
real-world environments where companies self-host S3-compatible storage.

### 5. SSH Key Cracking with John the Ripper
SSH private keys can be protected with a passphrase. The `ssh2john.py` script
converts the key into a hash format that John the Ripper can crack using a
wordlist like rockyou.txt.

**Passphrase found:** `dragonballz`

### 6. Facter — Sudo Privilege Escalation
Facter is a system inventory tool written in Ruby, used by Puppet. It supports
custom facts written in Ruby. When a user can run facter as root via sudo, they
can use the `--custom-dir` flag to load a malicious Ruby fact that executes
arbitrary commands as root.

**Key flag:** `--custom-dir` tells facter exactly where to load custom facts from,
bypassing the default directory issue when sudo changes the home directory context.

---

## Attack Chain
```
Nmap → ports 22, 80, 54321
  → Web app (Camaleon CMS) → Register account (client role)
  → CVE-2025-2304 → Escalate to admin role
  → CMS Settings → Steal MinIO S3 credentials
  → AWS CLI → Enumerate internal bucket → Download SSH private key
  → ssh2john + John the Ripper → Crack passphrase (dragonballz)
  → SSH as trivia → User flag (/home/william/user.txt)
  → sudo -l → facter NOPASSWD
  → facter --custom-dir + malicious Ruby fact → Root flag
```

## Key Takeaways
- Always register an account on web apps before assuming you need to brute force
- Check CMS admin panels for stored credentials (S3, API keys, DB passwords)
- MinIO/S3 storage can contain sensitive files — always enumerate buckets
- SSH keys with passphrases can often be cracked with rockyou.txt
- When sudo privesc isn't working, read the tool's help flags carefully
- `--custom-dir` was the key to making facter load our malicious Ruby fact