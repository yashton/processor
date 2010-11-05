#! python3

import re, sys

def immed_to_int(immed):
	if immed[0:2].lower() == "0x":
		return int(immed, 16)
	else:
		return int(immed, 10)

def encode_rtype(oper, dst, src, label=None):
	print("parsed r-type.\tlabel:", label, "\toper:", oper, "\tdst:", dst, "\tsrc", src)

def encode_itype(oper, dst, immed, label=None):
	print("parsed i-type.\tlabel:", label, "\toper:", oper, "\tdst:", dst, "\timmed:", immed)

def encode_bcond(cond, target, label=None):
	print("parsed bcond.\tlabel:", label, "\tcond", cond, "\ttarget:", target)

def encode_jcond(cond, target, label=None):
	print("parsed jcond.\tlabel:", label, "\tcond:", cond, "\ttarget:", target)

def encode_scond(cond, dst, label=None):
	print("parsed scond.\tlabel:", label, "\tcond:", cond, "\tdst:", dst)
	
def encode_not(dst, label=None):
	print("parsed not.\tlabel:", label, "\tdst:", dst)

def label_add(label, instr_count):
	if label is not None:
		print("added label:", label, "to symbol table for instruction:", instr_count)

c_name = r"[a-zA-Z][_a-zA-Z0-9]*"
label_re = r"(?:(" + c_name + ")\:\s+)?"
reg_re = r"\$([0-9]|1[0-5]|t[0-3]|s[0-3]|a[0-3]|v[0-1]|sp|fp|ra|)"
comment_re = r"(#.*)?"
immed_re = r"(-?0[xX][a-fA-F0-9]{1,2}|-?[0-9]{1,3}|c_name)"
rtype_re = r"(and|or|xor|add|addu|addc|sub|subc|cmp|mov|mul|test|jal|lsh|ashu)"
itype_re = r"(andi|ori|xori|addi|addui|addci|subi|subci|cmpi|movi|muli|lui|lshi|ashui)"
cond_re = r"(eq|ne|ge|cs|cc|hi|ls|lo|hs|gt|le|fs|fc|lt|uc)"

# instruction encoding
rtype = re.compile(r"^\s*" + label_re + rtype_re + r"\s+" + reg_re + r",\s*" + reg_re + r"\s*" + comment_re + r"$")
itype = re.compile(r"^\s*" + label_re + itype_re + r"\s+" + reg_re + r",\s*" + immed_re + r"\s*" + comment_re + r"$")
bcond = re.compile(r"^\s*" + label_re + r"b" + cond_re + r"\s+(" + c_name + r")\s*" + comment_re + r"$")
js_cond = re.compile(r"^\s*" + label_re + r"(j|s)" + cond_re + r"\s+" + reg_re + r"\s*" + comment_re + r"$")
not_op = re.compile(r"^\s*" + label_re + r"not\s+" + reg_re + r"\s*" + comment_re + r"$")

# assembler macros and other parsing
ignore = re.compile(r"^\s*" + comment_re + r"$")
define = re.compile(r"^\s*\.define\s+(" + c_name + r")\s+(.*)\s*" + comment_re + r"$")
#data = re.compile(r"^\s*\.data\s*$")
#text = re.compile(r"^\s*\.text\s*$")
#data_asciiz = re.compile(r"^\s*(" + c_name + r"):\s+\.asciiz\s+" + "(\".*\")" + "\s*" + comment_re + "$")
#data_byte = re.compile(r"^\s*(" + c_name + r"):\s+\.byte\s+" + "\"(.*)\"" + "\s*" + comment_re + "$")
#data_word = re.compile(r"^\s*(" + c_name + r"):\s+\.word\s+" + "\"(.*)\"" + "\s*" + comment_re + "$")

command, filename = sys.argv
line_number = 0
instr_count = 0
macros = dict()
for line in open(filename):
	line_number += 1
	for (macro, value) in macros.items():
		line = line.replace(macro, value)
	a = ignore.match(line)
	b = define.match(line)
	c = rtype.match(line)
	d = itype.match(line)
	e = bcond.match(line)
	f = js_cond.match(line)
	g = js_cond.match(line)	
	
	if a is not None:
		pass
	elif b is not None:
		macro, value, cmt = b.groups() 
		macros[macro] = value
	elif c is not None:
		lbl, op, dst, src, cmt = c.groups()
		encode_rtype(op, dst, src, lbl)
		label_add(lbl, instr_count)
		instr_count += 1
	elif d is not None:
		lbl, op, dst, imm, cmt = d.groups()
		encode_itype(op, dst, imm, lbl)
		label_add(lbl, instr_count)
		instr_count += 1
	elif e is not None:
		lbl, cond, target, cmt = e.groups()
		encode_bcond(cond, target, lbl)
		label_add(lbl, instr_count)
		instr_count += 1
	elif f is not None:
		lbl, op, cond, dst, cmt = f.groups()
		if op == "s":
			encode_scond(cond, dst, lbl)
		elif op == "j":
			encode_jcond(cond, dst, lbl)
		else:
			print("Line", line_number, "failed to parse: \"" + line.lstrip().rstrip() + "\"")
			label_add(lbl, instr_count)
			instr_count += 1
	elif g is not None:
		lbl, dst, cmt = f.groups()
		encode_not(dst, lbl)
		label_add(lbl, instr_count)
		instr_count += 1
	else:
		print("Line", line_number, "failed to parse: \"" + line.lstrip().rstrip() + "\"");
		exit()
