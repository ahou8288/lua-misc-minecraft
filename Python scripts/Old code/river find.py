import re
import urllib

url = 'http://www.kayakcanberra.com/heights/'
html = urllib.urlopen(url).read()
#print html
matches = re.findall("<a href='../rivers/[^']*'>", html)
#print matches
for i in matches:
    river=re.findall('/[^\./]*\.', i)
    print river
