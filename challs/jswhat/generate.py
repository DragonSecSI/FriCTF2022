import random as r

MAGIC = 32

s_box = [i for i in range(0x100)]
r.shuffle(s_box)
reverse_s_box = [s_box.index(i) for i in range(0x100)]

def encode(pt: str) -> str:
    pt = pt.encode()
    ct = []
    for i in range(len(pt)):
        ct.append(s_box[(s_box[pt[i]] - i + MAGIC) & 0xFF])
    return bytes(ct).hex(':')

def decode(ct: str) -> str:
    ct = bytes.fromhex(''.join(ct.split(':')))
    pt = []
    for i in range(len(ct)):
        pt.append(reverse_s_box[(reverse_s_box[ct[i]] + i - MAGIC) & 0xFF])
    return bytes(pt).decode()

def main():
    flag = open("flag.txt").read()
    print(f"Flag: {flag}")
    print(f"S BOX: {s_box}")
    print(f"Reverse S BOX: {reverse_s_box}")

    ct = encode(flag)
    print(f"Encoded: {ct}")
    pt = decode(ct)
    print(f"Decoded: {pt}")

if __name__ == "__main__":
    main()