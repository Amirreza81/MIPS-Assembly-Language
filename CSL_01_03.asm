.text

addi $v0, $zero, 5	# add 5 for reading an integer
syscall			# syscall and read an integer

add $t0, $zero, $v0	# save input number in another register 

Loop:			# start the loop
	
	la $s0, array1		# load address of array1 in $s0
	la $s1, array2		# load address of array2 in $s1
	beq $t0, $zero, EXIT	# for going out from loop
	addi $v0, $zero, 5	# add 5 for reading an integer
	syscall			# syscall and read an integer
	# for accessing to an element of the array,
	# first, I addi the input number with -1(because the first element of
	# is 0 but we input 1) and after that i shift it to left two times to multiple it
	# to 4 and after that I can access the elements easily
	addi $v0, $v0, -1 	# $v0 -= 1
	sll $v0, $v0, 2		# $v0 *= 4
	add $s0, $s0, $v0	# $s0 += $v0
	add $s1, $s1, $v0	# $s1 += $v0
	lw $t1, 0($s0)		# load the i[th] of array1
	lw $t2, 0($s1)		# load the i[th] of array2
	sw $t1, 0($s1)		# save the i[th] of array1 in array2
	sw $t2, 0($s0)		# save the i[th] of array2 in array1
	
	addi $t0, $t0, -1	# decreasing the counter of the loop
	j Loop			# jump to loop because it is loop :)
	
EXIT:				# start EXIT
	addi $v0, $zero, 10	# ready to terminate
	syscall			# terminate

.data				
array1 : .word 1, 2, 3, 4, 5, 6, 7, 8
array2 : .word 9, 10, 11, 12, 13, 14, 15, 16
