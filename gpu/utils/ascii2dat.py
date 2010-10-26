#! python3
import binascii, sys

command, inname, outname = sys.argv

a = open(inname)
b = open(file=outname, mode="wb")
for c in a:
	d = c.lstrip().rstrip()
	b.write(binascii.a2b_hex(d))
b.flush	
