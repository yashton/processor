#! python3
import binascii, sys

command, imageFile, paletteFile = sys.argv

data = open(imageFile).read()
palette = open(paletteFile)
i = 0
for color in palette:
	data = data.replace(color.rstrip().lstrip(), hex(i)[2:])
	i += 1

a = ""
i = 0	
for pixel in data.split("\n"):
	a = pixel + a
	i += 1
	if i is 4:
		print(a)
		a = ""
		i = 0
