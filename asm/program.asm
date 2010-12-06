# snes controller
.define CONTROLLER_A 0x480a
# nes zapper
.define CONTROLLER_B 0x480b
.define DUCK_SPRITE 0x2000
.define ROUND_TIME 600
.define NORMAL 1
.define HIT 2
.define BLANK_SCREEN 3
.define POINTS 5

.define DUCK_SIZE_X 		32
.define DUCK_SIZE_Y		24
.define SCR_WIDTH			640
.define SCR_HEIGHT		250
.define CONTROLLER_MASK 0xF000
.define CONTROL_11 		0x0800
.define CONTROL_10 		0x0400
.define CONTROL_9  		0x0200
.define CONTROL_8  		0x0100
.define RANDOM_DIRMASK 7
.define RANDOM 			0x4809

.define GPU_SR 0x4800
.define VBRIGHT 1

.define bit11hi 2048

.text
main:					# while(true)
	call draw_splash	# draw_splash();
	call play_game		
	mov $a0, $v0		# int score = play_game();
	call draw_result	# draw_result(score)
	buc main
	
draw_splash:
	juc $ra
	# splash screen code here

draw_result:
	juc $ra
	
play_game:
	frame
	movi $t0, 0 			# score = 0
	push $t0
	movwi $t1, ROUND_TIME	# time = 600
	push $t1
	push $s0
	push $s1
	push $s2
	push $s3
	push $a0
	push $a1
	push $a2 
	movi $s0, 0					# finished = false 
	movi $s1, 0					# rounds = 0  
	movwi $s3, DUCK_SPRITE	# duck = 0x2000	
	movi $a1, 0 				# killed = 0	
	movi $s2, NORMAL			# state = NORMAL
	
	# must define points variable
	play_game_do:
		mov $t0, $fp
		subi $t0, 1
		load $t1, $t0
		subi $t1, 1				# time--
		stor $t1, $t0
		
		push $a1	 			# save killed to stack
		mov $a0, $s2
		movwi $t2, CONTROLLER_B # shot and hit are stored consecutively in memory at CONT_B
		load $a1, $t2		# a1 = shot
		addi $t2, 1			
		load $a2, $t2		# a2 = hit
		# need to set a1 to trigger and a2 to hit
		call next_state			# state = next_state(state)
		mov $s2, $v0
		pop $a1					# load killed from stack
		cmpi $s2, BLANK_SCREEN
		bne else_if_hit
			mov $a0, $s3		# a0 = DUCK_SPRITE
			call blank_screen
			buc finished
		else_if_hit:
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
	cmpi $a0, NORMAL				# if (state == NORMAL)
	bne else_if_blank_screen
		cmpi $a1, 1					# if (trigger_pulled == 1)
		bne else_trigger	
			movi $t0, BLANK_SCREEN	# next_state = BLANK_SCREEN
			juc $ra
		else_trigger:				# else
			movi $t0, NORMAL		# next_state = NORMAL
			juc $ra
	else_if_blank_screen:
		cmpi $a0, BLANK_SCREEN		# else if (state = BLANK_SCREEN)
		bne else_hit
			cmpi $a2, 1				# if (gun_hit == 1)
			bne else_gun
				movi $t0, HIT		# next_state = HIT
				juc $ra
			else_gun:
				movi $t0, NORMAL
				juc $ra
	else_hit:
		movi $t0, NORMAL	
	juc $ra	

