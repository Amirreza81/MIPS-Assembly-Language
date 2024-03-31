.text
addi $v0, $zero, 5		# syscall 5 for reading integer
syscall

add $a1, $zero, $v0		
addi $a1, $a1, 1		# saving the user's input + 1 in $a1

addi $v0, $zero, 9		# allocate heap memory
add $a0, $zero, $a1		# numbers of characters
syscall		

add $a0, $zero, $v0		# save the address in $a0

addi $v0, $zero, 8		# syscall 8 for reading string
syscall

add $t0, $zero, $a0		# save the address
add $t2, $zero, $a0		# duplicate for using in line 47

loop:
    	lb $t1, 0($t0)		# load a character
    	beq $t1, 0, exit	# for ending the loop, if $t1 == 0 --> exit
    	blt $t1, 'A', case1	# if $t1 < 'A' --> case1
    	blt $t1, 'a', case2	# if $t1 < 'a' --> case2
    	blt $t1, '{', case3	# if $t1 < '{' --> case3 [ '{' is the next character of 'z' in ascii]

case1: 
	sb $t1, 0($t0)		# store the character without changing
    	addi $t0, $t0, 1	# $t0 += 1 for going to next character
    	j loop			# back to the loop(jump to the loop)
case2:
	blt $t1, 'A', case1	# if $t1 < 'A' --> jump to case1
	add $t1, $t1, 32	# add 32 to the character to make it lowercase
	sb $t1, 0($t0)		# stroe it
	addi $t0, $t0, 1	# next character
	j loop			# jump to the loop
case3:
	blt $t1, 'a', case1	# if $t1 < 'a' --> jump to case1
	sub $t1, $t1, 32	# $t1 -= 32 to make it uppercase
	sb $t1, 0($t0)		# store it
	addi $t0, $t0, 1	# next character
	j loop			# jump to the loop
exit:
    li $v0, 4			# syscall 4 for printing string
    la $a0, newLine		# address of newLine
    syscall			# printing a line for beautification
    la $a0, 0($t2)		# address of the characters
    syscall			# printing the new string 

addi $v0, $zero, 10		# syscall 10 for terminate
syscall				# terminate

.data
newLine: .asciiz "\n"
