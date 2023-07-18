.data
	newline: 	.asciiz "\n"	

.text


.globl strlen
	# A function which takes a single parameter: a pointer to a string.
	# Counts the number of characters in the string (that is, read up to the null terminator).
	# Returns the count. 
	# Registers:
	#	s0      stores the value of a0[i]
	#	s1 	counter for the length of the string
	#	t0	i
	#	t1	holder for beq
	#	t2	holds the address of string[i]
	
strlen:
	addiu $sp, $sp, -24		# standard prolouge 
	sw $fp, 0($sp)
	sw $ra, 4($sp)
	addiu $fp, $sp, 20
	
	addiu $sp, $sp, -8		# allocate space on the stack for saving s registers
	sw $s0, 4($sp)			# the value of s0 and s1 before the function uses them stored on the stack
	sw $s1, 0($sp)	
		
	lw $s0, 0($a0)			# s0 = a0
		
	addi $s1, $zero, 0			# s1 = 0
	
	addi $t0, $zero, 0			# t0 = 0
	
	# while string[i] != null
	#	count++
	# end while
	string_loop:
	beq $s0, $zero, str_done	# branch if the value of s0 == null pointer
	
	add $t2, $t0, $t0		# t2 = i*2
	add $t2, $t2, $t2		# t2 = i*4
	add $t2, $a0, $t2		# t2 = &a[i]
	
	lw $s0, 0($t2)			# s2 = a[i]
	
	addi $t0, $t0, 1		# i++
	addi $s1, $s1, 1		# count++
	andi $t2, $t2, 0		# reset t2 so the address can be calculated on the next pass 
	
	j string_loop
	
	str_done:
	addi $v0, $zero, 4
	la $a0, newline
	syscall  
	
	andi $v0, $v0, 0
	add $v0, $zero, $s1		# v0 = count
	
	lw $s0, 4($sp)			# restore the original values of s0 and s1 and increment the sp
	lw $s1, 0($sp)
	addiu $sp, $sp, 8
	
	lw $ra 4($sp)			# standard epilogue 
	lw $fp 0($sp)
	addiu $sp, $sp 24
	jr $ra 

.globl gcf
gcf:
	addiu $sp, $sp, -24		#standard prolouge 
	sw $fp, 0($sp)
	sw $ra, 4($sp)
	addiu $fp, $sp, 20
	
	lw $ra 4($sp)			# standard epilogue 
	lw $fp 0($sp)
	addiu $sp, $sp 24
	jr $ra 
	
.globl bottles
bottles:
	addiu $sp, $sp, -24		#standard prolouge 
	sw $fp, 0($sp)
	sw $ra, 4($sp)
	addiu $fp, $sp, 20
	
	lw $ra 4($sp)			# standard epilogue 
	lw $fp 0($sp)
	addiu $sp, $sp 24
	jr $ra 
	
.globl longestSorted
longestSorted:
	addiu $sp, $sp, -24		#standard prolouge 
	sw $fp, 0($sp)
	sw $ra, 4($sp)
	addiu $fp, $sp, 20
	
	lw $ra 4($sp)			# standard epilogue 
	lw $fp 0($sp)
	addiu $sp, $sp 24
	jr $ra 

.globl rotate
rotate:
	addiu $sp, $sp, -24		#standard prolouge 
	sw $fp, 0($sp)
	sw $ra, 4($sp)
	addiu $fp, $sp, 20
	
	lw $ra 4($sp)			# standard epilogue 
	lw $fp 0($sp)
	addiu $sp, $sp 24
	jr $ra 
	
	
