.text

addi $a1, $zero, 10	# random in range 0 - 9
addi $a1, $a1, 1	# add 1 to generate it 1 - 10
addi $v0, $zero, 42	# preparing syscall (adding 42 to creat random int)
syscall 	        #  syscall

add $s0, $zero, $a0	# save random number in another register to avoid predictable problems for changing $a0

addi $v0, $zero, 4	# add 4 to $v0 to print a string
la $a0, firstMessage	# load address of the string
syscall			# syscall

loop:			# a loop for checking

	addi $v0, $zero, 5	# get a number (read an integer)
	syscall			# syscall 
	add $s1, $zero, $v0     # save input number in another register to avoid predictable problems for changing $v0
	beq $s0, $s1, printCorrect # if $s0 == $s1 then call printCorrect
	bne $s0, $s1, printInCorrect	# if $s0 != $s1 then call printInCorrect
	j loop		# jump to first of the loop
	
printCorrect:  		 
	addi $v0, $zero, 4	# add 4 to $v0 to print a string
	la $a0, correct		# load address of the string
	syscall			# syscall
	j EXIT			# jump to EXIT
printInCorrect:
	addi $v0, $zero, 4	# add 4 to $v0 to print a string
	la $a0, incorrect	# load address of the string
	syscall			# syscall
	j loop			# jump to the loop
	
EXIT:
	addi $v0, $zero, 10	# add 10 to $v0 to terminate
	syscall			# terminate
	
	
.data
firstMessage: .asciiz "Guess a number between 1 to 10 ... :\n"
incorrect: .asciiz "No!, Guess again : \n" 
correct: .asciiz "Well Guessed!"

