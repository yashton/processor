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
		load $t1,$t0 #t1 = killed
		push $a0
		push $a1
		push $a2
		
		
		
		
		pop $a0
		pop $a1
		pop $a2
		leave
		juc $ra
