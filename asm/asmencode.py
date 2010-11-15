import math

cond_table = {
	'eq': '0',
	'ne': '1',
	'cs': '2',
	'cc': '3',
	'hi': '4',
	'ls': '5',
	'gt': '6',
	'le': '7',
	'fs': '8',
	'fc': '9',
	'lo': 'a',
	'hs': 'b',
	'lt': 'c',
	'ge': 'd',
	'uc': 'e'
	}
	
oper_table = {
	'register': '0',
	'andi': '1',
	'ori': '2',
	'xori': '3',
	'special': '4',
	'addi': '5',
	'addui': '6',
	'addci': '7',
	'shift': '8',
	'subi': '9',
	'subci': 'a',
	'cmpi': 'b',
	'bcond': 'c',
	'movi': 'd',
	'muli': 'e',
	'lui': 'f'
	}
	
func_table = {
	'and': '1',
	'or': '2',
	'xor': '3',
	'not': '4',
	'add': '5',
	'addu': '6',
	'addc': '7',
	'sub': '9',
	'subc': 'a',
	'cmp': 'b',
	'mov': 'd',
	'mul': 'e',
	'test': 'f'
	}
	
shift_table = {
	'lshi_l': '0',
	'lshi_r': '1',
	'ashui_l': '2',
	'ashui_r': '3',
	'lsh': '4',
	'ashu': '6'
	}
	
special_table = {
	'load': '0',
	'stor': '4',
	'jal': '8',
	'jcond': 'c',
	'scond': 'd'
	}
	
reg_table = {
	"$0": '0',
	"$1": '1',
	"$2": '2',
	"$3": '3',
	"$4": '4',
	"$5": '5',
	"$6": '6',
	"$7": '7',
	"$8": '8',
	"$9": '9',
	"$10": 'a',
	"$11": 'b',
	"$12": 'c',
	"$13": 'd',
	"$14": 'e',
	"$15": 'f',
	"$t0": '0',
	"$t1": '1',
	"$t2": '2',
	"$t3": '3',
	"$s0": '4',
	"$s1": '5',
	"$s2": '6',
	"$s3": '7',
	"$a0": '8',
	"$a1": '9',
	"$a2": 'a',
	"$v0": 'b',
	"$v1": 'c',
	"$sp": 'd',
	"$fp": 'e',
	"$ra": 'f'
	}
	
def hexstr(a, width):
	bytes = hex(a)[2:]
	return '0'*(width-len(bytes)) + bytes
	
class RType:
	size = 1
	def __init__(self, oper, dst, src):
		self.oper = oper
		self.dst = dst
		self.src = src
	def recall(self):
		return self.oper + "\t" + self.dst + ",\t" + self.src
	def encode(self, symbol_table):
		if self.oper == 'ashu' or self.oper == 'lsh':
			op = oper_table['shift']
			func = shift_table[self.oper]
		elif self.oper == 'jal' or self.oper == 'stor' or self.oper == 'load':
			op = oper_table['special']
			func = special_table[self.oper]
		else:
			op = oper_table['register']
			func = func_table[self.oper]
		
		dstR = reg_table[self.dst]
		srcR = reg_table[self.src]
		return op + dstR + func + srcR

class IType:
	size = 1
	def __init__(self, oper, dst, imm):
		self.oper = oper
		self.dst = dst
		self.imm = imm
	def recall(self):
		return self.oper + "\t" + self.dst + ",\t" + hex(self.imm)
	def encode(self, symbol_table):
		op = oper_table[self.oper]
		dst = reg_table[self.dst]
		imm = hexstr((self.imm & 0xFF), 2)
		return op + dst + imm
	
class ShiftImm(IType):
	size = 1
	def encode(self, symbol_table):
		op = oper_table['shift']
		dst = reg_table[self.dst]
		if self.imm >= 0:
			func = shift_table[self.oper + "_l"]
		else:
			func = shift_table[self.oper + "_r"]
			
		imm = hex(self.imm & 0xF)[2:]
		return op + dst + func + imm
		
class Bcond:
	size = 1
	def __init__(self, cond, current, label, line):
		self.cond = cond
		self.current = current
		self.label = label
		self.line = line
	def recall(self):
		return "b" + self.cond + "\t" + self.label
	def encode(self, symbol_table):
		op = oper_table['bcond']
		cond = cond_table[self.cond]
		
		if self.label not in symbol_table:
			raise Exception("Label " + self.label + " on line " + str(self.line) + \
					" does not exist in symbol table.")
		
		imm = symbol_table[self.label] - (self.current + 1)
		if not -128 <= imm < 128:
			raise Exception("Offset calculated for line " + str(self.line) + \
				" to label " + self.label + " is out of range. Rewrite branch as jump.")
		imm = hexstr((imm & 0xFF), 2)
		return op + cond + imm

class Jcond:
	size = 1
	def __init__(self, cond, target):
		self.cond = cond
		self.target = target
	def recall(self):
		return "j" + self.cond + "\t" + self.target
	def encode(self, symbol_table):
		op = oper_table['special']
		func = special_table['jcond']
		cond = cond_table[self.cond]
		reg = reg_table[self.target]
		return op + cond + func + reg

