.define SPRITE_TABLE 		0x2000
.define SPRITE_TILE 		0x2400
.define PALETTE_DATA 		0x4400
.define GPU_STATUS 			0x4800
.define SPRITE_PRIORITY 	0x4801
.define SCREEN_BRIGHTNESS 	0x4802
.define SWITCHES 			0x4803
.define DMA_SRC_LOWER 		0x4804
.define DMA_SRC_UPPER 		0x4805
.define DMA_DST 			0x4806
.define DMA_AMT 			0x4807
.define ROTARY_ENC 			0x4808
.define RANDOM_GENERATOR 	0x4809
# snes controller
.define CONTROLLER_A 		0x480a
# nes zapper
.define CONTROLLER_B 		0x480b
.define BG_ROM_ADDR_LOWER 	0x480c
.define BG_ROM_ADDR_UPPER 	0x480d
.define BG_AMP 				0x480e
.define BG_DURATION_LOWER 	0x480f
.define BG_DURATION_UPPER 	0x4810
.define SFX0_ROM_ADDR_LOWER 0x4811
.define SFX0_ROM_ADDR_UPPER 0x4812
.define SFX0_AMP 			0x4813
.define SFX0_DURATION_LOWER 0x4814
.define SFX0_DURATION_UPPER 0x4815
.define SFX1_ROM_ADDR_LOWER 0x4816
.define SFX1_ROM_ADDR_UPPER 0x4817
.define SFX1_AMP 			0x4818
.define SFX1_DURATION_LOWER 0x4819
.define SFX1_DURATION_UPPER 0x481a
.define SFX2_ROM_ADDR_LOWER 0x481b
.define SFX2_ROM_ADDR_UPPER 0x481c
.define SFX2_AMP 			0x481d
.define SFX2_DURATION_LOWER 0x481e
.define SFX2_DURATION_UPPER 0x481f
.define SFX3_ROM_ADDR_LOWER 0x4820
.define SFX3_ROM_ADDR_UPPER 0x4821
.define SFX3_AMP 			0x4822
.define SFX3_DURATION_LOWER 0x4823
.define SFX3_DURATION_UPPER 0x4824
.define BLANK_TIME_UP		0x4826
.define BACKGROUND_PALETTE 	0x4827
.define BACKGROUND_BLANK_PALETTE 0x0007
.define BACKGROUND_NORMAL_PALETTE 0x000
.define DUCK_BLANK_OR_MASK	0x0C00
.define DUCK_BLANK_AND_MASK 0xEDFF
.define DUCK_NORMAL_OR_MASK	0x0200
.define DUCK_NORMAL_AND_MASK 0xE3FF

.define DUCK_SPRITE 		0x2000
.define ROUND_TIME 			600
.define NORMAL_STATE 		1
.define HIT 				2
.define BLANK_SCREEN 		3
.define POINTS 				5
.define RANDOM_DIRMASK 		7
.define DUCK_SIZE_X 		32
.define DUCK_SIZE_Y			24
.define SCR_WIDTH			640
.define SCR_HEIGHT			250
.define CONTROLLER_MASK 	0xF000
.define CONTROL_11 			0x0800
.define CONTROL_10 			0x0400
.define CONTROL_9  			0x0200
.define CONTROL_8  			0x0100
.define RANDOM_NUMBER 		0x4809
.define GPU_SR 				0x4800
.define VBRIGHT 			1
.define HFLIP_MASK 			0x0010

.text
main:					# while(true)
	call draw_splash	# draw_splash();
	call play_game
	mov $a0, $v0		# int score = play_game();
	call draw_result	# draw_result(score)
	buc main
	
draw_splash:
	# TODO add splash screen code
	juc $ra
	

draw_result:
	# TODO add show result code
	juc $ra
	
