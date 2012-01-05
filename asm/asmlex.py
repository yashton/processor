#! /usr/bin/python3

import ply.lex as lex
import math

# once the lexer reaches a DATA token, data is set to True, and
# subsequent IMM tokens are parsed as data, not immediates.
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
    'NEG',
    'PUSH',
    'POP',
    'JAL',
    'CALL',
    'NOP',
    'MOVWI',
    'FRAME',
    'LEAVE',
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

# 2 operation pseudo instructions, increase instruction count by 2.
def t_MOVWI(t):
    'movwi'
    t.lexer.instr_count += 2
    return t

def t_NEG(t):
    'neg'
    t.lexer.instr_count += 2
    return t

def t_PUSH(t):
    'push'
    t.lexer.instr_count += 2
    return t

def t_POP(t):
    'pop'
    t.lexer.instr_count += 2
    return t

def t_LEAVE(t):
    'leave'
    t.lexer.instr_count += 3
    return t

def t_FRAME(t):
    'frame'
    t.lexer.instr_count += 3
    return t

# call expands into push, movwi, jal, pop
def t_CALL(t):
    'call'
    t.lexer.instr_count += 7
    return t

# instructions
def t_SHIFT(t):
    r'lshi|ashui'
    t.lexer.instr_count += 1
    return t

def t_ITYPE(t):
    r'andi|ori|xori|addi|addui|addci|subi|subci|cmpi|movi|muli|lui'
    t.lexer.instr_count += 1
    return t

def t_RTYPE(t):
    r"and|or|xor|add|addu|addc|sub|subc|cmp|mov|mul|test|lsh|ashu|load|stor"
    t.lexer.instr_count += 1
    return t

def t_SCOND(t):
    r's(?:eq|ne|ge|cs|cc|hi|ls|lo|hs|gt|le|fs|fc|lt|uc)'
    t.value = t.value[1:]
    t.lexer.instr_count += 1
    return t

def t_BCOND(t):
    r'b(?:eq|ne|ge|cs|cc|hi|ls|lo|hs|gt|le|fs|fc|lt|uc)'
    # branch needs to know it's memory location to calculate relative jumps.
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
    t.lexer.instr_count += 1
    return t

def t_NOP(t):
    'nop'
    t.lexer.instr_count += 1
    return t

def t_JAL(t):
    'jal'
    t.lexer.instr_count += 1
    return t

# Immediate
def t_IMM(t):
    r'(?:-?0[xX][a-fA-F0-9]+)|(?:-?[0-9]+)|(?:0[bB][01]+)'
    if t.value[0:2].lower() == "0x":
        t.value = int(t.value, 16)
    elif t.value[0:2].lower() == "0b":
        t.value = int(t.value[2:], 2)
    else:
        t.value = int(t.value, 10)
    if t.lexer.data:
        t.lexer.instr_count += 1
        # if inside the data segment, immediate values encode to data
    return t

def t_STRING(t):
    '".*"'
    t.value = t.value[1:-1] # strips off the quotation marks.
    # Ascii characters are stored 2 to a word, so increase the instruction count
    # by 1/2 of the total number of characters (including the null terminator),
    # rounded up
    t.lexer.instr_count += math.ceil((len(t.value) + 1) / 2)
    return t

# Labels
def t_LABEL_DEF(t):
    r"[a-zA-Z][_a-zA-Z0-9]*\:"
    # on finding a label, add the label and the memory location it points to
    label = t.value[:len(t.value)-1] # strips :
    if label in t.lexer.symbol_table:
        print('ERROR: Duplicate label on line', t.lexer.lineno)
    t.lexer.symbol_table[label] = t.lexer.instr_count

t_LABEL = r'[a-zA-Z][_a-zA-Z0-9]*'

# Keywords
t_TEXT = r'\.text'

def t_DATA(t):
    r'\.data'
    t.lexer.data = True
    return t

# Lexer constants
def t_newline(t):
    r'\n+'
    t.lexer.lineno += len(t.value)

t_ignore = ' \t'

def t_error(t):
    print('ERROR: Illegal character "' + t.value + '" on line', t.lexer.lineno)
    t.lexer.skip(1)

# lexing
lexer = lex.lex()
# instruction count allows the lexer to track the memory location for labels
lexer.instr_count = 0
# symbol table is a dictionary, with labels as keys and memory pointers as values
symbol_table = dict()
lexer.data = False
lexer.symbol_table = symbol_table
