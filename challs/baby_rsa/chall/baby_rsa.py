from Crypto.Util.number import getPrime, bytes_to_long
from secret import FLAG

# pip install pycryptodome

pt = bytes_to_long(FLAG)
e = 65537

p = getPrime(64)
q = getPrime(64)

n = p * q

ct = pow(pt, e, n)

print(f"n = {n}")
print(f"e = {e}")
print(f"ct = {ct}")