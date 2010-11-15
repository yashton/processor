import ply.yacc as yacc

from asmlex import tokens, symbol_table
from asmencode import RType, IType, ShiftImm, Bcond, Jcond, Scond, Not, Neg
from asmencode import Jal, Push, Pop, Nop, Movwi, Call, StringData, NumericData
from asmencode import Frame, Leave

# Context free grammar definitions

# file can consist of a text segment and a data segment
def p_s_textdata(p):
	's : TEXT c DATA d'
	p[0] = list()
	p[0].extend(p[2])
	p[0].extend(p[4])

# file can consist of only a text segment
def p_s_text(p):
	's : TEXT c'
	p[0] = p[2]

# or file can consist of only instructions
def p_s(p):
	's : c'
	p[0] = p[1]
	
# .text segment
def p_c(p):
	'c : instr c'
	p[0] = list()
	p[0].append(p[1])
	p[0].extend(p[2])

def p_c_instr(p):
	'c : instr'
	p[0] = list()
	p[0].append(p[1])
	
# instruction matching
def p_instr_rtype(p):
	'instr : RTYPE REG COMMA REG'
	p[0] = RType(p[1], p[2], p[4])
	 
def p_instr_itype(p):
	'instr : ITYPE REG COMMA IMM'
	if not -128 <= p[4] < 256:
		p_error(p)
		print('ERROR: Immediate value for I-type out of range.')
	p[0] = IType(p[1], p[2], p[4])
	
def p_instr_shift(p):
	'instr : SHIFT REG COMMA IMM'
	if not -16 < p[4] < 16:
		p_error(p)
		print('ERROR: Immediate value for shift out of range.')
	p[0] = ShiftImm(p[1], p[2], p[4])	

def p_instr_not(p):
	'instr : NOT REG'
	p[0] = Not(p[2])
	
def p_instr_nop(p):
	'instr : NOP'
	p[0] = Nop()
	
def p_instr_jal(p):
	'instr : JAL REG COMMA REG'
	p[0] = Jal(p[2], p[4])
	
def p_instr_jal_impl(p):
	'instr : JAL REG'
	p[0] = Jal(p[2])
	
def p_instr_push(p):
	'instr : PUSH REG'
	p[0] = Push(p[2])
	
def p_instr_pop(p):
	'instr : POP REG'
	p[0] = Pop(p[2])
	
def p_instr_neg(p):
	'instr : NEG REG'
	p[0] = Neg(p[2])
	
def p_instr_call(p):
	'instr : CALL LABEL'
	p[0] = Call(p[2], p.lexer.lineno)
	
def p_instr_jcond(p):
	'instr : JCOND REG'
	p[0] = Jcond(p[1], p[2])
	
def p_instr_scond(p):
	'instr : SCOND REG'
	p[0] = Scond(p[1], p[2])
	
def p_instr_bcond(p):
	'instr : BCOND LABEL'
	cond, addr = p[1]
	p[0] = Bcond(cond, addr, p[2], p.lexer.lineno)
	
def p_instr_movwi_imm(p):
	'instr : MOVWI REG COMMA IMM'
	if not -32768 <= p[4] < 65536:
		p_error(p)
		print('Immediate value for movwi out of range.')
	p[0] = Movwi(p[2], p[4], False, p.lexer.lineno)
	
def p_instr_movwi_label(p):
	'instr : MOVWI REG COMMA LABEL'
	p[0] = Movwi(p[2], p[4], True, p.lexer.lineno)
	
def p_instr_frame(p):
	'instr : FRAME'
	p[0] = Frame()

def p_instr_leave(p):
	'instr : LEAVE'
	p[0] = Leave()
	
# .data segment
def p_d(p):
	'd : e d'
	p[0] = list()
	p[0].extend(p[1])
	p[0].extend(p[2])
	
def p_d_e(p):
	'd : e'
	p[0] = p[1]
	
def p_e(p):
	'''e : f 
				| g'''
	p[0] = p[1]
	
def p_f_list(p):
	'f : IMM COMMA f'
	if not -32768 <= p[1] < 65536:
		p_error(p)
		print('Immediate value for data out of range.')
	p[0] = list()
	p[0].append(NumericData(p[1]))
	p[0].extend(p[3])
	
def p_f_numeric(p):
	'f : IMM'
	if not -32768 <= p[1] < 65536:
		p_error(p)
		print('Immediate value for data out of range.')
	p[0] = list()
	p[0].append(NumericData(p[1]))
	
def p_g_string(p):
	'g : STRING'
	p[0] = list()
	p[0].append(StringData(p[1]))
	
def p_error(p):
	print("ERROR: Syntax error in input on line", p.lexer.lineno)

# Build the parser
parser = yacc.yacc()
