FLAG = open("flag.txt").read()
SHIFT = 4
MAGIC = 5

def encrypt(pt: bytes) -> bytes:
    ct = []
    for c in pt:
        ct.append(( (((c >> SHIFT) + MAGIC) & 0x0F) | (((c << SHIFT) + MAGIC) & 0xF0) ) & 0xFF )
    return bytes(ct)

def decrypt(ct: bytes) -> bytes:
    pt = []
    for c in ct:
        pt.append( ((((c - MAGIC) & 0x0F) << SHIFT) | (((c - MAGIC) & 0xF0) >> SHIFT)) & 0xFF )
    return bytes(pt)

def to_c_byte_array(x: bytes) -> str:
    return "{ 0x" + x.hex(',').replace(',', ', 0x') + " }"

def main():
    print("Flag:", FLAG)
    ct = encrypt(FLAG.encode())
    print("Encrypted:", ct.hex())
    print("C byte array:", to_c_byte_array(ct))
    print("Decrypted:", decrypt(ct).decode())

if __name__ == "__main__":
    main()