play_game:
	frame
	push $s0					# save registers are pushed to 
	push $s1					# stack so that they can be restored
	push $s2					# at the end of this procedure
	push $s3
	push $a0
	push $a1
	push $a2 
	movi $t0, 0 				# score = 0
	push $t0					# score is pushed to stack
	movwi $t1, ROUND_TIME		# time = 600
	push $t1					# time is pushed to stack
	movi $s0, 0					# finished = false 
	movi $s1, 0					# rounds = 0  
	movwi $s3, DUCK_SPRITE		# duck = 0x2000	
	movi $a1, 0 				# killed = 0
	movi $s2, NORMAL_STATE		# state = NORMAL_STATE
	
	play_game_do:				# play_game, done 60 x per second
		mov  $t0, $fp			# get address of frame pointer
		subi $t0, 2				# go two into stack for time address
		load $t1, $t0			# t1 = time
		subi $t1, 1				# time--
		stor $t1, $t0			# save updated time back where it came from
		
		push $a1	 			# save killed to stack
		mov  $a0, $s2
		movwi $t2, CONTROLLER_B # trigger and hit are stored consecutively in memory at CONT_B
		load $a1, $t2			# a1 = trigger pulled
		addi $t2, 1
		load $a2, $t2			# a2 = hit
		call next_state			# state = next_state(state)
		mov $s2, $v0
		pop $a1					# load killed from stack
		
		movwi $t2, BLANK_TIME_UP
		load $t3, $t2
		cmpi $t3, 1
		bne else_if_blank
			# mov $a0, $s3		# a0 = DUCK_SPRITE
			call unblank_screen
			buc if_blank_finished
		else_if_blank:
			call blank_screen
		if_blank_finished:
		
		cmpi $s2, HIT
		bne finished
			call unblank_screen
			movi $a1, 1		 	# killed = true
			load $t0, $fp
			addi $t0, POINTS 	# score += points
			stor $t0, $fp
		finished:

		mov $a0, $s3			# a0 = DUCK_SPRITE
		movwi $t3, CONTROLLER_A
		load $a2, $t3			# a2 = controls
		call update_duck
		
		mov $t0, $fp			# load fp
		subi $t0, 1				# point t0 to time
		load $t1, $t0
		test $t1, $t1
		sne $t0					# t0 = (time == 0)
		or $t0, $s0				# finished || t0
		bne update_round_finished
			addi $s1, 1			# rounds++
			movi $a1, 0			# killed = false
		update_round_finished:
		
		call wait_until_frame
		
		
		cmpi $s1, 3				# rounds - 3 < 0
		blt play_game_do
		
	pop $a2		# restoring saved registers
	pop $a1
	pop $a0
	pop $s3
	pop $s2
	pop $s1
	pop $s0
	addi $sp, 1	# pop time
	pop $v0		# pop score
	leave
	juc $ra							# return score
	
next_state:
	movi $t0, 0 					# next_state = 0
	cmpi $a0, NORMAL_STATE				# if (state == NORMAL_STATE)
	bne else_if_blank_screen
		cmpi $a1, 1					# if (trigger_pulled == 1)
		bne else_trigger	
			movi $t0, BLANK_SCREEN	# next_state = BLANK_SCREEN
			juc $ra
		else_trigger:				# else
			movi $t0, NORMAL_STATE		# next_state = NORMAL_STATE
			juc $ra
	else_if_blank_screen:
		cmpi $a0, BLANK_SCREEN		# else if (state = BLANK_SCREEN)
		bne else_hit
			cmpi $a2, 1				# if (gun_hit == 1)
			bne else_gun
				movi $t0, HIT		# next_state = HIT
				juc $ra
			else_gun:
				movi $t0, NORMAL_STATE
				juc $ra
	else_hit:
		movi $t0, NORMAL_STATE	
	juc $ra	

