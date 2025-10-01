# Day 09 – TryHackMe Lab: Linux Fundamentals Part 3

Theme: File Transfers, Processes, Services, and Automation



## 📝 Terminal Text Editors

- **nano**
  - Command: `nano filename`
  - Simple and beginner-friendly text editor inside the terminal.
  - Basic shortcuts at the bottom of the screen (e.g., `Ctrl+O` to save, `Ctrl+X` to exit).

- **vim**
  - Command: `vim filename`
  - More powerful editor; steeper learning curve.
  - Two main modes:
    - **Insert mode** – press `i` to type text.
    - **Normal mode** – default; used for navigation and commands.
  - Save and exit: `:wq`  
  - Exit without saving: `:q!`



## Downloading Files

- **wget**
  - Command: `wget <url>`
  - Downloads a file from a web server.
  - Example in the commands.sh file

---

## Transferring Files (SCP)

- **scp** (Secure Copy Protocol)  
  - Allows file transfer between two computers using SSH.  
  - Data is **encrypted** and requires valid **username + password (or key)** on both devices.

**Examples from lab in the commands.sh file**


## Porcesses 101 
- This was basically to teach me about commands that give certain info about processes as shown in the .sh file
- top command
Interactive, real-time view of processes.
Displays CPU, memory usage, and more.


# Serving files
updog - Lightweight Python-based tool for quick file transfers over HTTP


**COMMANDS.SH**