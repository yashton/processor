.define DMA_L 0x4804
.define DMA_U 0x4805
.define DMA_DST 0x4806
.define DMA_AMT 0x4807

.text
	movi $t3, 0
	movwi $t0, DMA_L
	stor $t3, $t0
	
	addi $t0, 1
	stor $t3, $t0
	
	movwi $t3, 0x1000
	addi $t0, 1
	stor $t3, $t0
	
	movi $t3, 100
	addi $t0, 1
	stor $t3, $t0
	
loop: movwi $t1, 0x1000
	load $t2, $t1
	
