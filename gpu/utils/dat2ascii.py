#! python3
import binascii, sys

command, filename = sys.argv

a = open(file=filename, mode="rb")
i = 0 
b = ""
data = binascii.b2a_hex(a.read());
for c in data:
	i += 1
	b += chr(c)
	if i is 6:
		print(b)
		i = 0
		b = ""