class Scond:
	size = 1
	def __init__(self, cond, dst):
		self.cond = cond
		self.dst = dst
	def recall(self):
		return "s" + self.cond + "\t" + self.dst
	def encode(self, symbol_table):
		op = oper_table['special']
		func = special_table['scond']
		cond = cond_table[self.cond]
		reg = reg_table[self.dst]
		return op + reg + func + cond
		
class Not:
	size = 1
	def __init__(self, dst):
		self.dst = dst
	def recall(self):
		return "not\t" + self.dst 
	def encode(self, symbol_table):
		op = oper_table['register']
		func = func_table['not']
		reg = reg_table[self.dst]
		return op + reg + func + '0'

class Jal:
	size = 1
	def __init__(self, target, link="$ra"):
		self.target = target
		self.link = link
	def recall(self):
		return "jal\t" + self.link + ",\t" + self.target 
	def encode(self, symbol_table):
		op = RType("jal", self.link, self.target)
		return op.encode(symbol_table)

# Pseudo instructions		
class Movwi:
	size = 2
	def __init__(self, dst, data, isLabel, line):
		self.dst = dst
		self.data = data
		self.isLabel = isLabel
		self.line = line
	def recall(self):
		if not self.isLabel:
			val = hex(self.data)
		else:
			val = self.data
		return "movwi\t" + self.dst + ",\t" + val
	def encode(self, symbol_table):
		if self.isLabel:
			if self.data not in symbol_table:
				raise Exception("Label " + self.data + " on line " + str(self.line) + \
					" does not exist in symbol table.")
			imm = symbol_table[self.data]
		else:
			imm = self.data
		bottom = imm & 0xFF
		top = (imm & 0xFF00) >> 8
		lower = IType('movi', self.dst, bottom)
		upper = IType('lui', self.dst, top)
		return lower.encode(symbol_table) + "\n" + upper.encode(symbol_table)
		
class Nop:
	size = 1
	def recall(self):
		return "nop"
	def encode(self, symbol_table):
		op = IType("addi", "$0", 0)
		return op.encode(symbol_table)

class Neg:
	size = 2
	def __init__(self, reg):
		self.reg = reg
	def recall(self):
		return "neg\t" + self.reg
	def encode(self, symbol_table):
		inv = Not(self.reg)
		add1 = IType("addi", self.reg, 1)
		return inv.encode(symbol_table) + "\n" + add1.encode(symbol_table)

class Push:
	size = 2
	def __init__(self, reg):
		self.reg = reg
	def recall(self):
		return "push\t" + self.reg
	def encode(self, symbol_table):
		write = RType("stor", self.reg, "$sp")
		stack = IType("subi", "$sp", 1)
		return write.encode(symbol_table) + "\n" + stack.encode(symbol_table)
		
class Pop:
	size = 2
	def __init__(self, reg):
		self.reg = reg
	def recall(self):
		return "pop\t" + self.reg
	def encode(self, symbol_table):
		read = RType("load", self.reg, "$sp")
		stack = IType("addi", "$sp", 1)
		return read.encode(symbol_table) + "\n" + stack.encode(symbol_table)

class Call:
	size = 7
	def __init__(self, label, line):
		self.label = label
		self.line = line
	def recall(self):
		return "call\t" + self.label
	def encode(self, symbol_table):
		return Push("$ra").encode(symbol_table) + "\n"\
			+ Movwi("$t0", self.label, True, self.line).encode(symbol_table) + "\n"\
			+ Jal("$t0").encode(symbol_table) + "\n"\
			+ Pop("$ra").encode(symbol_table)

class Frame:
	size = 3
	def recall(self):
		return "frame"
	def encode(self, symbol_table):
		return Push("$fp").encode(symbol_table) + "\n"\
			+ RType("mov", "$fp", "$sp").encode(symbol_table)
			
class Leave:
	size = 3
	def recall(self):
		return "leave"
	def encode(self, symbol_table):
		return RType("mov", "$sp", "$fp").encode(symbol_table) + "\n"\
			 + Pop("$fp").encode(symbol_table)

class StringData:
	def __init__(self, data):
		self.data = data
		self.size = math.ceil((len(data) + 1) / 2)
	def recall(self):
		return '"' + self.data + '"'
	def encode(self, symbol_table):
		output = ""
		offset = len(self.data) % 2
		
		for i in range(0, len(self.data)-offset, 2):
			output += hexstr(ord(self.data[i]), 2) + hexstr(ord(self.data[i+1]), 2) + "\n"
			
		if offset == 1:
			output += hexstr(ord(self.data[-1]), 2) + "00"
		else:
			output += "0000"
		return output
		
class NumericData:
	size = 1
	def __init__(self, data):
		self.data = data
	def recall(self):
		return ""
		#return ".data\t" + hex(self.data)
	def encode(self, symbol_table):
		return hexstr(self.data, 4)