update_duck:
	frame
	push $a0
	push $a1
	push $a2
	push $s0
	push $s1
	push $s2
	push $s3
	#get duck killed
	# *duck_sprite		$a0
	#  duck_sprite_x 	$a0
	#  duck_sprite_y	$a0+1 = s1
	#  duck_killed 	$a1
	#  controls			$a2
	movi $s0, 0   #counter in s0
	
	#mov $t0, $a0	# t0 = duck_sprite_x
	movi $s1, 1		# s1 = 1
	add $s1, $a0 	# s1 = 1 + *duck_sprite = duck_sprite_y
	
	test $a1, $a1		# a1 & a1 returns true if a1 is 1
	beq duck_alive
	
	duck_alive:
		# if under control of p2
		movwi $t0, CONTROLLER_MASK
		and $t0, $a2 
		test $t0, $t0
		movwi $t1, cpu_control
		beq cpu_control	#if t1 != 0, p2 is in control 				
		
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
				stor $t1, $s2		#delta_x = -1
				buc check_up_down
				
			right_pressed:
				movwi $s2, delta_x
				movi $t1, 0x1
				stor $t1, $s2		#delta_x = 1
				buc check_up_down
				
			right_nor_left:
				movwi $s2, delta_x
				movi $t1, 0x0
				stor $t1, $s2		#delta_x = 0
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
				#ranx = random();
				# read from 0x4809
				#if counter == 60

					movi $s0, 0x0 # counter = 0;
					call random_direction # $v0 = random delta X, $v1 = random delta Y
					stor $v0, $s2 # store new delta X into delta_x
					stor $v1, $s3 # store new delta Y into delta_y
				
			update_pos:
				# check x bounds
				# if( (duck.x(a0) + delta_x(s2)) != SCR_WIDTH )
				mov $t0, $a0
				mov $t1, $s2
				add $t0, $t1 #duck.x(a0) + delta_x(s2)
				cmpi $t0, SCR_WIDTH 
				beq reverse_x #else if at right screen bound
				# within bounds
				add $a0, $s2
				buc check_y_bounds
				check_y_bounds:
					#if( (duck.y(s1) + delta_y(s3)) != SCR_HEIGHT)
					mov $t0, $s1
					mov $t1, $s3
					add $t0, $t1
					cmpi $t0, SCR_HEIGHT #else if at bottom screen bound
					beq reverse_y
					# within bounds
					add $s1, $s3
					buc set_update_sprite_args
					reverse_x:	
						# delta_x = -1;
						movwi $s2, delta_x
						movwi $t1, 0xFFFF 
						stor $t1, $s2		#delta_x = -1
						buc set_update_sprite_args
			
					reverse_y:
						# delta_y = -1;
						movwi $s3, delta_y
						movwi $t1, 0xFFFF 
						stor $t1, $s3	#delta_y = -1
						buc set_update_sprite_args
				set_update_sprite_args:
					# *duck already stored in a0
					mov $a1, $s2 #move delta_x to a1
					mov $a2, $s3 #move delta_y to a2
					call update_duck_sprite
					#increment counter;
					addi $s0, 1
					buc end #leave function
		
		
	end:
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
	
	movwi $t0, RANDOM # load a random number
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
	movi $t1, BLANK_PALETTE
	stor $t1, $t0
	
	movwi $t3, DUCK_SPRITE
	movi $t2, DUCK_BLANK_PALETTE
	stor $t2, $t3
	juc $ra
	
unblank_screen:
	movwi $t0, BACKGROUND_PALETTE
	movi $t1, BACKGROUND_NORMAL_PALETTE
	stor $t1, $t0
	
	movwi $t3, DUCK_SPRITE
	movi $t2, DUCK_NORMAL_PALETTE
	stor $t2, $t3
	juc $ra
		
