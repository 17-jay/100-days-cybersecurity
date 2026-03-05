# Day 14 HTB Challenge: Ether Tag

# EtherNet/IP is an industrial networking standard used in Operational Technology (OT) and Industrial Control Systems (ICS). # It runs the Common Industrial Protocol (CIP) over standard TCP/IP and is widely used in PLCs (Programmable Logic Controllers), factory automation, and SCADA systems.



## Solution
1. Downloaded abd Connected to the vpn(the TCP one)
2. created and activated a virtual environment
3. used pip to install cpppo which was critical for this challenge
4. Connect and read flag: the Output was:
- FLAG[0][  0-0  ]+  0 == [72]: 'OK'
- The value 72 is ASCII for H — the start of HTB{...}. This confirmed the flag is stored as an array of ASCII integers.
5. dump full tag tray

## FLAG[0][  0-50 ]+ 0 == [72, 84, 66, 123, 51, 116, 104, 51, 114, 110, 51, 116, 49, 112, 95, 112, 119, 110, 51, 100, 125, 0, 0, ...]: 'OK'

6. Decode ASCII to String
DEC Char
72  H
84  T
66  B
123 {
51  3
116 T
.......

- and onwards till the last value to give us the flag - HTB{3th3rn3t1p_pwn3d}



Takeaways
- EtherNet/IP / CIP is commonly found exposed on OT networks and is a real-world attack surface in ICS penetration testing.
cpppo is a powerful Python tool for interacting with EtherNet/IP devices — useful for both CTFs and real engagements.
- Tags in CIP are named variables — if a controller is exposed without authentication, an attacker can read and write process data freely.
- Always check non-standard ports — the default EtherNet/IP port is 44818, but deployments (and CTF challenges) may use custom ports.
- Data stored in PLC tags can be raw integers, strings, or arrays — knowing how to interpret them (e.g., ASCII decoding) is key.