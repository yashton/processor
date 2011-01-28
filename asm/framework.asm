# Memory map locations
.define SPRITE_TABLE 		0x2000
.define SPRITE_TILE 		0x2400
.define PALETTE_DATA 		0x4400
.define GPU_STATUS 			0x4800
.define SPRITE_PRIORITY 	0x4801
.define SCREEN_BRIGHTNESS 	0x4802
.define BACKGROUND_PALETTE 	0x4827

.define VBRIGHT_MASK 1

# Direct Memory Access Controller
.define DMA_SRC_LOWER 		0x4804
.define DMA_SRC_UPPER 		0x4805
.define DMA_DST 			0x4806
.define DMA_AMT 			0x4807

.define ROTARY_ENC 			0x4808
.define RANDOM_GENERATOR 	0x4809
.define SWITCHES 			0x4803

# SNES controller
.define CONTROLLER_A 		0x480a
# NES zapper
.define CONTROLLER_B 		0x480b
.define BLANK_TIME_UP		0x4826

# Sound memory map locations
.define SOUND_ROM_ADDR_LOWER 	0x480c
.define SOUND_ROM_ADDR_UPPER 	0x480d
.define SOUND_AMP 				0x480e
.define SOUND_DURATION_LOWER 	0x480f

.define BG_DURATION_UPPER 	0x4810
.define SFX0_DURATION_UPPER 0x4811
.define SFX1_DURATION_UPPER 0x4812
.define SFX2_DURATION_UPPER 0x4813
.define SFX3_DURATION_UPPER 0x4814
.define SFX4_DURATION_UPPER 0x4815
.define SFX5_DURATION_UPPER 0x4816
.define SFX6_DURATION_UPPER 0x4817
.define SFX7_DURATION_UPPER 0x4818
.define SFX8_DURATION_UPPER 0x4819

# Controller button masks
.define CTRL_IS_ACTIVE 	0xF000
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

.define STACK_INITIAL_ADDR 0x1fff

.define RANDOM_TRANSLATION_X 4
.define RANDOM_TRANSLATION_Y 3

.text

# set up initial stack frame
movi $ra, 0
movwi $sp, STACK_INITIAL_ADDR
movwi $fp, STACK_INITIAL_ADDR

main:					# while(true)
	# implement game logic
	call initialize_game
	game_loop:
		call update_game
		call wait_until_frame
	buc game_loop

##	
# Game initialization code
# This function is called once at the start of the game.
##
initialize_game:
	# game initialization code
	juc $ra
	
## 
# Game frame update code.
# This function is called at the beginning of each vertical blanking period.
##
update_game:
	# game update code.
	juc $ra
	
##	
# Generates a random vector. X and Y are length -1, 0, or 1
# $v0 - random deltaX
# $v1 - random deltaY	
##
random_direction:
	movi $v0, 0 # x = 0
 	movi $v1, 0 # y = 0
	
	movwi $t0, RANDOM_GENERATOR # load a random number (0 to 7)
	load $t1, $t0
	andi $t1, 0x7
	
	movwi $t2, random_dir_case # switch(random):
	add $t2, $t1
	juc $t2
	
	random_dir_case:	# case statement table
		buc random_dir_up
		buc random_dir_down
		buc random_dir_left
		buc random_dir_right
		buc random_dir_up_left
		buc random_dir_up_right
		buc random_dir_down_left
		buc random_dir_down_right
	
	random_dir_up:
		subi $v1, 1			# delta y = -1
		buc random_dir_finish
	random_dir_down:
		addi $v1, 1			# delta y = 1
		buc random_dir_finish
	random_dir_left:
		subi $v0, 1			# delta x = -1
		buc random_dir_finish
	random_dir_right:
		addi $v1, 1			# delta x = 1
		buc random_dir_finish
	random_dir_up_left:
		subi $v0, 1			# delta x = -1
		subi $v1, 1			# delta y = -1
		buc random_dir_finish
	random_dir_up_right:
		addi $v0, 1			# delta x = 1
		subi $v1, 1			# delta y = -3
		buc random_dir_finish
	random_dir_down_left:
		subi $v0, 1			# delta x = -1
		addi $v1, 1			# delta y = 1
		buc random_dir_finish
	random_dir_down_right:
		addi $v0, 1			# delta x = 1
		addi $v1, 1			# delta y = 1
	random_dir_finish:
	juc $ra

##
# Reads from the controller values given and produces a unit vector.
# $a0 - control values
# $v0 - return deltaX
# $v1 - return deltaY
##
player_direction:	
	movi $v0, 0
	movi $v1, 0
	
	# X translation
	movwi $t0, CTRL_RIGHT
	test $t0, $a0 # if (control.RIGHT)
	beq else_if_left_x
		addi $v0, 1 # move sprite RIGHT (+1)
		buc done_x
	else_if_left_x: # else if (control.LEFT)
	movwi $t1, CTRL_LEFT # test for LEFT
	test $t1, $a0
	beq done_x
		subi $v0, 1 # move sprite LEFT (-1)
		
	done_x:
	
	# Y translation	
	movwi $t0, CTRL_UP
	test $t0, $a0 # if (control.UP)
	beq else_if_up_y
		subi $v1, 1 # move sprite UP (-1)
		buc done_y
	else_if_up_y: # else if (control.DOWN)
	movwi $t1, CTRL_DOWN # test for DOWN
	test $t1, $a0
	beq done_y
		addi $v1, 1 # move sprite down (+1)
		
	done_y:
	juc $ra
	
##
# Loops until the beginning of the next VGA refresh vertical blank period
##
wait_until_frame:
	movwi $t0, GPU_STATUS
	# if current vblank not over, loop until end.
	check_not_vbright: # while(!(GPU_STATUS & VBRIGHT_MASK)) 
		load $t1, $t0	# loop until end of VBLANK
		andi $t1, VBRIGHT_MASK
		beq check_not_vbright
	check_vbright:
		load $t1, $t0	# while(GPU_STATUS & VBRIGHT_MASK)
		andi $t1, VBRIGHT_MASK # loop until start of VBLANK
		bne check_vbright
	juc $ra
	
##
#	$a0 - Address of X_UPPER_DURATION
# $a1 - Pointer to sound structure
# $a2 - amplitude
##
play_sound:
	# $t0 = start of sound structure
	mov $t0, $a1
	# load the rom_addr_lower from structure.
	load $t2, $t0
	# save in SOUND_ROM_ADDR_LOWER
	movwi $t1, SOUND_ROM_ADDR_LOWER
	stor $t2, $t1
	
	# incr the pointer in the structure
	addi $t0, 1
	# load the rom_addr_upper from structure
	load $t2, $t0
	# save in SOUND_ROM_ADDR_UPPER
	movwi $t1, SOUND_ROM_ADDR_UPPER
	stor $t2, $t1
	
	# incr the pointer in the structure
	addi $t0, 1
	# load the duration_lower from structure
	load $t2, $t0
	# save in SOUND_DURATION_LOWER
	movwi $t1, SOUND_DURATION_LOWER
	stor $t2, $t1
	
	# save amplitude argument in SOUND_AMP
	movwi $t1, SOUND_AMP
	stor $a2, $t1
	
	# incr the pointer in the structure
	addi $t0, 1
	# load the duration_upper from structure
	load $t2, $t0
	# save in duration_upper address provided in argument
	stor $t2, $a0
	
	juc $ra

.data
	example_sound: 0x91DD, 0x0028, 0x2EC7, 0x0002
