.define CONTROLLER_A 0x480a
.define DUCK_SPRITE 0x2000
.define ROUND_TIME 600
.define NORMAL 1
.define HIT 2
.define BLANK_SCREEN 3
.define POINTS 5
main:
	call draw_splash
	call play_game
	mov $a0, $v0
	call draw_result
	buc main
	
play_game:
	frame
	push $s0
	push $s1
	push $s2
	push $s3
	push $a0
	push $a1
	push $a2
	movi $v0, 0 			# score = 0 
	movi $s0, 0				# finished = false 
	movi $s1, 0				# rounds = 0 
	movi $s2, ROUND_TIME	# time = 600 
	movi $a1, 0 			# killed = 0
	movwi $s3, DUCK_SPRITE	# duck = 0x2000
	movi $t2, 0				# points = 0
	movi $t1, 0				# state = 0
	push $t1
	# must define points variable
	play_game_do:
		movwi $t3, CONTROLLER_A
		load $a2, $t3	# a2 = controls
		subi $s2, 1		# time--
		
		cmpi $t1, BLANK_SCREEN
		bne else_if_hit
			mov $a0, $s3	# a0 = DUCK_SPRITE
			call blank_screen
			buc finished
		else_if_hit:
		cmpi $t1, HIT
		bne finished
			movi $a1, 1		 	# killed = true
			addi $v0, POINTS 	# score += points
		finished:
		pop $t1
		
		push $t1
		
		push $v0
		mov $a0, $s3			# a0 = DUCK_SPRITE
		call update_duck
		test $s2, $s2
		sne $t0					# t0 = (time == 0)
		or $t0, $s0				# finished || t0
		bne update_round_finished
			addi $s1, 1
			movi $a1, 0
		update_round_finished:
		pop $v0
		call wait_until_frame
		
		
		cmpi $s1, 3			# rounds - 3 < 0
		blt play_game_do
		
	pop $t1
	pop $a2
	pop $a1
	pop $a0
	pop $s3
	pop $s2
	pop $s1
	pop $s0
	leave
	juc $ra					# return score
	
next_state:
	movi $t0, 0 					# next_state = 0
	cmpi $a0, NORMAL				# if (state == NORMAL)
	bne else_if_blank_screen
		cmpi $a1, 1					# if (trigger_pulled == 1)
		bne else_trigger	
			movi $t0, BLANK_SCREEN	# next_state = BLANK_SCREEN
		else_trigger:				# else
			movi $t0, NORMAL		# next_state = NORMAL
	else_if_blank_screen:
		cmpi $a0, BLANK_SCREEN		# else if (state = BLANK_SCREEN)
		bne else_hit
			cmpi $a2, 1				# if (gun_hit == 1)
			bne else_gun
				movi $t0, HIT		# next_state = HIT
			else_gun:
				movi $t0, NORMAL		
	else_hit:
		movi $t0, NORMAL	
			
	