# update duck sprite	
	update_duck_sprite:
	# a0 pointer to duck sprite
	# a1 delta x
	# a2 delta y
		frame
		push $s0
		push $s1
		mov $t0,$fp
		addi $t0,2
		load $t1, $t0 			# t1 = killed
		mov   $t0, $a0			# t0 = duck sprite address
		addi  $t0, 1
		cmpi $t1, 1
		beq dead_duck
		movwi $s0, counter
		load $t2, $s0
		movwi $s1, sprite_frame
		load $t3, $s1
		cmpi $t2, 15			# cycles to next animation frame
		bge  next_sprite_frame
		addi $t2, 1
		buc	 end_counter_logic
	next_sprite_frame:
		movi $t2, 0				# reset counter
		cmpi $t3, 3
		bge  reset_sprite_frame
		addi $t3, 1
		buc  end_counter_logic
	reset_sprite_frame:
		movi $t3, 0				# reset frame
	end_counter_logic:
		cmpi $a2, 0
		blt  north
		bgt  south
		cmpi $a1, 0
		blt west				# left flying duck
		bgt east				# right flying duck
		buc vertical			# vertically flying duck
	dead_duck:
			movwi $s0, dead_counter
			load $t2, $s0			# $t2 = dead counter
			movwi $s1, dead_frame
			load $t3, $s1			# t3 = dead frame
			cmpi $t2, 15			# cycles to next animation frame
			bge  next_dead_frame
			addi $t2, 1
			buc	 end_dead_counter_logic
		next_dead_frame:
			movi $t2, 0				# reset counter
			cmpi $t3, 4
			bge  reset_dead_frame
			addi $t3, 1
			buc  end_dead_counter_logic
		reset_dead_frame:
			movi $t3, 0				# reset frame
		end_dead_counter_logic:
			cmpi  $t2,0
			beq  dead_duck_1
			cmpi  $t2, 1
			beq  dead_duck_2
			cmpi  $t2, 2
			beq  dead_duck_3
			cmpi  $t2, 3
			beq  dead_duck_4
			movi $v0, 0
			buc  dead_duck_4
			dead_duck_1:
				movwi $t1, 45064		# dead duck frame 1
				stor  $t0, $t1			
				buc end_dead_duck_sprite
			dead_duck_2:
				movwi $t1, 46088		# dead duck frame 2
				stor  $t0, $t1			
				buc end_dead_duck_sprite
			dead_duck_3:
				movwi $t1, 47112		# dead duck frame 3
				stor  $t0, $t1			
				buc end_dead_duck_sprite
			dead_duck_4:
				movwi $t1, 48136		# dead duck frame 4
				stor  $t0, $t1			
				buc end_dead_duck_sprite
		end_dead_duck_sprite:
			movwi $t0, counter
			stor $s0, $t0
			movwi $t0, sprite_frame
			stor $s1, $t0
			buc  end_update_duck_sprite
		west:
			mov	 $t0, $a0			# get address of duck sprite
			addi $t0, 3				# add 3 to get to addr + 3 
			load $t1, $t0			# load the value from that location into t1
			movwi $s2, bit11hi		# $s2 = 0000 1000 0000 0000		
			or   $t1, $s2			# $t1 = xxxx 1xxx xxxx xxxx
			mov	 $t0, $a0			# get the address back into $t0	
			addi $t0, 3				# add 3 again
			stor $t0, $t1			# store t1 back where it came from
			cmpi $a2, 0
			bgt  angular
			buc  sideways
		east:
			mov	 $t0, $a0			# get address of duck sprite
			addi $t0, 3				# add 3 to get to addr + 3 
			load $t1, $t0			# load the value from that location into t1
			movwi $s2, bit11hi		# $s2 = 0000 1000 0000 0000
			not	  $s2				# $s2 = 1111 0111 1111 1111
			and   $t1, $s2			# $t1 = xxxx 0xxx xxxx xxxx
			mov	 $t0, $a0			# get the address back into $t0	
			addi $t0, 3				# add 3 again
			stor $t0, $t1			# store t1 back where it came from
			cmpi $a2, 0
			bgt  angular
			buc  sideways
		angular:
			cmpi  $t2,0
			beq   angular_duck_1
			cmpi  $t2, 2
			beq   angular_duck_3
			angular_duck_2_and_4:
				movwi $t1, 17416		# angular duck frame 2 and 4
				stor  $t0, $t1		
				buc   end_living_duck
			angular_duck_1:
				movwi $t1, 16392		# angular duck frame 1
				stor  $t0, $t1		
				buc	  end_living_duck
			angular_duck_3:
				movwi $t1, 18440		# angular duck frame 3
				stor  $t0, $t1		
				buc   end_living_duck
		sideways:
			cmpi $t2, 0
			beq  sideways_duck_1
			cmpi $t2, 2
			beq  sideways_duck_3
			sideways_duck_2_and_4:
				movwi  $t1, 5128		# sideways duck fram 2 & 4
				stor   $t0, $t1
				buc   end_living_duck
			sideways_duck_1:
				movwi  $t1, 4104		# sideways duck frame 1
				stor   $t0, $t1
				buc   end_living_duck
			sideways_duck_3:
				movwi  $t1, 6152		# sideways duck frame 3
				stor   $t0, $t1
				buc   end_living_duck
		vertical:
			cmpi $t2, 0
			beq  vertical_duck_1
			cmpi $t2, 2
			beq  vertical_duck_3
			vertical_duck_2_and_4:
				movwi  $t1, 29704		# vertical duck fram 2 & 4
				stor   $t0, $t1
				buc   end_living_duck
			vertical_duck_1:
				movwi  $t1, 28680		# vertical duck frame 1
				stor   $t0, $t1
				buc   end_living_duck
			vertical_duck_3:
				movwi  $t1, 30728		# vertical duck frame 3
				stor   $t0, $t1
				buc   end_living_duck
		end_living_duck_sprite:
		movwi $t0, counter
		stor $s0, $t0
		movwi $t0, sprite_frame
		stor $s1, $t0
		end_update_duck_sprite:
		pop $s2
		pop $s1
		pop $s0
		leave
		juc $ra
.data
	delta_x: 0x0
	delta_y: 0x0
	counter: 0 # a counter used to determine
	animation_counter:	# counter  
	# when to switch to a frame for animation
	sprite_frame: 0 # state machine for current frame
	dead_counter: 0 # a counter for duck death animation
	dead_frame: 0 # state machine for current dead duck frame




