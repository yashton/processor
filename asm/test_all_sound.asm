.define SPR_X 0x2000
.define SPR_A 0x2001
.define SPR_Y 0x2002
.define SPR_B 0x2003

.define CONTROL_B 0x480b
.define DUCK_A 0x0041
.define DUCK_B 0x0347

.define GPU_SR 0x4800
.define VBRIGHT 1

# control_a
.define CONTROL 0x480a
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

# control_b
.define CTRL_SHOT 0x0001
.define CTRL_HIT 0x0002

# sound shit
.define BGROUND_ADDR_LOWER 		0x480c
.define BGROUND_ADDR_UPPER 		0x480d
.define BGROUND_AMP 			0x480e
.define BGROUND_DUR_LOWER 		0x480f
.define BGROUND_DUR_UPPER 		0x4810
.define SFX0_ROM_ADDR_LOWER 	0x4811
.define SFX0_ROM_ADDR_UPPER 	0x4812
.define SFX0_AMP 				0x4813
.define SFX0_DURATION_LOWER 	0x4814
.define SFX0_DURATION_UPPER 	0x4815
.define SFX1_ROM_ADDR_LOWER 	0x4816
.define SFX1_ROM_ADDR_UPPER 	0x4817
.define SFX1_AMP 				0x4818
.define SFX1_DURATION_LOWER 	0x4819
.define SFX1_DURATION_UPPER 	0x481a
.define SFX2_ROM_ADDR_LOWER 	0x481b
.define SFX2_ROM_ADDR_UPPER 	0x481c
.define SFX2_AMP 				0x481d
.define SFX2_DURATION_LOWER 	0x481e
.define SFX2_DURATION_UPPER 	0x481f
.define SFX3_ROM_ADDR_LOWER 	0x4820
.define SFX3_ROM_ADDR_UPPER 	0x4821
.define SFX3_AMP 				0x4822
.define SFX3_DURATION_LOWER 	0x4823
.define SFX3_DURATION_UPPER 	0x4824
 
 # more sound shit (actual sound values)
.define BG_NATURE_LOWER 				0x0000
.define BG_NATURE_UPPER 				0x0000
.define BG_NATURE_DURATION_LOWER 		0x91DC
.define BG_NATURE_DURATION_UPPER 		0x0028
.define DUCK_EXPLODE_LOWER 				0X91DD
.define DUCK_EXPLODE_UPPER 				0X0028
.define DUCK_EXPLODE_DURATION_LOWER 	0X2EC7
.define DUCK_EXPLODE_DURATION_UPPER 	0X0002
.define GUN_RELOAD_LOWER 				0XC0A5
.define GUN_RELOAD_UPPER 				0X002A
.define GUN_RELOAD_DURATION_LOWER 		0X0342
.define GUN_RELOAD_DURATION_UPPER 		0X0002
.define GUN_SHOT_LOWER 					0XC3E8
.define GUN_SHOT_UPPER 					0X002C
.define GUN_SHOT_DURATION_LOWER			0X0862
.define GUN_SHOT_DURATION_UPPER			0X0001
.define QUACK_LOWER						0XCC4B
.define QUACK_UPPER						0X002D
.define QUACK_DURATION_LOWER			0X27F4
.define QUACK_DURATION_UPPER			0X0001
.define WING_FLAP_LOWER					0XF440
.define WING_FLAP_UPPER					0X002E
.define WING_FLAP_DURATION_LOWER		0X5872
.define WING_FLAP_DURATION_UPPER		0X0001

# clear the registers.
movi $t0, 0
movi $t1, 0
movi $t2, 0
movi $t3, 0
movi $s0, 0
movi $s1, 0
movi $s2, 0
movi $s3, 0
movi $a0, 0
movi $a1, 0
movi $a2, 0
movi $v0, 0
movi $v1, 0
movi $fp, 0
movi $sp, 0
movi $ra, 0

movwi $s0, CONTROL
movwi $s1, SPR_X
movwi $s2, SPR_Y
movwi $s3, CONTROL_B

movi $t0, 200
stor $t0, $s1
stor $t0, $s2 # set X and Y to 0

movwi $t1, SPR_A
movwi $t0, DUCK_A
stor $t0, $t1 # load initial DUCK_A meta into object

movwi $t1, SPR_B
movwi $t0, DUCK_B
stor $t0, $t1 # load initial DUCK_B meta into object

movwi $t2, BG_NATURE_LOWER
movwi $t0, BGROUND_ADDR_LOWER
stor $t2, $t0

movwi $t3, BG_NATURE_UPPER
movwi $t0, BGROUND_ADDR_UPPER
stor $t3, $t0

movi $t2, 0
movwi $t0, BGROUND_AMP 
stor $t2, $t0

movwi $t0, BGROUND_DUR_LOWER
movwi $t1, BGROUND_DUR_UPPER
movwi $t2, BG_NATURE_DURATION_LOWER
movwi $t3, BG_NATURE_DURATION_UPPER
stor $t2, $t0
stor $t3, $1

