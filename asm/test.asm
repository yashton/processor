# To compile an assembly file, run
# python3 asm.py filein
# or python3 asm.py filein fileout

# you can define preprocessor macros
.define MONKEY 6

# .text is the set of instructions.
.text
	movi $s0, 0x13 # immediate values may be in C-style hex
	subi $s0, 19 # or in decimal
	
	addi $1, MONKEY # the value MONKEY will be replaced with 6 during preproccessing
	
	# labels follow the C naming standard. They must start with an letter,
	# followed by any number of letters, numbers and underscores. Letters may be
	# upper or lower case.
	label:
		movi $t1, 13
	
	# movwi is a pseudo instruction that expands into a movi and a lui.
	movwi $1, 0x1234
	
	# this instruction loads a pointer to the string foo (from the data segment)
	movwi $s0, foo
	
	lshi $s0, 13
	
	movi $s1, 244
	

	movwi $t0, start
	jne $t0

	jhs $ra
	top: add  $1, $0 # labels can be defined on their own line, or inline
	stor $1, $12
 	
 					 	sls	    $a1     # any amount of whitespace is allowed
	neg $t0
	
	
	# labels are referenced by name (without the trailing colon)
	beq	start

	# procedure calls	
	push $ra
	movwi $t0, start
	jal $t0
	pop $ra
	
	# equivalent pseudo-op for above procedure call
	call start
	
	nop
	
	sub $5, $t1 # bork bork bork
	bne start
	movi $8, 0x1
	
	test $ra, $t0
	
	# procedure
	start: 
		push $fp
		mov $fp, $sp
		ashui $a0, -9  	# blah blah blah
		mov $v0, $a0
		mov $sp, $fp
		pop $fp
		juc $ra
		
	# equivalent procedure using pseudo-ops
	start2:
		frame
		ashui $a0, -9
		mov $v0, $a0
		leave
		juc $ra
		
# .data is used for strings and static data.
.data
	foo: "testing" # foo is a pointer to the start of this string.
	# strings are encoded as ascii, two chars per word, terminated with a \0
	# null terminal. "testing" encodes into 4 words.
	
	junk: "Monkey" # this also encodes into 4 words. The length of the
	# string with the terminal character does not fit evenly into words, so an
	# extra terminal character is added.
	
	bar: 0x12 # bar is a pointer to this word.
	# Any numeric value in the .data segment is stored as a word.
	
	# baz is an array of six 16-bit words.
	baz: 0x1234, 0x4567, 0x89ab, 128, 0x1, 65500
	
	heap:
	# typically, memory is organize with the .text segment first,
	# followed by the .data segment, then by the heap. This trailing label creates     
	# a pointer to the location of the first element of the heap space.
