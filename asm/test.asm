.define MONKEY 0x17

start: movi $0, 0x13
movi $1, 13
addi $1, MONKEY
top: add  $1, $0
sls $a1
beq	start
	# stupid comment
label: sub $5, $t1 # do stuff
loop: bne end
test $ra, $t0
ashui $1, 9  	# blah blah blah
jhs $ra
end: stor $1, $12

