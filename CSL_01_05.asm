.text
la $s0, a		# load address of the number
lw $a0, 0($s0)		# load word the number in $a0
la $s1, primes		# load address of our space in data to save prime factors
add $s3, $zero, $s1	# save $s1 in $s3 to avoid changing and keep the amount of that
addi $t0, $zero, 2	# use $t0 in function and start it with 2 
addi $s2, $zero, 1	# just use a register to have 1 
jal PrimeFactors	# call the function and go to line 26

Loop:			# start the loop
	addi $v0, $zero, 1		# ready for printing an integer
	lw $a0, 0($s3)			# load word 
	addi $s3, $s3, 4		# $s3 += 4
	beq $a0, $zero, EXIT		# if $a0 == 0 --> jump to EXIT
	beq $a0, $t5, GOTOLOOP		# if $a0 == $t5(last factor) --> jump to GOTOLOOP
	syscall
	add $t5, $zero, $a0		# new factor in $t5
	la $a0, space			# load address of space
	addi $v0, $zero, 4		# $v0 = 4  
	syscall
	j Loop			# jump to loop again

addi $v0, $zero, 10	# syscall 10 for terminate
syscall
	
PrimeFactors:				# starting the function 
	beq $a0, $s2, OUT		# if $a0 == $s2(1) go to OUT	
	div $a0, $t0			# divide $a0 by $t0 that start with 2
	mfhi $t1			# remainder in $t1
	beq $t1, $zero, SAVE		# if remainder == 0 then go to SAVE
	bne $t1, $zero, ELSE		# if remainder != 0 then go to ELSE
	SAVE:		# start SAVE --> saving prime factors
		mflo $a0		# quotient in $a0
		sw $t0, 0($s1)		# save $t0(prime factor) in primes($s1)
		addi $s1, $s1, 4	# add 4 to $s1(address of primes) for preparing to save the next factor 
		j PrimeFactors		# reursive function and call this function again
	ELSE:		# start ELSE --> add 1 to divisor
		addi $t0, $t0, 1	# add 1 to diviser
		j PrimeFactors		# reursive function and call this function again
	OUT:		# start OUT --> return 
		jr $ra	# return
GOTOLOOP:	# continue; in mips
	j Loop	# go(back) to first of the loop
EXIT:		# terminating
	addi $v0, $zero, 10	# preparing for terminating
	syscall			# terminate
	
.data
a :	.word 23
primes:		.space 1024 
space:		.asciiz " "