update_duck:
	frame
	mov $t0, $fp	# get frame pointer
	addi $t0, 2		# go two into the stack to get killed address
	push $a0
	push $a1
	push $a2
	push $s0
	push $s1
	push $s2
	push $s3
	push $t0		# store duck killed back to the stack
	# *duck_sprite		$a0
	#  duck_sprite_x 	$a0
	#  duck_sprite_y	$a0 + 2 = s1
	#  duck_killed 	$a1
	#  controls			$a2
	movi $s0, 0   #counter in s0
	
	# mov $t0, $a0	# t0 = duck_sprite_x
	movi $s1, 2		# s1 = 2
	add $s1, $a0 	# s1 = 2 + *duck_sprite = duck_sprite_y
	
	test $a1, $a1		# a1 & a1 returns true if a1 is 1
	beq duck_alive
	
	duck_alive:
		# if under control of p2
		movwi $t0, CONTROLLER_MASK
		and $t0, $a2
		test $t0, $t0
		beq cpu_control	# if t0 != 0, p2 is in control
		
		p2_control:
			# if(left_pressed)
			movwi $t0, CONTROL_11 # mask the 11th bit of controls to check if left pressed
			and $t0, $a2
			test $t0, $t0
			bne left_pressed
			
			# else if(right_pressed)
			movwi $t0, CONTROL_10 # mask the 10th bit of controls to check if right pressed
			and $t0, $a2
			test $t0, $t0
			bne right_pressed
			bne right_nor_left # niether right or left was pressed
					
			left_pressed:
				movwi $s2, delta_x
				movwi $t1, 0xFFFF 
				stor $t1, $s2		# delta_x = -1
				buc check_up_down
				
			right_pressed:
				movwi $s2, delta_x
				movi $t1, 0x1
				stor $t1, $s2		# delta_x = 1
				buc check_up_down
				
			right_nor_left:
				movwi $s2, delta_x
				movi $t1, 0x0
				stor $t1, $s2		# delta_x = 0
				buc check_up_down
				
			check_up_down:
				# if(up_pressed)
				movwi $t0, CONTROL_9 # mask the 9th bit of controls to check if left pressed
				and $t0, $a2
				test $t0, $t0
				bne up_pressed
				
				# else if(right_pressed)
				movwi $t0, CONTROL_8 # mask the 8th bit of controls to check if right pressed
				and $t0, $a2
				test $t0, $t0
				bne down_pressed
				bne up_nor_down # niether right or left was pressed
				
				up_pressed:
					movwi $s3, delta_y
					movwi $t1, 0xFFFF 
					stor $t1, $s3	#delta_y = -1
					buc update_pos
				down_pressed:
					movwi $s3, delta_y
					movi $t1, 0x1
					stor $t1, $s3	#delta_y = 1
					buc update_pos
				up_nor_down:
					movwi $s3, delta_y
					movi $t1, 0x0
					stor $t1, $s3	#delta_y = 0
					buc update_pos
			cpu_control:				
				cmpi $s0, 60
				bne update_pos
				# ranx = random();
				# read from 0x4809
				# if counter == 60

					movi $s0, 0x0 # counter = 0;
					call random_direction # $v0 = random delta X, $v1 = random delta Y
					stor $v0, $s2 # store new delta X into delta_x
					stor $v1, $s3 # store new delta Y into delta_y
				
			update_pos:
				# check x bounds
				# if( (duck.x(a0) + delta_x(s2)) != SCR_WIDTH )
				mov $t0, $a0
				mov $t1, $s2
				add $t0, $t1 # duck.x(a0) + delta_x(s2)
				movwi $t1, SCR_WIDTH
				cmp  $t0, $t1
				beq reverse_x # else if at right screen bound
				# within bounds
				add $a0, $s2
				buc check_y_bounds
				check_y_bounds:
					#if( (duck.y(s1) + delta_y(s3)) != SCR_HEIGHT)
					mov $t0, $s1
					mov $t1, $s3
					add $t0, $t1
					movwi $t1, SCR_HEIGHT
					cmp  $t0, $t1 # else if at bottom screen bound
					beq reverse_y
					# within bounds
					add $s1, $s3
					buc set_update_sprite_args
					reverse_x:	
						# delta_x = -1;
						movwi $s2, delta_x
						movwi $t1, 0xFFFF 
						stor $t1, $s2		# delta_x = -1
						buc set_update_sprite_args
			
					reverse_y:
						# delta_y = -1;
						movwi $s3, delta_y
						movwi $t1, 0xFFFF 
						stor $t1, $s3	# delta_y = -1
						buc set_update_sprite_args
				set_update_sprite_args:
					# *duck already stored in a0
					mov $a1, $s2 # move delta_x to a1
					mov $a2, $s3 # move delta_y to a2
					call update_duck_sprite
					# increment counter;
					addi $s0, 1
					buc end # leave function
		
		
	end:
	pop $t0		# killed state gets popped off the stack 
				# first to make sure the stack is the way
				# the caller had it.
	pop $s3
	pop $s2
	pop $s1
	pop $s0
	pop $a2
	pop $a1
	pop $a0
	leave
	juc $ra
	
random_direction:
	movi $v0, 0 # x = 0
 	movi $v1, 0 # y = 0
	
	movwi $t0, RANDOM_NUMBER # load a random number
	load $t1, $t0
	andi $t1, 7
	
	movwi $t2, random_dir_case
	add $t2, $t1
	juc $t2
	
	random_dir_case:
		buc random_dir_up
		buc random_dir_down
		buc random_dir_left
		buc random_dir_right
		buc random_dir_up_left
		buc random_dir_up_right
		buc random_dir_down_left
		buc random_dir_down_right
	
	random_dir_up:
		subi $v1, 1
		buc random_dir_finish
	random_dir_down:
		addi $v1, 1
		buc random_dir_finish
	random_dir_left:
		subi $v0, 1
		buc random_dir_finish
	random_dir_right:
		addi $v1, 1
		buc random_dir_finish
	random_dir_up_left:
		subi $v0, 1
		subi $v1, 1
		buc random_dir_finish
	random_dir_up_right:
		addi $v0, 1
		subi $v1, 1
		buc random_dir_finish
	random_dir_down_left:
		subi $v0, 1
		addi $v1, 1
		buc random_dir_finish
	random_dir_down_right:
		addi $v0, 1
		addi $v1, 1
	random_dir_finish:
	juc $ra
	
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
	
