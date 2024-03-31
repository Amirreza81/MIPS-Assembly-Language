.text
la $s0, number		# load address
lw $s1, 0($s0)		# load the number

# if the number is even, after srl and sll, it wouldn't be changed
# but if it is odd, it will be changed

srl $s2, $s1, 1		# shift right -- n / 2
sll $s2, $s2, 1		# shift left -- n * 2

beq $s1, $s2, Even	# if $s1 == $s2 --> jump to Even
bne $s1, $s2, Odd

Even:
	sw $zero, 0($s0)	# store 0 in $s0		# ????
	#add $s0, $zero, $zero 	# 0 in $s0
	j EXIT			# jump to EXIT

Odd:
	#addi $s0, $zero, 1	# 1 in $s0				# ????
	sw $t0, 0($s0)
	j EXIT			# jump to EXIT
	
EXIT:
	addi $v0, $zero, 10	# syscall 10 for termiante
	syscall			# terminate

.data
number: .word 127
