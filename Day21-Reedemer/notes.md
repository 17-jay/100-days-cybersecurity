# Day 21 – HTB: Redeemer (Redis)

## Objective
Learn how to identify and interact with a Redis database exposed on a remote host.

## What I Learned

- **Redis** is an in-memory database commonly used for storing key-value data.
- Redis commonly runs on **TCP port 6379**.
- Used network enumeration to identify the Redis service.
- Connected to the Redis server using the Redis CLI.
- Enumerated the available Redis information and databases.
- Discovered the flag stored within the Redis database.

## Security Lessons

- Exposing databases directly to a network can create a serious security risk.
- Databases should require strong authentication and appropriate access controls.
- Services should not be exposed unnecessarily to untrusted networks.
- Enumeration helps identify vulnerable or misconfigured services.

## Key Takeaway

> **An exposed database is an attack surface. Always identify what is running, determine how it is configured, and verify whether unauthorized access is possible.**

## Skills Gained

- Network Enumeration
- Redis Enumeration
- Database Interaction
- Service Identification
- Misconfiguration Awareness