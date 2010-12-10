# Memory map locations
.define SPR_X 0x2000
.define SPR_A 0x2001
.define SPR_Y 0x2002
.define SPR_B 0x2003

.define CONTROL 0x480a
.define DUCK_A 0x0201
.define DUCK_B 0x0783

.define GPU_SR 0x4800
.define VBRIGHT 1

.define CTRL_LEFT 0x0800
.define CTRL_RIGHT 0x0400
.define CTRL_UP 0x0200
.define CTRL_DOWN 0x0100
.define CTRL_A 0x0080
.define CTRL_B 0x0040
.define CTRL_X 0x0020
.define CTRL_Y 0x0010
.define CTRL_L_SHOULDER 0x0008
.define CTRL_R_SHOULDER 0x0004
.define CTRL_SELECT 0x0002
.define CTRL_START 0x0001


movwi $s0, CONTROL
movwi $s1, SPR_X
movwi $s2, SPR_Y

movi $t0, 200
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

	# X translation
	movwi $t0, CTRL_RIGHT
	test $t0, $a0 # if (control.RIGHT)
	beq else_if_left_x
		addi $a1, 4 # move sprite RIGHT (+4)
	else_if_left_x: # else if (control.LEFT)
	movwi $t1, CTRL_LEFT # test for LEFT
	test $t1, $a0
	beq done_x
		subi $a1, 4 # move sprite LEFT (-4)
	done_x:
	stor $a1, $s1
	
	# Y translation	
	movwi $t0, CTRL_UP
	test $t0, $a0 # if (control.UP)
	beq else_if_up_y
		subi $a2, 3 # move sprite UP (-3)
		buc done_y
	else_if_up_y: # else if (control.DOWN)
	movwi $t1, CTRL_DOWN # test for DOWN
	test $t1, $a0
	beq done_y
		addi $a2, 3 # move sprite down (+3)
	done_y:
	call wait_until_frame
	buc loop

wait_until_frame:
	movwi $t0, GPU_SR
	check_not_vbright: # while(!VBRIGHT) 
		load $t1, $t0			# loop until end of VBLANK
		andi $t1, VBRIGHT
		beq check_not_vbright
	check_vbright:
		load $t1, $t0	# while(VBRIGHT)
		andi $t1, VBRIGHT # loop until start of VBLANK
		bne check_vbright
	juc $ra
