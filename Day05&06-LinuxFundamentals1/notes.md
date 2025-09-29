# Day 05 – TryHackMe Lab: Linux Fundamentals Part 1

## Objective
Learn the basics of navigating and managing a Linux system, focusing on the file system, permissions, and essential commands.

## Key Topics

### What is Linux?
- Linux is an open-source, Unix-like operating system.
- Commonly used for servers, cybersecurity labs, and penetration testing.

### The Linux File System
- Hierarchical structure starting at the **root directory** `/`.


### Permissions
- Every file has permissions for:
  - **Owner**, **Group**, and **Others**.

- Example: `-rw-r--r--` means:
  - Owner: read/write, Group: read, Others: read.
- Change permissions:
  - `chmod 755 <file>` → Owner (rwx), Group (rx), Others (rx).


  More is explained on line **143** of commands.sh





## Key Takeaways
- The Linux file system is structured and predictable.
- Core commands (`pwd`, `ls`, `cd`, `touch`, `mkdir`, `chmod`) are essential for daily use.
- Permissions are crucial for security and proper system function.
- Root access (`sudo`) must be used carefully to avoid breaking the system.


