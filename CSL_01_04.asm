.text
addi $v0, $zero, 8		# syscall 8 for reading string
la $a0, input			# load address of input
addi $a1, $zero, 17		# number of characters
syscall

add $s1, $zero, $a0		# save $a0 in $s1

addi $v0, $zero, 4		# printing a line
la $a0, newLine
syscall

la $a0, cons1			# load address of the cons1 
la $a1, cons2			# load address of the cons2
la $a2, cons3			# load address of the cons3
la $a3, cons4			# load address of the cons4
addi $t1, $t1, 0		# $t1 is the counter of the loop

Loop:
	sle $t2, $t1, 3			# if $t1 < 3 --> $t2 = 1
	beq $t2, 1, OutOfLoop1		# if $t2 == 1 --> OutOfLoop1
	sle $t2, $t1, 7			# if $t1 < 7 --> $t2 = 1
	beq $t2, 1, OutOfLoop2		# if $t2 == 1 --> OutOfLoop2
	sle $t2, $t1, 11		# if $t1 < 11 --> $t2 = 1
	beq $t2, 1, OutOfLoop3		# if $t2 == 1 --> OutOfLoop3
	sle $t2, $t1, 15		# if $t1 < 15 --> $t2 = 1
	beq $t2, 1, OutOfLoop4		# if $t2 == 1 --> OutOfLoop4
	beq $t1, 16, Continue		# if $t1 == 16 --> exit the loop
	j Loop		# jump to the loop again

	OutOfLoop1:
		lb $t8, 0($s1)		# load byte of $s1 in $t8
		sb $t8, 0($a0)		# save $t8 in $a0(cons1)
		addi $t1, $t1, 1	# $t1++ because it's the counter
		addi $a0, $a0, 1	# $a0++ for saving in the next byte
		addi $s1, $s1, 1	# $s1++ for loading the next byte
		j Loop		# jump to the loop to continue the progress
	OutOfLoop2:
		lb $t8, 0($s1)		# load byte of $s1 in $t8
		sb $t8, 0($a1)		# save $t8 in $a1(cons2)
		addi $t1, $t1, 1	# $t1++ because it's the counter
		addi $a1, $a1, 1	# $a1++ for saving in the next byte
		addi $s1, $s1, 1	# $s1++ for loading the next byte
		j Loop		# jump to the loop to continue the progress
	OutOfLoop3:
		lb $t8, 0($s1)		# load byte of $s1 in $t8
		sb $t8, 0($a2)		# save $t8 in $a2(cons3)
		addi $t1, $t1, 1	# $t1++ because it's the counter
		addi $a2, $a2, 1	# $a2++ for saving in the next byte
		addi $s1, $s1, 1	# $s1++ for loading the next byte
		j Loop		# jump to the loop to continue the progress
	OutOfLoop4:
		lb $t8, 0($s1)		# load byte of $s1 in $t8
		sb $t8, 0($a3)		# save $t8 in $a3(cons4)
		addi $t1, $t1, 1	# $t1++ because it's the counter
		addi $a3, $a3, 1	# $a3++ for saving in the next byte
		addi $s1, $s1, 1	# $s1++ for loading the next byte
		j Loop		# jump to the loop to continue the progress

Continue:	
	la $a0, cons1		# load addresses of the cons[1-4] again
	la $a1, cons2
	la $a2, cons3
	la $a3, cons4
	jal function		# call the function
	mul $v1, $v0, 1000	# $v0 * 1000 = $v1    --> the return of the function is in $v0
	add $a0, $zero, $a1	# $a0 = address of cons2
	jal function		# call the function
	mul $t4, $v0, 100	# $v0 * 100 = $t4    --> the return of the function is in $v0
	add $v1, $v1, $t4	# $v1 += $t4
	add $a0, $zero, $a2	# $a0 = address of cons3
	jal function		# call the function
	mul $t4, $v0, 10	# $v0 * 10 = $t4    --> the return of the function is in $v0
	add $v1, $v1, $t4	# $v1 += $t4
	add $a0, $zero, $a3	# $a0 = address of cons4	
	jal function		# call the function
	add $v1, $v1, $v0	# $v1 += $v0 	--> the return of the function is in $v0
	# $v1 is the decimal number that I want
div $v1, $v1, 33	# $v1 / 33 --> remainder in hi
mfhi $t0		# $t0 is the remainder of the division now
beqz $t0, A		# if $t0 == 0, jump to the A
li $v0, 4		# load immediate 4 in $v0 for printing string
la $a0, no		# print no
syscall

li $v0, 10	# syscall 10 for terminate
syscall		# terminate

A:
	li $v0, 4	# $v0 = 4 for printing string
	la $a0, yes	# printing yes
	syscall
	li $v0, 10	# syscall 10 for terminate
	syscall		# terminate
	
function:			
	lb $t0, 0($a0)		
	andi $t0,$t0,0x0F		# make character to integer
	lb $t1, 1($a0)
	andi $t1,$t1,0x0F		# make character to integer		
	lb $t2, 2($a0)					
	andi $t2,$t2,0x0F		# make character to integer
	lb $t3, 3($a0)
	andi $t3,$t3,0x0F		# make character to integer
	sll $t0, $t0, 3			# first element * 8 + sec * 4 + third * 2 + last 
	sll $t1, $t1, 2
	sll $t2, $t2, 1
	add $v0, $t0, $t1
	add $v0, $v0, $t2
	add $v0, $v0, $t3		# add all in $v0
	jr $ra				# return
	
.data
input: .space 17
cons1: .space 5
cons2: .space 5
cons3: .space 5
cons4: .space 5
yes: .asciiz "It's divisible :)"
no: .asciiz "It's not divisible"
newLine: .asciiz "\n"
