# Day 19 – HTB: Fawn (FTP)

## Objective
Learn how to enumerate an FTP server, identify anonymous login, and retrieve files from the server.

---

# What is FTP?

FTP (File Transfer Protocol) is a network protocol used to transfer files between a client and a server over TCP.

Default Ports:
- TCP 21 – Control Channel
- TCP 20 – Data Transfer (Active Mode)

Unlike SSH, FTP does **not encrypt** usernames, passwords, or transferred files, making it insecure over public networks.

---

# Anonymous FTP Login

Some FTP servers allow users to log in using the username:

```
anonymous
```

without requiring a personal account.

While useful for public file sharing, anonymous access can expose sensitive files if not configured properly.

---

# What I Learned

During enumeration, I discovered an FTP service running on the target machine.

The server allowed anonymous authentication, giving access to its files without valid credentials.

After browsing the available files, I located and downloaded the flag, successfully completing the challenge.

---

# Security Lessons

- Always enumerate every exposed service.
- Anonymous FTP is a common security misconfiguration.
- FTP sends data in plaintext and should be replaced with SFTP or FTPS.
- Misconfigured services can expose sensitive information without requiring exploitation.

---

# Key Takeaways

- Identifying open services is the first step in any assessment.
- FTP uses TCP port **21**.
- Anonymous login should only be enabled when absolutely necessary.
- Proper service configuration is just as important as patching vulnerabilities.

---

# Skills Gained

- FTP Enumeration
- Anonymous Authentication
- Remote File Discovery
- Information Disclosure Awareness
- Understanding Legacy Network Protocols