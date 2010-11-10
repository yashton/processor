#! /usr/bin/python3
import sys, re
from asmyacc import parser
from asmlex import symbol_table

# argument parsing
if len(sys.argv) == 3:
	command, filename, outfile = sys.argv
elif len(sys.argv) == 2:
	command, filename = sys.argv
	outfile = 'a.out'
else:
	print("Usage:\t./asm.py input [output]\noutput defaults to 'a.out'")
	exit()
	
# macro preprocessing
data = str()
macros = dict()
define = re.compile(r'^\s*\.define\s+([a-zA-Z][_a-zA-Z0-9]*)\s+(.+)\s*(?:#.*)?$')
for line in open(filename):
	# for every macro currently defined, replace the macro with the value
	for (macro, value) in macros.items():
		line = line.replace(macro, value)
	b = define.match(line)
	if b is not None:
		# add new macros found by the preprocessor
		macro, value = b.groups() 
		macros[macro] = value
#		print("Found macro:", macro, "->", value)
		data += '\n'
	else:
		data += line
#print(data)

# run the parser
result = parser.parse(data)
#print(symbol_table)
if result is not None:
	# print out the encoded value of all the instructions
	b = open(file=outfile, mode="w")
	for instr in result:
		b.write(instr.encode(symbol_table))
		b.write("\n")
