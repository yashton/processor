.define CONTROLLER_A 0x480a
.define DUCK_SPRITE 0x2000
.define ROUND_TIME 600
.define C 1
.define HIT 2
.define BLANK_SCREEN 3
.define POINTS 5
main:					# while(true)
	call draw_splash	# draw_splash();
	call play_game		
	mov $a0, $v0		# int score = play_game();
	call draw_result	# draw_result(score)
	buc main
	
play_game:
	frame
	movi $t0, 0 			# score = 0
	push $t0
	movi $t1, ROUND_TIME	# time = 600
	push $t1
	push $s0
	push $s1
	push $s2
	push $s3
	push $a0
	push $a1
	push $a2 
	movi $s0, 0				# finished = false 
	movi $s1, 0				# rounds = 0  
	movwi $s3, DUCK_SPRITE	# duck = 0x2000
	movi $a1, 0 			# killed = 0	
	movi $s2, NORMAL		# state = NORMAL
	
	# must define points variable
	play_game_do:
		movi $t0, $fp
		subi $t0, 1
		load $t1, $t0
		subi $t1, 1				# time--
		stor $t1, $t0
		
		

		push $a1	 			# save killed to stack
		mov $a0, $s2
		# need to set a1 to trigger and a2 to hit
		call next_state			# state = next_state(state,)
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
			
			movi $a1, 1		 	# killed = true
			load $t0, $fp
			addi $t0, POINTS 	# score += points
			stor $t0, $fp
		finished:

		mov $a0, $s3			# a0 = DUCK_SPRITE
		movwi $t3, CONTROLLER_A
		load $a2, $t3			# a2 = controls
		call update_duck
		
		movi $t0, $fp			# load fp
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
	
