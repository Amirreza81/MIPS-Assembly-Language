.text
li $v0, 6	# syscall 6 for reading float
syscall		# $f0 = 2.5

cvt.w.s $f12, $f0  		# convert from single precision to word         
mfc1 $s0, $f12           	#s0 = (int)five --> $s0 = 2
mtc1 $s0, $f1		 	# move to Coprocessor 1 (FPU) 
cvt.s.w $f1, $f1		# Float 5.0 --> $f1 = 2.0
sub.s $f3, $f0, $f1		# $f3 --> 0.25

li $v0, 35		# syscall 35 for [[ integer to bunary]]
move $a0, $s0		# $s0 is the integer part of the float
syscall
li $v0, 11		# syscall 11 for print character
li $a0, 46		# print . (ascii 46 for .)
syscall

la $t4, float		# load address of the float
l.s $f6, 0($t4)		# $f6 = 2
la $t7, fractional	# load address of the space

addi $s2, $zero, 1	# counter

Loop:
	beq $s2, 11, Exit		# if $s2 < 11:
	mul.s $f3, $f3, $f6		# $f3 = $f3 * 2.0
	jal function			# call the function
	sw $v0, 0($t7)			# $v0 is the return of the function and store it
	addi $s2, $s2, 1		# counter++
	addi $t7, $t7, 4		# next space
	j Loop			# jump to the Loop
	
function:
	cvt.w.s $f12, $f3           
	mfc1 $s0, $f12               #s0 = (int)five --> $s0 = 1
	mtc1 $s0, $f1
	cvt.s.w $f1, $f1	# Float 5.0 --> $f1 = 1.0
	sub.s $f3, $f3, $f1	# $f6 --> 0.0
	move $v0, $s0		# return in $v0
	jr $ra			# return 

Exit:
	li $v0, 1			# $v0 = 1
	la $a1, fractional		# load address of the space again
	add $t0, $zero, $a1		# address
	addi $t1, $zero, 1		# counter
	Loop2:
		beq $t1, 11, Exit2	# printing up to 10
		lw $a0, 0($t0)		# load word from the space
		syscall
		addi $t0, $t0, 4	# next character
		addi $t1, $t1, 1	# counter++
		j Loop2		# jump to the Loop2
		
Exit2:
	li $v0, 10		# syscall 10 for terminate
	syscall			# terminate

.data
fractional: .space 11
float: .float 2.0
