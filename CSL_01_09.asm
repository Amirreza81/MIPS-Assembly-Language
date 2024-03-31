.text
addi $v0, $zero, 4	# print message to enter number
la $a0, message		# address of the message
syscall

addi $v0, $zero, 5	# read integer of user input
syscall

add $a0, $zero, $v0	# save $v0 in  $t0 because it will be changed
jal function		# call the function 

addi $v0, $zero, 3	# syscall 3 for printing double, $f12 is ready to print
syscall

addi $v0, $zero, 10
syscall			# terminate

function:
	addi $sp, $sp, -4	# sub $sp to save $ra
	sw $ra, 0($sp)		# save $ra because it will be changed specially in recursive functios
	l.d $f18, f3	# 0
	l.d $f4, f2	# 1
	l.d $f2, f	# 2		# loading some useful double numbers
	add.d $f16, $f18, $f2		# $f16 = 2, it's the divisor that is used in line 30
	add.d $f12, $f18, $f4		# $f12 = 1, because if n < 2, output of function is 1
	ble $a0, 0x1, OutOfFunction	# if $a0(n) <= 1 --> jump to OutOfFunction
	addi $a0, $a0, -1		# for f(n-1)
	jal function			# call this recursive function for n-1
	add.d $f6, $f12, $f18		# the output of function is in $f12, save it in $f6
	div.d $f12, $f6, $f16		# divide $f6 by $f16 --> f(n-1)/n
	add.d $f16, $f16, $f4		# add 1 to $f16 for next --> f(n-1)/n (it was started from 2)
	add.d $f12, $f12, $f2		# 2 + f(n-1)/n 
	
	OutOfFunction:
		lw $ra, 0($sp)		# load $ra for return
		addi $sp, $sp, 4	# add 4 to $sp because we load $ra
	
	jr $ra		# return


.data
message:	.asciiz "Enter a nmber:\n"
f: .double 2.0
f2: .double 1.0
f3: .double 0.0
