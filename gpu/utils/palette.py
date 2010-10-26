#! python2
import sys
from PIL import Image, ImagePalette

command, filename = sys.argv

def chunk(seq, size):
	return [seq[i:i+size] for i in range(0, len(seq), size)]
	
a = Image.open(filename)
palette = a.getpalette()
colours = [map(hex, bytes) for bytes in chunk(palette,3)]

for i in range(0, 16):
	r, g, b = colours[i]
	r = r[2:]
	g = g[2:]
	b = b[2:]
	print '0'*(2 - len(r)) + r + '0'*(2 - len(g)) + g + '0'*(2 - len(b)) + b