blank_screen:
	movwi $t0, BACKGROUND_PALETTE
	movwi $t1, BACKGROUND_BLANK_PALETTE
	stor $t1, $t0
	
	movwi $t3, DUCK_SPRITE
	addi  $t3, 1
	load $t0, $t3
	movwi $t2, DUCK_BLANK_OR_MASK
	or	 $t0, $t2
	movwi $t2, DUCK_BLANK_AND_MASK
	and  $t0, $t2
	stor $t0, $t3
	juc $ra
	
unblank_screen:
	movwi $t0, BACKGROUND_PALETTE
	movwi $t1, BACKGROUND_NORMAL_PALETTE
	stor $t1, $t0
	
	movwi $t3, DUCK_SPRITE
	addi  $t3, 1
	load $t0, $t3
	movwi $t2, DUCK_NORMAL_OR_MASK
	or	 $t0, $t2
	movwi $t2, DUCK_NORMAL_AND_MASK
	and  $t0, $t2
	stor $t0, $t3
	juc $ra

# string_to_screen
	string_to_screen:
	# a0 pointer to start of string
	# a1 X coordinate of first character
	# a2 Y coordinate of first character
	# pointer to start of string sprites must have been pushed to stack, 
	# typically 0x2300 is available for this purpose
	frame
	mov $t0, $fp			# get frame pointer address
	addi $t0, 2				# go back 2 into the heap
	load $t0, $t0			# load address for sprites into $t0
	push $a0
	push $a1
	push $a2
	# TODO: ADD CODE
	pop $a2
	pop $a1
	pop $a0
	leave
	juc $ra
		
