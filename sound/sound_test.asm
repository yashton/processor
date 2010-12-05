.define BGROUND_ADDR_LOWER 0x480c
.define BGROUND_ADDR_UPPER 0x480d
.define BGROUND_AMP 0x480e
.define BGROUND_DUR_LOWER 0x480f
.define BGROUND_DUR_UPPER 0x4810

# Funky loop
.define FUNKY_SOUND_LOWER 0x54b9
.define FUNKY_SOUND_UPPER 0x0004
.define FUNKY_DUR_LOWER 0x6000
.define FUNKY_DUR_UPPER 0x000b

movwi $2, FUNKY_SOUND_LOWER
movwi $0, BGROUND_ADDR_LOWER
stor $2, $0

movwi $3, FUNKY_SOUND_UPPER
movwi $0, BGROUND_ADDR_UPPER
stor $3, $0

movwi $0, BGROUND_DUR_LOWER
movwi $1, BGROUND_DUR_UPPER
movwi $4, FUNKY_DUR_LOWER
movwi $5, FUNKY_DUR_UPPER
stor $4, $0
stor $5, $1

movi $2, 0
movwi $0, BGROUND_AMP 
stor $2, $0
nop 
