#! /usr/bin/python3

import ply.lex as lex
import math

data = False
tokens = (
	'COMMA',
	'REG',
	'RTYPE',
	'ITYPE',
	'SHIFT',
	'SCOND',
	'BCOND',
	'JCOND',
	'NOT',
	'MOVWI',
	'IMM',
	'LABEL',
	'LABEL_DEF',
	'COMMENT',
	'TEXT',
	'DATA',
	'STRING'
	)

def t_COMMENT(t):
	r'\#.*'
	pass

t_REG = r'\$(?:1[0-5]|[0-9]|t[0-3]|s[0-3]|a[0-2]|v[0-1]|sp|fp|ra)'
t_COMMA = r'\,'

def t_MOVWI(t):
	'movwi'
	t.lexer.instr_count += 2
	return t

def t_SHIFT(t):
	r'lshi|ashui'
	t.lexer.instr_count += 1
	return t

def t_ITYPE(t):
	r'andi|ori|xori|addi|addui|addci|subi|subci|cmpi|movi|muli|lui'
	t.lexer.instr_count += 1
	return t
	
def t_RTYPE(t):
	r"and|or|xor|add|addu|addc|sub|subc|cmp|mov|mul|test|jal|lsh|ashu|load|stor"
	t.lexer.instr_count += 1
	return t
	
def t_SCOND(t):
	r's(?:eq|ne|ge|cs|cc|hi|ls|lo|hs|gt|le|fs|fc|lt|uc)'
	t.value = t.value[1:]
	t.lexer.instr_count += 1
	return t
	
def t_BCOND(t):
	r'b(?:eq|ne|ge|cs|cc|hi|ls|lo|hs|gt|le|fs|fc|lt|uc)'
	t.value = (t.value[1:], t.lexer.instr_count)
	t.lexer.instr_count += 1
	return t

def t_JCOND(t):
	r'j(?:eq|ne|ge|cs|cc|hi|ls|lo|hs|gt|le|fs|fc|lt|uc)'
	t.value = t.value[1:]
	t.lexer.instr_count += 1
	return t
	
def t_NOT(t):
	'not'
	t.value = (t.value, t.lexer.instr_count)
	t.lexer.instr_count += 1
	return t


def t_IMM(t):
	r'(?:-?0[xX][a-fA-F0-9]+)|(?:-?[0-9]+)'
	if t.value[0:2].lower() == "0x":
		t.value = int(t.value, 16)
	else:
		t.value = int(t.value, 10)
	if data:
		t.lexer.instr_count += 1
	return t	

def t_LABEL_DEF(t):
	r"[a-zA-Z][_a-zA-Z0-9]*\:"
	t.lexer.symbol_table[t.value[:len(t.value)-1]] = t.lexer.instr_count
	
t_LABEL = r'[a-zA-Z][_a-zA-Z0-9]*'

def t_newline(t):
	r'\n+'
	t.lexer.lineno += len(t.value)
	
t_ignore = ' \t'
		
t_TEXT = r'.text'

def t_DATA(t):
	r'.data'
	data = True
	return t
	
def t_STRING(t):
	'".*"'
	t.value = t.value[1:-1] # strips off the quotation marks.
	# Ascii characters are stored 2 to a word, so increase the instruction count
	# by 1/2 of the total number of characters (including the null terminator),
	# rounded up 
	t.lexer.instr_count += math.ceil((len(t.value) + 1) / 2)
	return t

def t_error(t):
	print('Illegal character "' + t.value[0] + '"')
	t.lexer.skip(1)

symbol_table = dict()
	
# lexing
lexer = lex.lex()
lexer.instr_count = 0
lexer.symbol_table = symbol_table
