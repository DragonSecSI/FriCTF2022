from Crypto.Util.number import long_to_bytes

n = 242199720495666527165881188675283821871
e = 65537
ct = 73306157297843268944121379986888004841

# factor n
# https://www.alpertron.com.ar/ECM.HTM

p = 13545049207930537447
q = 17881051355196271993

phi = (p-1) * (q-1)
d = pow(e, -1, phi)
pt = pow(ct, d, n)

print(long_to_bytes(pt))