loop:	
	load $a0, $s0 # load current values of CONTROL,
	load $a1, $s1 # SPR_X,
	load $a2, $s2 # and SPR_Y
	
	# X translation
	movwi $t0, CTRL_RIGHT
	test $t0, $a0 # if (control.RIGHT)
	beq else_if_left_x
		call play_sound_explode # if right button, play explode
		buc done_x
	else_if_left_x: # else if (control.LEFT)
	movwi $t1, CTRL_LEFT # test for LEFT
	test $t1, $a0
	beq done_x
		call play_sound_reload	# if left button, play reload
	done_x:
	
	# Y translation	
	movwi $t0, CTRL_UP
	test $t0, $a0 # if (control.UP)
	beq else_if_up_y
		call play_sound_shot	# if up button, play shot
		buc done_y
	else_if_up_y: # else if (control.DOWN)
	movwi $t1, CTRL_DOWN # test for DOWN
	test $t1, $a0
	beq done_y
		call play_sound_quack	# if down button, play quack
	done_y:
	stor $a2, $s2

	# Meta A
	movwi $t1, SPR_A
	load $t2, $t1
	movwi $t0, CTRL_X
	test $t0, $a0 # if (control.RIGHT)
	beq else_if_a
		addi $t2, 1 # move sprite RIGHT (+1)
		buc done_a
	else_if_a: # else if (control.LEFT)
	movwi $t0, CTRL_Y # test for LEFT
	test $t0, $a0
	beq done_a
		subi $t2, 1 # move sprite LEFT (-1)
		
	done_a:
	stor $t2, $t1

	# Meta B
	movwi $t1, SPR_B
	load $t2, $t1
	movwi $t0, CTRL_A
	test $t0, $a0 # if (control.RIGHT)
	beq else_if_b
		addi $t2, 1 # move sprite RIGHT (+1)
		buc done_b
	else_if_b: # else if (control.LEFT)
	movwi $t0, CTRL_B # test for LEFT
	test $t0, $a0
	beq done_b
		subi $t2, 1 # move sprite LEFT (-1)
		
	done_b:
	stor $t2, $t1
	
	# code to test gun
	mov $t0, $fp	# frame pointer to t0
	addi $t0, 2		# set t0 to address of CONTROL_B
	load $t0, $t0 	# load data at address of CONTROL_B into t0
	
	cmpi $t0, 3		# if (shot == true && hit == true) 

	# CODE TO TEST GUN GOES HERE	
	
	pop $s3 		# remove CONTROL_B from stack
	
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
	
play_sound_explode:
	movwi $t2, DUCK_EXPLODE_LOWER
	movwi $t0, SFX0_ROM_ADDR_LOWER
	stor $t2, $t0

	movwi $t3, DUCK_EXPLODE_UPPER
	movwi $t0, SFX0_ROM_ADDR_UPPER
	stor $t3, $t0
	
	movi $t2, 0
	movwi $t0, SFX0_AMP 
	stor $t2, $t0

	movwi $t0, SFX0_DURATION_LOWER
	movwi $t1, SFX0_DURATION_UPPER
	movwi $t2, DUCK_EXPLODE_DURATION_LOWER
	movwi $t3, DUCK_EXPLODE_DURATION_UPPER
	stor $t2, $t0
	stor $t3, $t1
	
	juc $ra
play_sound_reload:
	movwi $t2, GUN_RELOAD_LOWER
	movwi $t0, SFX1_ROM_ADDR_LOWER
	stor $t2, $t0

	movwi $t3, GUN_RELOAD_UPPER
	movwi $t0, SFX1_ROM_ADDR_UPPER
	stor $t3, $t0
	
	movi $t2, 0
	movwi $t0, SFX1_AMP 
	stor $t2, $t0

	movwi $t0, SFX1_DURATION_LOWER
	movwi $t1, SFX1_DURATION_UPPER
	movwi $t2, GUN_RELOAD_DURATION_LOWER
	movwi $t3, GUN_RELOAD_DURATION_UPPER
	stor $t2, $t0
	stor $t3, $t1

	juc $ra
play_sound_shot:
	movwi $t2, GUN_SHOT_LOWER
	movwi $t0, SFX2_ROM_ADDR_LOWER
	stor $t2, $t0

	movwi $t3, GUN_SHOT_UPPER
	movwi $t0, SFX2_ROM_ADDR_UPPER
	stor $t3, $t0
	
	movi $t2, 0
	movwi $t0, SFX2_AMP 
	stor $t2, $t0

	movwi $t0, SFX2_DURATION_LOWER
	movwi $t1, SFX2_DURATION_UPPER
	movwi $t2, GUN_SHOT_DURATION_LOWER
	movwi $t3, GUN_SHOT_DURATION_UPPER
	stor $t2, $t0
	stor $t3, $t1

	juc $ra
play_sound_quack:
	movwi $t2, QUACK_LOWER
	movwi $t0, SFX3_ROM_ADDR_LOWER
	stor $t2, $t0

	movwi $t3, QUACK_UPPER
	movwi $t0, SFX3_ROM_ADDR_UPPER
	stor $t3, $t0

	movi $t2, 0
	movwi $t0, SFX3_AMP 
	stor $t2, $t0
	
	movwi $t0, SFX3_DURATION_LOWER
	movwi $t1, SFX3_DURATION_UPPER
	movwi $t2, QUACK_DURATION_LOWER
	movwi $t3, QUACK_DURATION_UPPER
	stor $t2, $t0
	stor $t3, $t1

	juc $ra
play_sound_flap:
	movwi $t2, WING_FLAP_LOWER
	movwi $t0, SFX3_ROM_ADDR_LOWER
	stor $t2, $t0

	movwi $t3, WING_FLAP_UPPER
	movwi $t0, SFX3_ROM_ADDR_UPPER
	stor $t3, $t0
	
	movi $t2, 0
	movwi $t0, SFX3_AMP 
	stor $t2, $t0

	movwi $t0, SFX3_DURATION_LOWER
	movwi $t1, SFX3_DURATION_UPPER
	movwi $t2, WING_FLAP_DURATION_LOWER
	movwi $t3, WING_FLAP_DURATION_UPPER
	stor $t2, $t0
	stor $t3, $t1

	juc $ra