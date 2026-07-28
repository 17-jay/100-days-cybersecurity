# Day 20 – HTB: Dancing (SMB Enumeration)

## Objective

Learn how to enumerate SMB shares, access misconfigured network resources, and retrieve files from a remote machine.

---

# What is SMB?

SMB (Server Message Block) is a network protocol used to share files, printers, and other resources between computers on a network.

**Default Port:**
- TCP 445

---

# SMB Shares

SMB shares are folders or resources that can be accessed remotely over a network.

Common shares include:
- **ADMIN$** – Administrative share
- **C$** – System drive administrative share
- **IPC$** – Inter-process communication
- **WorkShares** – Custom shared folder

---

# What I Learned

- Enumerated SMB shares running on TCP port **445**.
- Administrative shares required authentication and denied access.
- The **WorkShares** share allowed access due to a misconfiguration.
- Navigated the share, located the `flag.txt` file, and downloaded it successfully. :contentReference[oaicite:0]{index=0}

---

# SMB Authentication

One important concept I learned is that **SMB always requires a username during authentication**.

If a username is **not specified** when using `smbclient`, it automatically uses the username of the account currently logged into your local machine (e.g., your Kali Linux user). This behavior prevents the SMB protocol from throwing an authentication error, since a username must always be supplied. :contentReference[oaicite:1]{index=1}

---

# Security Lessons

- Always enumerate SMB shares during an assessment.
- Misconfigured SMB permissions can expose sensitive files.
- Administrative shares should only be accessible to authorized users.
- Follow the **Principle of Least Privilege** when configuring network shares.

---

# Key Takeaways

- SMB is Microsoft's file-sharing protocol.
- SMB commonly runs on **TCP port 445**.
- Enumeration should always precede exploitation.
- Understanding SMB authentication helps explain how remote connections are established.
- Poorly configured SMB shares can lead to information disclosure.

---

# Skills Gained

- SMB Enumeration
- Share Discovery
- SMB Authentication
- Remote File Navigation
- File Retrieval
- Identifying SMB Misconfigurations