import base64

with open("chall/data.txt", "r") as f:
    b64 = f.readlines()[0].strip()
    flag = base64.b64decode(b64)
    print(flag)
