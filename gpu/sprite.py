#! /usr/bin/python3
import random
for i in range(0,256):
	a = hex(random.randint(-100,714))[2:]
	b = hex(random.randint(-100,510))[2:]
	c = hex(random.randint(0,2**6) << 9)[2:]
	d = hex(random.randint(0,2**13) << 2)[2:]
	print('0'*(4-len(a)) + a)
	print('0'*(4-len(b)) + b)
	print('0'*(4-len(c)) + c)
	print('0'*(4-len(d)) + d)
	
