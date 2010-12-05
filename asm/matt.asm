# draw_splash
	draw_splash:
	# splash screen code here
	
	update_duck_sprite:
	# a0 pointer to duck sprite
	# a1 delta x
	# a2 delta y
		frame
		mov $t0,$fp
		addi $t0,2
		load $t1,$t0 			# t1 = killed
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
			# TODO: add code for correct duck
			buc end_update_duck_sprite
		east: 
			# TODO: add code for correct duck
			buc end_update_duck_sprite
		north_west:
			# TODO: add code for correct duck
			buc end_update_duck_sprite
		north_east:
			# TODO: add code for correct duck
			buc end_update_duck_sprite
		vertical:
			# TODO: add code for correct duck
			buc end_update_duck_sprite
		end_update_duck_sprite:
		leave
		juc $ra
