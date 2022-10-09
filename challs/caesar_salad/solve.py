import string
import re

def read_ciphertext(file):
    with open(file, "r") as f:
        return "".join(f.readlines()).strip()

def decrypt_caesar(ciphertext, key):
    alphabet = string.ascii_lowercase
    plaintext = ""
    n = ord(key) - ord('A')
    print(n)

    for c in ciphertext:
        if c.lower() in alphabet:
            new_char = alphabet[alphabet.index(c.lower()) - n]
            if c.isupper():
                plaintext += new_char.upper()
            else:
                plaintext += new_char
        else:
            plaintext += c

    return plaintext

def find_flag(text):
    return re.findall("frictf{.*}", text)[0]

if __name__ == '__main__':
    ct = read_ciphertext("chall/data.txt")
    text = decrypt_caesar(ct, 'H')
    print(find_flag(text))