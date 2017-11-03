import re
import random

f=open('phys2.txt','rU')
data=f.read()

TOKEN_RE=re.compile(r"""[a-zA-Z0-9']+|[^a-zA-Z0-9' \n]""")
words=TOKEN_RE.findall(data)
lm={}
for w1, w2, w3 in zip(words, words[1:], words[2:]):
    prev = w1 + " " + w2
    if prev in lm:
        lm[prev].append(w3)
    else:
        lm[prev]=[w3]

w1='My'
w2='freshman'
prev=w1+' '+w2
w3=random.choice(lm[prev])
print w1, w2,
while 1==1:
    print w3,
    w1, w2 = w2, w3
    prev=w1+' '+w2
    if prev in lm:
        w3=random.choice(lm[prev])
    else:
        break
