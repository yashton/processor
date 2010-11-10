# each instruction will be tested by
# executing, and then branching to
# the next instuction if the correct
# result was reached, it will jump to 
# an error section
# assumptions:  cmpi, beq, juc & movi work.

.text
addTest:
addiTest:
adduTest:
adduiTest:
addc:
addci:
mulTest:
	movi $t0, 13  
	movi $t1, 14
	mul  $t1, $t0
	cmpi $t0, 182 # if t0 = 182 mul works
	beq  muliTest
	juc  error
muliTest:
subTest:
subiTest:
subc:
subci:
cmpTest:
andTest:
andiTest:
orTest:
oriTest:
xorTest:
xoriTest:
movTest:
lshTest:
lshiLeftTest:
lshiRightTest:
ashuTest:
ashuiLeftTest:
ashuiRightTest:
luiTest:
loadTest:
storTest:
scondTest:
jalTest:
notTest:
testTest:
error: