# draw_splash
	draw_splash:
	# splash screen code here

# update duck sprite	
	update_duck_sprite:
	# a0 pointer to duck sprite
	# a1 delta x
	# a2 delta y
		frame
		mov $t0,$fp
		addi $t0,2
		load $t1, $t0 			# t1 = killed
		load $t2, counter
		load $t3, sprite_frame
		cmpi $t2, 15			# cycles to next animation frame
		beq  next_sprite_frame
		addi $t2, 1
		buc	 end_counter_logic
	next_sprite_frame:
		movi $t2, 0				# reset counter
		cmpi $t3, 3
		beq  reset_sprite_frame
		addi $t3, 1
		buc  end_counter_logic
	reset_sprite_frame:
		movi $t3, 0				# reset frame
	end_counter_logic:
		cmpi $t1, 1
		beq dead_duck
		cmpi $a2, 0
		blt  north
		bgt  south
		cmpi $a1, 0
		blt west				# left flying duck
		bgt east				# right flying duck
		buc vertical			# non-moving duck, probably shouldn't happen
		south: # south facing duck code
			cmpi $a1, 0
			blt west			# left + down duck
			bgt east			# right + down duck
			buc vertical		# downward duck
		north: # north facing duck code
			cmpi $a1, 0
			blt north_west		# left + up duck
			bgt north_east		# right + up duck
			buc vertical		# upward duck
		dead_duck:
			# TODO: add code for correct duck
			buc end_update_duck_sprite
		west:
			cmpi $t3,0
			beq  west_frame_0
			cmpi $t3,2
			beq  west_frame_2
			west_frame_1_and_3:
				# TODO: add code for correct duck
				buc end_update_duck_sprite
			west_frame_0:
				# TODO: add code for correct duck
				buc end_update_duck_sprite
			west_frame_2:
				# TODO: add code for correct duck
				buc end_update_duck_sprite
		east: 
			cmpi $t3,0
			beq  east_frame_0
			cmpi $t3,2
			beq  east_frame_2
			east_frame_1_and_3:
				# TODO: add code for correct duck
				buc end_update_duck_sprite
			east_frame_0:
				# TODO: add code for correct duck
				buc end_update_duck_sprite
			east_frame_2:
				# TODO: add code for correct duck
				buc end_update_duck_sprite
		north_west:
			cmpi $t3,0
			beq  north_west_frame_0
			cmpi $t3,2
			beq  north_west_frame_2
			north_west_frame_1_and_3:
				# TODO: add code for correct duck
				buc end_update_duck_sprite
			north_west_frame_0:
				# TODO: add code for correct duck
				buc end_update_duck_sprite
			north_west_frame_2:
				# TODO: add code for correct duck
				buc end_update_duck_sprite
		north_east:
			cmpi $t3,0
			beq  north_east_frame_0
			cmpi $t3,2
			beq  north_east_frame_2
			north_east_frame_1_and_3:
				# TODO: add code for correct duck
				buc end_update_duck_sprite
			north_east_frame_0:
				# TODO: add code for correct duck
				buc end_update_duck_sprite
			north_east_frame_2:
				# TODO: add code for correct duck
				buc end_update_duck_sprite
		vertical:
			cmpi $t3,0
			beq  vertical_frame_0
			cmpi $t3,2
			beq  vertical_frame_2
			vertical_frame_1_and_3:
				# TODO: add code for correct duck
				buc end_update_duck_sprite
			vertical_frame_0:
				# TODO: add code for correct duck
				buc end_update_duck_sprite
			vertical_frame_2:
				# TODO: add code for correct duck
				buc end_update_duck_sprite			
		end_update_duck_sprite:
		leave
		juc $ra
		
.data
	counter: 0 # count 15 is a counter used to determine 
	# when to switch to a frame for animation
	sprite_frame: 0 # state machine storage