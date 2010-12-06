.define SPR_Y 0x2000
.define SPR_A 0x2001
.define SPR_B 0x2003
.define SPR_X 0x2002

.define CONTROL 0x480a
.define DUCK_A 0x0001
.define DUCK_B 0x0261

.define GPU_SR 0x4800
.define VBRIGHT 1

.define CTRL_LEFT 11 
.define CTRL_RIGHT 10
.define CTRL_UP 9
.define CTRL_DOWN 8


movwi $s0, CONTROL
movwi $s1, SPR_X
movwi $s2, SPR_Y

movi $t0, 0
stor $t0, $s1
stor $t0, $s2 # set X and Y to 0

movwi $t1, SPR_A
movwi $t0, DUCK_A
stor $t0, $t1 # load initial DUCK_A meta into object

movwi $t1, SPR_B
movwi $t0, DUCK_B
stor $t0, $t1 # load initial DUCK_B meta into object


loop:	
	load $a0, $s0 # load current values of CONTROL,
	load $a1, $s1 # SPR_X,
	load $a2, $s2 # and SPR_Y

	# Y translation	
	movi $t0, 1
	lshi $t0, CTRL_UP
	and $t0, $a0 # if (control.UP)
	bne else_if_down_y
		addi $a2, 1 # move sprite down (+1)
		buc done_y
	else_if_down_y: # else if (control.DOWN)
	movi $t1, 1 # test for DOWN
	lshi $t1, CTRL_DOWN
	and $t1, $a0
	bne done_y
		subi $a2, 1 # move sprite UP (-1)
		
	done_y:
	stor $a2, $s2
	
	# X translation
	movi $t0, 1
	lshi $t0, CTRL_RIGHT
	and $t0, $a0 # if (control.RIGHT)
	bne else_if_left_x
		addi $a1, 1 # move sprite RIGHT (+1)
		buc done_x
	else_if_left_x: # else if (control.LEFT)
	movi $t1, 1 # test for DOWN
	lshi $t1, CTRL_LEFT
	and $t1, $a0
	bne done_y
		subi $a1, 1 # move sprite LEFT (-1)
		
	done_x:
	stor $a1, $s1

	call wait_until_frame
	buc loop

wait_until_frame:
	movwi $t0, GPU_SR
	check_not_vbright: # while(!VBRIGHT) 
	load $t1, $t0			# loop until end of VBLANK
	andi $t1, VBRIGHT
	bne check_not_vbright
	check_vbright:
	load $t1, $t0	# while(VBRIGHT)
	andi $t1, VBRIGHT # loop until start of VBLANK
	beq check_vbright
	juc $ra

