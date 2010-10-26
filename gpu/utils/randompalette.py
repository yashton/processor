#! /usr/bin/python3
import random

for i in range(0,256):
	r = hex(random.randint(0,255))[2:]
	g = hex(random.randint(0,255))[2:]
	b = hex(random.randint(0,255))[2:]
	print("0"*(2 - len(r)) + r + "0"*(2 - len(g)) + g + "0"*(2 - len(b)) + b)
