.define bit11hi = 2048

# draw_splash
	draw_splash:
	# splash screen code here

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
			stor $s0, counter
			stor $s1, sprite_frame
			buc
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
		stor $s0, counter
		stor $s1, sprite_frame
		end_update_duck_sprite:
		pop $s2
		pop $s1
		pop $s0
		leave
		juc $ra
		
.data
	counter: 0 # a counter used to determine 
	# when to switch to a frame for animation
	sprite_frame: 0 # state machine for current frame
	dead_counter: 0 # a counter for duck death animation
	dead_frame: 0 # state machine for current dead duck frame
	