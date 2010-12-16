.define SWITCHES 0x4803
# Register usage: $0=n, $1=f1, $2=f2, $3 = i, $4 = x $5 = 0x4803 $6 = temp
# return value written to register $7
fibn:	movi $0, 16		# initialize n = 8
		movi $1, 1		# initialize f1 = 1
		movi $2, -1		# initialize f2 = -1
		lui $2, -1
		movi $3, 0		# int i = 0
		movwi $6, output # pointer to array (accessor)
		movwi $9, output # pointer to array 
		movwi $5, SWITCHES
loop:	cmpi $0,0 
		beq  loop2		# Done with loop if n == 0
		add  $1, $2		# f1 = f1 + f2
		mov  $10, $1	# temp = f1
		sub  $10, $2		# temp = temp - f2
		mov  $2, $10	# f2 = temp
		subi $0, 1		# n = n - 1
		stor $1, $6		
		addi $6, 1		#ptr++
		movwi $8, loop	# repeat until done
		juc  $8		
loop2:
		load $7, $5		#value of switches into return register
		add  $7, $9		
		load $4, $7
		stor $4, $5
		buc  loop2		# repeat until done
	
output: 0, 0, 0, 0, 0, 0, 0, 0
	
# C-code that this assembly code came from
# int output[8];
#
# int fibn(void)
# {
#  int* result = (int*)128;
#  int n = 14;		/* Compute nth Fibonacci number */
#  int f1 = 1, f2 = -1	/* last two Fibonacci numbers   */
#  int i = 0;
#  while (n != 0) {	/* count down to n = 0          */
#    f1 = f1 + f2;
#    f2 = f1 - f2;
#     n = n - 1;
#		output[i] = f1;
#		i++;
#   }
#	int* leds = 0xff;
#	int* switch = 0xfe;
#	while (1)
#	{
#		int x = *switch;
#		*leds = *(output + x);
#	}
#  }
	