# update duck sprite	
	update_duck_sprite:
	# a0 pointer to duck sprite
	# a1 delta x
	# a2 delta y
	# killed state has been pushed to the stack
		frame
		mov $t0, $fp			# get frame pointer address
		addi $t0, 2				# go back 2 into the heap
		load $t1, $t0 			# load killed state from that location, t1 = killed
		push $s0				# store s0 so it can be used for calculations
		push $s1				# store s1 so it can be used for calculations
		push $s2				# store s2 so it can be used for calculations
		mov   $t0, $a0			# t0 = duck sprite address
		addi  $t0, 1			# t0 = addr+ 1
		cmpi $t1, 1				# check if duck is dead
		beq dead_duck			# branch to dead duck code
		movwi $s0, animation_counter		# get address for animation counter
		load $t2, $s0			# load value from that address
		movwi $s1, sprite_frame				# get address for sprite frame counter
		load $t3, $s1			# load value from that address
		cmpi $t2, 5				# check if cycles to next frame have been met
		bge  next_sprite_frame	# if so, change frame, and reset counter
		addi $t2, 1				# if not, increment counter
		buc	 end_counter_logic	# go to sprite selection logic
	next_sprite_frame:			# code to change animation frame
		movi $t2, 0				# reset animation_counter
		cmpi $t3, 3				# check if animation cycle is complete
		bge  reset_sprite_frame	# if so reset animation cycle
		addi $t3, 1				# if not move to next animation frame
		buc  end_counter_logic	# go to sprite selection logic
	reset_sprite_frame:			# code to reset animation cycle
		movi $t3, 0				# reset sprite_frame
	end_counter_logic:			# after this point the correct sprite will be selected
		cmpi $a1, 0				# check delta x
		blt west				# left flying duck
		bgt east				# right flying duck
		buc vertical			# vertically flying duck
	dead_duck:					# code for dead duck animation
			movwi $s0, dead_counter # get address for dead animation counter
			load $t2, $s0			# load value from that address, $t2 = animation count
			movwi $s1, dead_frame   # get address for dead frame counter
			load $t3, $s1			# load value from that address, $t3 = frame count
			cmpi $t2, 15			# check if cycles to next frame have been met
			bge  next_dead_frame	# if so, chane frame, and reset counter
			addi $t2, 1				# if not, increment counter
			buc	 end_dead_counter_logic # go to dead sprite selection logic
		next_dead_frame:			# code to change animation frame
			movi $t2, 0				# reset dead counter
			cmpi $t3, 4				# check if animation cycle is complete
			bgt  reset_dead_frame	# if so, reset animation cycle, and return dead on v0
			addi $t3, 1				# if not, increment dead frame
			buc  end_dead_counter_logic # go to dead sprite selection logic
		reset_dead_frame:			# code to reset death animation, for next duck to die
			movi $v0, 0				# duck is done dying, return 0 to caller know
			movi $t3, 0				# reset dead frame
		end_dead_counter_logic:		# code for dead sprite selection
			cmpi  $t3,0				# check current animation frame
			beq  dead_duck_1		# if zero, use dead duck frame 1 (shot)
			cmpi  $t3, 1			# check current animation frame
			beq  dead_duck_2		# if one, use dead duck frame 2 (sideways, bloody)
			cmpi  $t3, 2			# check current animation frame
			beq  dead_duck_3		# if two, use dead duck frame 3 (sideways, exploding)
			buc  dead_duck_4		# else use dead duck frame 4 (explosion decay)
			dead_duck_1:			# code for dead duck sprite 1 (shot)
				load  $t1, $t0		# load the current sprite settings from addr+1
				movwi $s3, 0x0103	# get value for masking 1's for correct sprite
				or    $t1, $s3		# mask in the 1's
				movwi $s3, 0xFF03	# get value for masking 0's for correct sprite
				and   $t1, $s3		# mask in the 0's
				stor  $t0, $t1		# store the sprite to memory
				buc end_dead_duck_sprite # end dead duck code
			dead_duck_2:			# code for dead duck sprite 2 (sideways, bloody)
				load  $t1, $t0		# load the current sprite settings from addr+1
				movwi $s3, 0x0183	# get value for masking 1's for correct sprite
				or    $t1, $s3		# mask in the 1's
				movwi $s3, 0xFF83	# get value for masking 0's for correct sprite
				and   $t1, $s3		# mask in the 0's
				stor  $t0, $t1		# store the sprite to memory
				buc end_dead_duck_sprite # end dead duck code
			dead_duck_3:			# clode for dead duck sprite 3 (exploding)
				load  $t1, $t0		# load the current sprite settings from addr+1
				movwi $s3, 0x0109	# get value for masking 1's for correct sprite
				or    $t1, $s3		# mask in the 1's
				movwi $s3, 0xFF09	# get value for masking 0's for correct sprite
				and   $t1, $s3		# mask in the 0's
				stor  $t0, $t1		# store the sprite to memory
				buc end_dead_duck_sprite # end dead duck code
			dead_duck_4:			# code for dead duck sprite 4 (explosion decay)
				load  $t1, $t0		# load the current sprite settings from addr+1
				movwi $s3, 0x0189	# get value for masking 1's for correct sprite
				or    $t1, $s3		# mask in the 1's
				movwi $s3, 0xFF89	# get value for masking 0's for correct sprite
				and   $t1, $s3		# mask in the 0's
				stor  $t0, $t1		# store the sprite to memory
				buc end_dead_duck_sprite # end dead duck code
		end_dead_duck_sprite:		# dead dead duck code
			stor $s0, $t2			# store dead animation counter back to memory
			stor $s1, $t3			# store dead frame counter back to memory
			buc  end_update_duck_sprite # end sprite update 
		west:						# code for west flying duck, first set HFLIP hi
			addi $t0, 2				# add 2 to get to addr + 3 
			load $t1, $t0			# load the value from that location into t1
			movwi $s2, HFLIP_MASK	# $s2 = 0000 0000 0001 0000		
			or   $t1, $s2			# $t1 = xxxx xxxx xxx1 xxxx
			stor $t1, $t0			# store HFLIP change to memory
			subi $t0, 2				# put t0 back to addr + 1
			cmpi $a2, 0				# check delta y
			blt  angular			# if less than zero duck is flying at a northerly angle
			buc  sideways			# all other west facing ducks will use the sideways sprite
		east:						# code for east flying duck, first set HFLIP low
			addi $t0, 2				# add 2 to get to addr + 3 
			load $t1, $t0			# load the value from that location into t1
			movwi $s2, HFLIP_MASK	# $s2 = 0000 0000 0001 0000		
			not  $s2				# $s2 = 1111 1111 1110 1111
			and  $t1, $s2			# $t1 = xxxx xxxx xxx0 xxxx
			stor $t1, $t0			# store HFLIP change to memory
			subi $t0, 2				# put t0 back to addr + 1
			cmpi $a2, 0				# check delta y
			blt  angular			# if less than zero duck is flying at a northerly angle
			buc  sideways			# all other east flying ducks will use the sideways sprite
		vertical:					# code for straight north, or south ducks
			cmpi $t3, 1				# check current animation frame
			beq  vertical_duck_2	# if two use vertical sprite #2	(wings up)
			vertical_duck_1:		# code for vertical sprite #1 (wings down)
				load  $t1, $t0		# load the current sprite settings from addr +1
				movwi $s3, 0x000D	# get value for masking 1's for correct sprite
				or    $t1, $s3		# mask in the 1's
				movwi $s3, 0xFF0D	# get value for masking 0's for correct sprite
				and   $t1, $s3		# mask in the 0's
				stor   $t0, $t1     # store the sprite to memory
				buc   end_living_duck # end living duck code
			vertical_duck_2:		# code for vertical sprite #2 (wings up)
				load  $t1, $t0		# load the current sprite settings from addr +1
				movwi $s3, 0x008D	# get value for masking 1's for correct sprite
				or    $t1, $s3		# mask in the 1's
				movwi $s3, 0xFF8D	# get value for masking 0's for correct sprite# correct duck
				and   $t1, $s3		# mask in the 0's
				stor   $t0, $t1		# store the sprite to memory
				buc   end_living_duck # end living duck code
		angular:					# code for angular (north-east or north-west) flying ducks
			cmpi  $t3, 1			# check the current animation frame
			beq   angular_duck_2	# if two use angular sprite #2 (wings up)
			angular_duck_1:			# code for angular sprite #1 (wings down)
				load  $t1, $t0		# load the current sprite settings from addr+1
				movwi $s3, 0x0007	# get the value for masking 1's for correct sprite
				or    $t1, $s3		# mask in the 1's
				movwi $s3, 0xFF07	# get the value for masking 0's for correct sprite
				and   $t1, $s3		# mask in the 0's
				stor  $t0, $t1		# store sprite to memory
				buc	  end_living_duck # end living duck code
			angular_duck_2:			# code for angular sprite #2 (wings up)
				load  $t1, $t0		# load the current sprite settings from addr+1
				movwi $s3, 0x0087	# get the value for masking 1's for correct sprite
				or    $t1, $s3		# mask in the 1's
				movwi $s3, 0xFF87	# get the value for masking 0's for correct sprite
				and   $t1, $s3		# mask in the 0's
				stor  $t0, $t1		# store sprite to memory
				buc   end_living_duck # end living duck code
			sideways:				# code for sideways flying duck(east, west, south-east, south west)
			cmpi $t3, 1				# check the current animation frame
			beq  sideways_duck_2	# if two use sideways  sprite #2 (wings up)
			sideways_duck_1:		# code for sideways sprite #1 (wings down)
				load  $t1, $t0		# load the current sprite settings from addr+1
				movwi $s3, 0x0001	# get the value for masking 1's for the correct sprite
				or    $t1, $s3		# mask in the 1's
				movwi $s3, 0xFF01	# get the value for masking 0's for the correct sprite
				and   $t1, $s3		# mask in the 0's
				stor   $t0, $t1		# store sprite to memory
				buc   end_living_duck # end living duck code
			sideways_duck_2:		# code for sideways sprite #2 (wings up)
				load  $t1, $t0		# load the current sprite settings from addr+1
				movwi $s3, 0x0008	# get the value for masking 1's for the correct sprite
				or    $t1, $s3		# mask in the 1's
				movwi $s3, 0xFF08	# get the value for masking 0's for the correct sprite
				and   $t1, $s3		# mask in the 0's
				stor   $t0, $t1		# store sprite to memory
				buc   end_living_duck # end living duck code
		end_living_duck:		# end living duck sprite
		stor $s0, $t2				# store animation counter back to memory
		stor $s1, $t3				# store frame counter back to memory
		end_update_duck_sprite:		# end update duck sprite
		pop $s2						# restore s2
		pop $s1						# restore s1
		pop $s0						# restore s0
		leave						
		juc $ra
		
	# number_to_screen
	number_to_screen:
	# a0 register containing number to be shown
	# a1 X coordinate of first digit
	# a2 Y coordinate of first digit
	# pointer to start of sprites to display the number must have been 
	# pushed to the stack.  typically 0x2380 is available for this purpose
	frame
	mov $t0, $fp			# get frame pointer address
	addi $t0, 2				# go back 2 into the heap
	load $t0, $t0			# load address for sprites into $t0
	push $a0
	push $a1
	push $s0
	# from here to 'number_done' is an unrolled loop
	check_60000:
		movwi $t1, 0xEA60		# load the decimal value 60000 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 60000
		blt check_50000			# if the value is less than 6000, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0810		# set data for a 6 sprite(
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_X9000			# branch to 9000 check
	check_50000:
		movwi $t1, 0xC350		# load the decimal value 50000 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 50000
		blt check_40000			# if the value is less than 50000, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0610		# set data for a 5 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_X9000
	check_40000:
		movwi $t1, 0x9C40		# load the decimal value 40000 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 40000
		blt check_30000			# if the value is less than 40000, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0410		# set data for a 4 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_X9000
	check_30000:
		movwi $t1, 0x7530		# load the decimal value 30000 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 30000
		blt check_20000			# if the value is less than 30000, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0A00		# set data for a 3 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_X9000
	check_20000:
		movwi $t1, 0x4E20		# load the decimal value 20000 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 20000
		blt check_10000			# if the value is less than 20000, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0800		# set data for a 2 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_X9000
	check_10000:
		movwi $t1, 0x2710		# load the decimal value 10000 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 10000
		blt check_0XXXX				# if the value is less than 10000, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0600		# set data for a 1 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_X9000
	check_0XXXX:
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0400		# set data for a 0 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
	check_X9000:
		movwi $t1, 0x2328		# load the decimal value 9000 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 9000
		blt check_X8000			# if the value is less than 9000, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0620		# set data for a 9 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XX900relay
	check_X8000:
		movwi $t1, 0x1F40		# load the decimal value 8000 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 8000
		blt check_X7000			# if the value is less than 8000, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0420		# set data for a 8 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XX900relay
	check_X7000:
		movwi $t1, 0x1B58		# load the decimal value 7000 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 7000
		blt check_X6000			# if the value is less than 7000, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0A10		# set data for a 7 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XX900relay
	check_X6000:
		movwi $t1, 0x1770		# load the decimal value 6000 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 6000
		blt check_X5000			# if the value is less than 6000, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0810		# set data for a 6 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XX900relay
	check_XX900relay:
		buc check_XX900
	check_X5000:
		movwi $t1, 0x1388		# load the decimal value 5000 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 5000
		blt check_X4000			# if the value is less than 5000, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0610		# set data for a 5 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XX900
	check_X4000:
		movwi $t1, 0x0FA0		# load the decimal value 40000 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 40000
		blt check_X3000			# if the value is less than 40000, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0410		# set data for a 4 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XX900
	check_X3000:
		movwi $t1, 0x0BB8		# load the decimal value 3000 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 3000
		blt check_X2000			# if the value is less than 3000, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x07D0		# set data for a 3 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XX900
	check_X2000:
	movwi $t1, 0x07D0		# load the decimal value 2000 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 2000
		blt check_X1000			# if the value is less than 2000, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0800		# set data for a 2 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XX900
	check_X1000:
		movwi $t1, 0x03E8		# load the decimal value 10000 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 10000
		blt X0XXX				# if the value is less than 10000, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0600		# set data for a 1 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XX900
	X0XXX:
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0400		# set data for a 0 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
	check_XX900:
		movwi $t1, 0x2328		# load the decimal value 900 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 900
		blt check_XX800			# if the value is less than 900, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0620		# set data for a 9 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXX90relay
	check_XX800:
		movwi $t1, 0x1F40		# load the decimal value 800 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 800
		blt check_XX700			# if the value is less than 800, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0420		# set data for a 8 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXX90relay
	check_XX700:
		movwi $t1, 0x1F40		# load the decimal value 700 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 700
		blt check_XX600			# if the value is less than 700, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0A10		# set data for a 7 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXX90relay
	check_XX600:
		movwi $t1, 0xEA60		# load the decimal value 600 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 600
		blt check_XX500			# if the value is less than 600, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0810		# set data for a 6 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXX90relay
	check_XXX90relay:
		buc check_XXX90
	check_XX500:
		movwi $t1, 0xC350		# load the decimal value 500 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 500
		blt check_XX400			# if the value is less than 500, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0610		# set data for a 5 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXX90
	check_XX400:
		movwi $t1, 0x9C40		# load the decimal value 400 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 400
		blt check_XX300			# if the value is less than 400, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0410		# set data for a 4 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXX90
	check_XX300:
		movwi $t1, 0x7530		# load the decimal value 300 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 300
		blt check_XX200			# if the value is less than 300, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0A00		# set data for a 3 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXX90
	check_XX200:
		movwi $t1, 0x4E20		# load the decimal value 200 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 200
		blt check_XX100			# if the value is less than 200, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0800		# set data for a 2 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXX90
	check_XX100:
		movwi $t1, 0x2710		# load the decimal value 100 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 100
		blt XX0XX				# if the value is less than 100, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0600		# set data for a 1 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXX90
	XX0XX:
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0400		# set data for a 0 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
	check_XXX90:
		movwi $t1, 0x2328		# load the decimal value 90 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 90
		blt check_XXX80			# if the value is less than 90, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0620		# set data for a 9 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXXX9relay
	check_XXX80:
		movwi $t1, 0x1F40		# load the decimal value 80 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 80
		blt check_XXX70			# if the value is less than 80, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0420		# set data for a 8 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXXX9relay
	check_XXX70:
		movwi $t1, 0x1F40		# load the decimal value 70 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 70
		blt check_XXX60			# if the value is less than 70, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0A10		# set data for a 7 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXXX9relay
	check_XXX60:
		movwi $t1, 0xEA60		# load the decimal value 60 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 60
		blt check_XXX50			# if the value is less than 60, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0810		# set data for a 6 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXXX9relay
	check_XXXX9relay:
		buc check_XXXX9
	check_XXX50:
		movwi $t1, 0xC350		# load the decimal value 50 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 50
		blt check_XXX40			# if the value is less than 50, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0610		# set data for a 5 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXXX9
	check_XXX40:
		movwi $t1, 0x9C40		# load the decimal value 40 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 40
		blt check_XXX30			# if the value is less than 40, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0410		# set data for a 4 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXXX9
	check_XXX30:
		movwi $t1, 0x7530		# load the decimal value 30 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 30
		blt check_XXX20			# if the value is less than 30, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0A00		# set data for a 3 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXXX9
	check_XXX20:
		movwi $t1, 0x4E20		# load the decimal value 20 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 20
		blt check_XXX10			# if the value is less than 20, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0800		# set data for a 2 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXXX9
	check_XXX10:
		movwi $t1, 0x2710		# load the decimal value 10 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 10
		blt XXX0X			# if the value is less than 10, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0600		# set data for a 1 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc check_XXXX9
	XXX0X:
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0400		# set data for a 0 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
	check_XXXX9:
		movwi $t1, 0x2328		# load the decimal value 9 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 9
		blt check_XXXX8				# if the value is less than 9, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0620		# set data for a 9 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc number_done_relay
	check_XXXX8:
		movwi $t1, 0x1F40		# load the decimal value 8 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 8
		blt check_XXXX7			# if the value is less than 8, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0420		# set data for a 8 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc number_done_relay
	check_XXXX7:
		movwi $t1, 0x1F40		# load the decimal value 7 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 7
		blt check_XXXX6			# if the value is less than 70, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0A10		# set data for a 7 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc number_done_relay
	check_XXXX6:
		movwi $t1, 0xEA60		# load the decimal value 6 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 6
		blt check_XXXX5			# if the value is less than 6, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0810		# set data for a 6 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc number_done_relay
	number_done_relay:
		buc number_done
	check_XXXX5:
		movwi $t1, 0xC350		# load the decimal value 5 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 5
		blt check_XXXX4				# if the value is less than 5, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0610		# set data for a 5 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc number_done
	check_XXXX4:
		movwi $t1, 0x9C40		# load the decimal value 4 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 4
		blt check_XXXX3			# if the value is less than 4, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0410		# set data for a 4 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc number_done
	check_XXXX3:
		movwi $t1, 0x7530		# load the decimal value 3 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 3
		blt check_XXXX2			# if the value is less than 3, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0A00		# set data for a 3 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc number_done
	check_XXXX2:
		movwi $t1, 0x4E20		# load the decimal value 2 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 2
		blt check_XXXX1			# if the value is less than 2, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0800		# set data for a 2 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc number_done
	check_XXXX1:
		movwi $t1, 0x2710		# load the decimal value 10 into $t1
		cmp	$a0, $t1			# check what a0 is in relation to 10
		blt XXXX0		# if the value is less than 10, skip to next check
		sub $a0, $t1			# subtract for future number calculations
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0600		# set data for a 1 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location for next sprite
		buc number_done
	XXXX0:
		stor $a1, $t0			# set x coordinate for sprite
		addi $t0, 1				# increment to addr + 1
		movwi $t1, 0x0400		# set data for a 0 sprite
		stor $t0, $t1			# put sprite into addr + 1
		addi $t0, 1				# increment to addr +2
		stor $t0, $a2			# set y coordinate for sprite
		addi $t0, 1				# increment to addr +3
		movwi $t1, 0x0120		# set data for addr +3
		addi $t0, 1				# increment to next sprite
		addi $a1, 8				# move to XY location 
	number_done:	
	pop $s0
	pop $a1
	pop $a0
	leave
	juc $ra

.data
	delta_x: 0x0
	delta_y: 0x0
	animation_counter: 0 # counter used to determine when to switch frame for animation
	sprite_frame: 0 # counter for current frame
	dead_counter: 0 # a counter for duck death animation
	dead_frame: 0 # counter for current dead duck frame