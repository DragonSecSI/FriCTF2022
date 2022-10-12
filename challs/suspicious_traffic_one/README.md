# Suspicious traffic 1 

## Description
When you open `.pcap` there is a lot of traffic inside, pings , nmap scan and other bullshit. But we can apply filter to obtain only http data where we can see partial flag in username and password. 

## Solution

```bash
strings traffic.pcap | grep email 
```

Intended is to solve with wireshark.
