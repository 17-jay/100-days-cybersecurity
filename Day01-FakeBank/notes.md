#Day 01 - TryHackMe Lab: FakeBank

##Task Overview
Explored a simulated vulnerable banking web app using directory brute forcing.

##Tools used
- **dirb**: a command-line tool for brute-forcing web server directories/files.

##Steps
1. Ran `dirb` against the FakeBank URL provided by TryHackMe:
   bash command
   dirb <fakebank-url>
    - This scans the web server for common hidden directories and files.
2. Discovered hidden endpoints
    - The scan revealed several accessible URLs, including an /admin panel.
3. Exploited the Admin panel
    - Accessed the /admin page and successfully manipulated account balances by adding $2000 to the test account.


What I learnt
- Directory brute forcing is an essential reconnaissance technique for uncovering hidden or unlinked resources.

- Sensitive pages like admin panels, must be secured through proper authentication, obscurity alone is NOT protection.

- Even basic tools like dirb highlight how misconfigurations can lead to critical security flaws.