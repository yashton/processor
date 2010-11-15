#! /usr/bin/python3
import sys, re
from asmyacc import parser
from asmlex import symbol_table
import getopt

# argument parsing
def usage():
	print("Usage:\t./asm.py [OPTION...] FILE [OUTPUT]\n")
	print("\tOUTPUT file defaults to 'a.out'\n")
	print("\t-h, --help\t\tprint this message")
	print("\t-s, --summary\t\tprint assembly summary")
	print("\t-i\t\t\tprint the instructions generated during parse")
	print("\t-d, --dump\t\tprint an object dump")
	print("\t-p, --pad[=SIZE]\tpad output file to given SIZE with zeroes")
	print("\t\t\t\tif no flag given, defaults to no padding")
	print("\t\t\t\tif flag given without SIZE, defaults to 8192")

summary = False
recall = False
dump = False
padTo = None
outfile = 'a.out'

try:
	opts, args = getopt.gnu_getopt(sys.argv[1:], "shpdi", ["summary", "help", "pad=", "dump"])
	if len(args) == 2:
		filename, outfile = args
	elif len(args) == 1:
		filename = args[0]
	else:
		usage()
		sys.exit(2)
		
	for opt, arg in opts:
		if opt in ("-s", "--summary"):
			summary = True
		elif opt in ("-h", "--help"):
			usage()
			sys.exit()
		elif opt in ("-p", "--pad"):
			if len(arg) is 0:
				padTo = 8192
			else:
				padTo = int(arg)
		elif opt in ("-d", "--dump"):
			dump = True
		elif opt == "-i":
			recall = True

except getopt.GetoptError:
	usage()
	sys.exit(2)
	
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
		
		data += '\n'
	else:
		data += line

# run the parser
result = parser.parse(data)
if result is not None:	
	# write out the encoded value of all the instructions
	size = 0
	b = open(file=outfile, mode="w")
	for instr in result:
		size += instr.size
		b.write(instr.encode(symbol_table))
		b.write("\n")
	if padTo is not None:
		b.write("0000\n"*(padTo - size))

	# Print out information for the user.
	if summary or recall or dump:
			
		if dump or recall:
			print("MACRO\tVALUE")
			for macro, value in macros.items():
				print(macro + "\t" + value)
			print()
			print("SYMBOL\tLOCATION")
			keys = list(symbol_table.keys())
			keys.sort()
			for symbol in keys:
				print(symbol + "\t" + hex(symbol_table[symbol]))
			print()
			print("LABEL\tADDR\tENCODE\tINSTR")
			mapped = dict(zip(symbol_table.values(), symbol_table.keys()))
		
		size = 0
		count = 0
		for instr in result:
			if recall:
				print(instr.recall())
			
			if dump:
				if instr.size > 1:
					i = instr.encode(symbol_table).replace("\n", "\n\t\t")
					i = i.replace("\n", "\t" + instr.recall() + "\n", 1)
				else:
					i = instr.encode(symbol_table) + "\t" + instr.recall()
				
				if size in mapped:
					j = mapped[size] + ":"
				else:
					j = ""
					
				print(j + "\t" + hex(size) + "\t" + i)
				
			count += 1
			size += instr.size
			
		if dump:
			print()
		print("Found", count, "instructions")
		print("Generated", size, "words.")
		
