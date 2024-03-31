.text
original_file_open:  # open the first file
	li $v0, 13	# syscall 13 for opening
	la $a0, OriginalFile # address of file
	li $a1, 0	# flags
	li $a2, 0	# mode
	syscall		# syscall :)
original_file_read:  # read the context of file
	add $s0, $zero, $v0	# save $v0 in $s0 because it will be changed in the next line
	li $v0, 14	# syscall 14 for reading
	add $a0, $zero, $s0	# $a0 = $s0
	la $a1, space	# address of input buffer in $a1
	li $a2, 2048	# maximum number of characters in $a2
	syscall		# syscall 
original_file_close: # closing the file
	li $v0, 16	# syscall 16 for closing
	add $a0, $zero, $s0	# $a0 = $s0 for syscall
	syscall
     
la $a0, space	# load address of space in $a0 again
add $t0, $zero, $a0	# save the $a0 in $to because it will be changed

    StringLength: 		# find the lenght of the string(context of the file)
        lb   $t2, 0($t0)	# load byte --> the first character of the string
        beq   $t2, $zero, Exit  # if reach the end of the string--> Exit
        addi $t0, $t0,  1	# increase $t0 ( next character)
        addi $t5, $t5,  1     # add 1 to count the length of the string
        j StringLength		# call StringLenght again ( it's a loop )
        
    Exit:
    	add $t1, $t5, $zero      # t1 is the length of the string
    	addi  $t2, $zero, 0           	 # counter i = 0 ( preparing for reversing )

    la $t4, new_space		# load address of new array in $t4
    
    reverseString:		# start reverse the string
        slt  $t3, $t2, $t1    # if i < stringlength:
        beq  $t3, $zero,  Exit2  # if t3 reaches the end of the array
        addi $t0, $t0, -1     # decrement the array 
        lb  $a0, 0($t0)      # load the array from the end
        addi $t2, $t2, 1	# add 1 to $t2 for counting the loop
        sb $a0, 0($t4)		# store byte for storing characters in the new list
        addi $t4, $t4, 1	# add 1 to $t4 ( go to the next character )
        j reverseString		# call reverseString again because it's loop
    
Exit2:
new_file_creat:		# now , creat second file with opening it
	li $v0, 13	# syscall 13 for opening/creating
    	la $a0, NewFile		# address of file
    	li $a1, 1	# flags for creat
    	li $a2, 0	# mode
    	syscall
file_write:
	move $a0, $v0  # Syscall 15 requieres file descriptor in $a0
    	li $v0, 15 	# Syscall 15 for writing
    	la $a1, new_space # Address of the new list
    	la $a2, end
    	la $a3, new_space
    	subu $a2, $a2, $a3  
    	# computes the length of the string
    	syscall
file_close:
    	li $v0, 16  # $a0 already has the file descriptor
    	syscall

addi $v0, $zero, 10	# syscall 10 for terminate
syscall		# terminate


.data
OriginalFile: .asciiz "mips.txt"
NewFile: .asciiz "new_mips.txt"
space: .space 2048
new_space: .space 2048 
end:
