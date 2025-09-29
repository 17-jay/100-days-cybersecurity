# Day 04 – TryHackMe Lab: Introduction to LAN

## Objective
Understand the basic components of a Local Area Network (LAN), how devices communicate, common topologies, and key addressing concepts.

## Key Topics

### LAN Definition
- A LAN (Local Area Network) connects devices within a limited area (e.g., home, office, campus).
- Provides high-speed communication and resource sharing between devices.

### Network Topologies
- **Star Topology**
  - All devices connect to a central device (usually a switch or hub).
  - Easy to manage and isolate problems (if one device fails, others keep working).
  - Central device is a single point of failure.

- **Bus Topology**
  - All devices share a single communication line (a backbone cable).
  - Simple and cost-effective for small networks.
  - If the backbone fails, the entire network goes down. Collisions are common.

- **Ring (Token Ring) Topology**
  - Devices are connected in a circular path.
  - Data passes from one device to the next until it reaches its destination.
  - Token system prevents collisions, but a single break in the ring can disrupt the entire network.

**Quick differentiation**:  
Star = central hub, Bus = shared backbone, Ring = circular path with tokens.

### Addressing in a LAN
- **Network Address**
  - Identifies the entire network segment.
  - Example: In `192.168.1.0/24`, the network address is `192.168.1.0`.

- **Host Address**
  - Assigned to each device (host) in the network.
  - Must be unique within the network.
  - Example: `192.168.1.25` in the `192.168.1.0/24` network.

- **Default Gateway**
  - The device (usually a router) that connects the LAN to external networks (like the Internet).
  - Acts as the “exit door” for traffic going outside the LAN.
  - Example: `192.168.1.1` is commonly the default gateway in home networks.

### MAC Addressing
- Each network card has a unique **MAC address** (physical identifier).
- Switches use MAC addresses to forward traffic within the LAN.

### ARP (Address Resolution Protocol)
- Allows devices to map an **IP address** to a **MAC address**.
- **ARP Request**: A broadcast message sent to all devices asking “Who has this IP?”  
- **ARP Reply**: The device with that IP responds with its MAC address, enabling direct communication.

### DHCP (Dynamic Host Configuration Protocol)
- Automatically assigns IP addresses and network configurations to devices.
- **DHCP Process**:
  1. **Discover** – Device broadcasts a request for an IP.  
  2. **Offer** – DHCP server responds with an available IP.  
  3. **Request** – Device requests to use the offered IP.  
  4. **Acknowledge** – Server confirms and finalizes the lease.

## DHCP vs ARP
- DHCP provides network configuration when a device joins a network, whereas ARP is used by devices to find the MAC address of a target device on the same local network to send data.

## What I Learnt
- LANs form the foundation of networking(internet).  
- Different topologies balance cost, speed, and reliability.  
- IP addressing distinguishes between the **network**, **host**, and **gateway**.  
- ARP enables devices to find each other on the LAN.  
- DHCP automates the process of assigning IP addresses, making networks scalable and manageable.  

