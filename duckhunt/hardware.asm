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
.define BG_PALETTE 			0x4827


.define UUT0 CONTROLLER_A
#.define UUT1 CONTROLLER_B
#.define UUT2 CONTROLLER_A
#.define UUT3 CONTROLLER_A
#.define UUT4 CONTROLLER_A
#.define UUT5 CONTROLLER_A
#.define UUT6 CONTROLLER_A
#.define UUT7 CONTROLLER_A

.define SW0_MASK 1
.define SW_CASE_MASK 14

movwi $s0, UUT0
movwi $s1, SWITCHES
main:
	# load $s3, $s1
	# mov $t0, SW_CASE_MASK
	# and $t0, $s3
	# movwi $t2, case
	# case:
		# buc 
		
	
		
		# buc load_uut
		# buc load_uut
	# buc load_uut
	# mov
	# buc load_uut
	load $t1, $s0 # load value of UUT
	
	load $t0, $s1
 	andi $t0, SW0_MASK # load value of switches, mask off SW0
	beq end
		lshi $t1, -8 # if switch is true, shift to display lower 8.
	end: 
	stor $t1, $s1 # store value of UUT into LEDS
	buc main