.text
li $v0, 5		# syscall 5 for reading integer
syscall
move $a0, $v0		# save first number in $a0
li $v0, 5		# syscall 5 for reading integer
syscall
move $a1, $v0		# save second number in $a1
add $s0, $a0, $zero	# copy $a0 in $s0
addi $t5, $zero, 1	# counter

Loop:
beq $t5, 3, Exit	# if $t5 < 3 --> Exit
jal function		# call the function
move $a0, $v0		# save the return of the function in $a0
li $v0, 1		# syscall 1 for printing an integer
syscall
li $v0, 11		# syscall 11 for printing character
li $a0, 10		# 11 --> ascii for \n (new Line)
syscall
move $a0, $s0		# $s0 in $a0
j self_mode		# jump to self mode for self modifying
jal function		# jump to the function
move $a0, $v0		# $v0 is the return of the function
li $v0, 1		# syscall 1 for printing an integer
syscall

Exit:
li $v0, 10		# syscall 10 for terminate
syscall 		# terminate

function:
	instruction_to_be_replaced:  	# label for using in self modifying
	add $v0, $a0, $a1		# first --> add
	jr $ra			# return

self_mode:
	lw $t1, instruction_to_replace		# load address of the second instruction
    	sw $t1, instruction_to_be_replaced	# save it
    	addi $t5, $t5, 1			# counter++
    	j Loop  # go back to your sumLooop
instruction_to_replace:
    	sub $v0, $a0, $a1		# second instruction