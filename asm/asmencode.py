cond_table = {
	'eq': '0',
	'ne': '1',
	'ge': '2',
	'cs': '3',
	'cc': '4',
	'hi': '5',
	'ls': '6',
	'lo': '7',
	'hs': '8',
	'gt': '9',
	'le': 'a',
	'fs': 'b',
	'fc': 'c',
	'lt': 'd',
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
	'''Create a pure hexadecimal string of length width from integer a.'''
	bytes = hex(a)[2:]
	return '0'*(width-len(bytes)) + bytes
	
class RType:
	'''Encodes R-type instructions'''
	def __init__(self, oper, dst, src):
		#print("parsed r-type.", "\toper:", oper, "\tdst:", dst, "\tsrc", src)
		self.oper = oper
		self.dst = dst
		self.src = src
	def encode(self, symbol_table):
		

class IType:
	'''Encodes I-type isntructions'''
	def __init__(self, oper, dst, imm):
#		print("parsed i-type.", "\toper:", oper, "\tdst:", dst, "\timmed:", imm)
	def encode(self, symbol_table):
	
class ShiftImm:
	'''Encodes arithmetic and logical shifts by immediate values'''
	def __init__(self, oper, dst, imm):
#		print("parsed shift by immed.", "\toper:", oper, "\tdst:", dst, "\timmed:", imm)
		self.oper = oper
		self.dst = dst
		self.imm = imm	
	def encode(self, symbol_table):
		if self.imm >= 0:
			func = shift_table[self.oper + "_l"]
		else:
			func = shift_table[self.oper + "_r"]

		
class Bcond:
	'''Encodes branches'''
	def __init__(self, cond, current, label, line):
		#print("parsed bcond @", str(current), "." "\tcond", cond, "\ttarget:", label)
		self.cond = cond
		self.current = current
		self.label = label
		self.line = line
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
	'''Encodes jumps'''
	def __init__(self, cond, target):
		#print("parsed jcond.", "\tcond:", cond, "\tdst:", dst)
	def encode(self, symbol_table):

class Scond:
	'''Encodes status accesses'''
	def __init__(self, cond, dst):
		#print("parsed scond.", "\tcond:", cond, "\tdst:", dst)
	def encode(self, symbol_table):
		
class Not:
	'''Encodes the not operation'''
	def __init__(self, dst):
		#print("parsed not.", "\tdst:", dst)
		self.dst = dst
	def encode(self, symbol_table):
		op = oper_table['register']
		func = reg_table['not']
		reg = reg_table[self.dst]
		return op + reg + func + '0'
		
class Movwi:
	'''Encodes the movwi pseudo-instruction. Encodes into a movi and a lui.'''
	def __init__(self, dst, data, isLabel, line):
#		if isLabel:
#			print("parsed movwi.", "\tdst:", dst, "\tlabel:", data)
#		else:
#			print("parsed movwi.", "\tdst:", dst, "\timmed:", data)
		self.dst = dst
		self.data = data
		self.isLabel = isLabel
		self.line = line
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
		if top == 0:
			# if the upper byte is 0, the load upper is redundant
			return lower.encode(symbol_table)
		else:
			return lower.encode(symbol_table) + "\n" + upper.encode(symbol_table)
			
class StringData:
	'''Encodes ascii strings.'''
	def __init__(self, data):
		#print("parsed string.", "\tvalue: \"" + dst + "\"")
		self.data = data
	def encode(self, symbol_table):
		offset = 0
		output = ""
		for char in self.data:
			# generate the byte for the char and add to output
			a = hex(ord(char))[2:]
			output += a
			# if that byte just completed a word, add a newline.
			if offset == 1:
				output += "\n"
				offset = 0
			else:
				offset += 1
		# add \0 terminator to end
		output += '00'
		# keep the word alignment if there is an unused byte.
		if offset == 0: 
			output += '00'
		return output
		
class NumericData:
	'''Encodes a 16-bit numerica data value'''
	def __init__(self, data):
		#print("parsed numeric data.", "\tvalue:", data)
		self.data = data
	def encode(self, symbol_table):
		return hexstr(self.data, 4)
