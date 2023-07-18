.data
	
	MSG: .asciiz "NOTHING EQUALS\n" #text for equals
	EQLS: .asciiz "EQUALS\n"
	
	ASC: .asciiz "ASCENDING\n"      #text for order
	DESC: .asciiz "DESCENDING\n"
	ALL_EQL: .asciiz "ALL EQUAL\n"
	UNORD: .asciiz "UNORDERED\n"
	
	REV: .asciiz "REVERSE\n"	#text for reverse
	
	RED: 	 .asciiz "red: "  		#text for print
	ORANGE:  .asciiz "orange: "
	YELLOW:  .asciiz "yellow: "
	GREEN: 	 .asciiz "green: "
	BLUE: 	 .asciiz "blue: "
	PURPLE:  .asciiz "purple: "
	NEWLINE: .asciiz "\n"

.text
.globl studentMain 
studentMain: 
	addiu $sp, $sp, -24 # allocate stack space-- default of 24 here sw 
	sw $fp, 0($sp)     # save caller’s frame pointer
	sw $ra, 4($sp)     # save return address
	addiu $fp, $sp, 20 # setup main’s frame pointer
	
	la $t0, equals #stores the input equauals which will determine if the equals function is run
	lw $t0, 0($t0)
	
	la $t1, order  #stores the input equauals which will determine if the equals function is run
	lw $t1, 0($t1)
	
	la $t2, reverse #stores the input equauals which will determine if the equals function is run
	lw $t2, 0($t2)
	
	la $t3, print #stores the input equauals which will determine if the equals function is run
	lw $t3, 0($t3)
	
	la $s0, red #t0 = red
	lw $s0, 0($s0) #t0 = red
	
	la $s1, orange
	lw $s1 0($s1)
	
	la $s2, yellow
	lw $s2, 0($s2)
	
	la $s3, green
	lw $s3, 0($s3)
	
	la $s4, blue
	lw $s4, 0($s4)
	
	la $s5, purple
	lw $s5, 0($s5)
	
	beq $t0, $zero, equals_after
	# Task 1: Equals
	# print a statement if any of the values equal each other
	# or if none of them do
	#
	# if (t0 == t1) 	
	#	print(EQUALS)
	# for all six variables
	# 
	# else
	#	print(NOTHING EQUALS)
	#
	# REGISTERS
	#  t0 - t3 - stores if a function will be run
	#  
	#  s0 - red
	#  s1 - orange
	#  s2 - yellow
	#  s3 - green
	#  s4 - blue
	#  s5 - purple
	
	beq $s0, $s1, print_equals    #if any variables equal each other, jump to the print equals statement
	beq $s0, $s2, print_equals
	beq $s0, $s3, print_equals
	
	beq $s1, $s2, print_equals
	beq $s1, $s3, print_equals
	
	beq $s2, $s3, print_equals
	
	print_not:                     #syscall to print out the string "NOTHING EQUALS"
	addi $v0, $zero,4 
	la $a0, MSG 
	syscall
	beq $zero, $zero, equals_after #forces the code to jump to the end of the equals function
	

	print_equals:		       #syscall to print out the string "EQUALS"
	addi $v0, $zero,4 
	la $a0, EQLS
	syscall
	
	equals_after:
	
	beq $t1, $zero, order_after
	# Task 2: Order
	# print ASSCENDING if the variables are ascending order
	# DESCENDING if they are is descending order
	# ALL EQUAL if they are all equal
	# UNORDERED if they are none of these
	#
	#
	# REGISTERS
	#  t0 - t3 - stored if a function will be run
	#  can now use t0 and t1 - their values have already been read
	#
	#
	#  t1 - holds either 1 or 0 as a check to see if the list is ascending
	#  t2 - holds either 1 or 0 as a check to see if the list is descending
	#  t3 - holds either 1 or 0 as a check to see if the variables previously
	#  compared were equal
	#
	#  s0 - red
	#  s1 - orange
	#  s2 - yellow
	#  s3 - green
	#  s4 - blue
	#  s5 - purple
	
	slt $t0, $s0, $s1 		# if s0 < s1, t0 = 1
	beq $t0, $zero, check_greater	# branch if s1 <= s0
	andi $t1, $t1, 0
	addi $t1, $t1, 1
	
	slt $t0, $s1, $s2
	beq $t0, $zero, unordered
	
	
	check_greater:
	andi $t1, $t1, 0			# the variables are not ascending so t1 = 0
	slt $t0, $s1, $s0		# if s1 < $s0, t0 = 1
	beq $t0, $zero, check_eql	# branch if s1 >= s0
	
	check_eql:
	andi $t2, $t2, 0			# the variables are not descending so t2 = 0
	
	body:
	
	
	
	
	
	addi $v0, $zero,4 
	la $a0, ASC
	syscall
	beq $zero, $zero, order_after
	
	descending:
	addi $v0, $zero,4 
	la $a0, DESC
	syscall
	beq $zero, $zero, order_after
	
	all_equal:
	addi $v0, $zero,4 
	la $a0, ALL_EQL
	syscall
	beq $zero, $zero, order_after
	
	unordered:
	addi $v0, $zero,4 
	la $a0, UNORD
	syscall
	
	order_after:
	
	
	beq $t2, $zero, reverse_after
	# Task 3: Reverse
	# stores the valriables to memory in the reverse order they were 
	# loaded in
	#
	#
	# REGISTERS
	#  t0 - t3 - stored if a function will be run
	#  can now use t0, t1, t2 - their values have already been read
	#
	# t0 - a temporary to hold the value that will be overwitten by the store
	# t1 - a temporary to hold the value that will be overwitten by the store
	# t2 - a temporary to hold an address
	#
	#
	#  s0 - red
	#  s1 - orange
	#  s2 - yellow
	#  s3 - green
	#  s4 - blue
	#  s5 - purple
	
	# Swap red with purple 
	la $s0, red 	  # load the address of red into s0
	la $t7, purple 
	lw $t0, 0($t7)	  # load the value of purple into t0
	
	la $s5, purple	  # load the address of purple into s5
	lw $t1, 0($s0)	  # load the value of red into t1
	
	sw $t0, 0($s0)	  # store the value of purple into reds's previous adress
	
	andi $s0, $s0, 0	  # set s0 to 0
	add $s0, $s0, $t0 # s0 = purple
	
	sw $t1 0($s5)	  # store the value of red in into purple's previous adress
	
	andi $s5, $s5, 0	  # s5 = 0
	add $s5, $s5, $t1 # s5 = red
	
	# swap orange with blue 
	la $s1, orange 	  # load the address of orange into s1
	lw $t0, 0($s4)	  # load the value of blue into t0
	
	la $s4, blue	  # load the address of blue into s4
	lw $t1, 0($s1)	  # load the value of orange into t1
	
	sw $t0, 0($s1)	  # store the value of blue into oranges's previous adress
	
	andi $s1, $s1, 0	  # set s1 to 0
	add $s1, $s1, $t0 # s1 = blue
	
	sw $t1 0($s4)	  # store the value of orange into blues's previous adress
	
	andi $s4, $s4, 0	  # s4 = 0
	add $s4, $s4, $t1 # s4 = orange
	
	# swap yellow with green 
	la $s2, yellow 	  # load the address of yellow into s2
	lw $t0, 0($s3)	  # load the value of green into t0
	
	la $s3, green	  # load the address of green into s3
	lw $t1, 0($s2)	  # load the value of yellow into t1
	
	sw $t0, 0($s2)	  # store the value of green into yellow's previous adress
	
	andi $s2, $s2, 0	  # set s2 to 0
	add $s2, $s2, $t0 # s2 = green
	
	sw $t1 0($s3)	  # store the value of yellow into green's previous adress
	
	andi $s3, $s3, 0	  # s3 = 0
	add $s3, $s3, $t1 # s3 = yellow
	
	addi $v0, $zero,4 
	la $a0, REV
	syscall
	
	reverse_after:
	
	beq $t3, $zero, print_after
	# Task 4: Print
	# Prints all the variables and their values
	#
	#
	# REGISTERS
	#  t0 - t3 - stored if a function will be run
	#  can now use t0, t1, t2, t3 - their values have already been read
	#
	# t0 - a temporary to hold the value that will be overwitten by the store
	# t1 - a temporary to hold the value that will be overwitten by the store
	# t2 - a temporary to hold an address
	#
	#
	#  s0 - red
	#  s1 - orange
	#  s2 - yellow
	#  s3 - green
	#  s4 - blue
	#  s5 - purple
	
	
	addi $v0, $zero,4 	# print the string RED
	la $a0, RED
	syscall
	
	addi $v0, $zero,1	# print the value of the variable red
	la $a0, red
	syscall
	
	addi $v0, $zero,4	# print a newline
	la $a0, NEWLINE
	syscall
	
	
	addi $v0, $zero,4 	# print the string ORANGE
	la $a0, ORANGE
	syscall
	
	addi $v0, $zero,1	# print the value of the variable orange
	la $a0, orange
	syscall
	
	addi $v0, $zero,4	# print a newline
	la $a0, NEWLINE
	syscall
	
	
	addi $v0, $zero,4 	# print the string YELLOW
	la $a0, YELLOW
	syscall
	
	addi $v0, $zero,1	# print the value of the variable yellow
	la $a0, yellow
	syscall
	
	addi $v0, $zero,4	# print a newline
	la $a0, NEWLINE
	syscall
	
	
	addi $v0, $zero,4 	# print the string GREEN
	la $a0, GREEN
	syscall
	
	addi $v0, $zero,1	# print the value of the variable green
	la $a0, green
	syscall
	
	addi $v0, $zero,4	# print a newline
	la $a0, NEWLINE
	syscall
	
	
	addi $v0, $zero,4 	# print the string BLUE
	la $a0, BLUE
	syscall
	
	addi $v0, $zero,1	# print the value of the variable blue
	la $a0, blue
	syscall
	
	addi $v0, $zero,4	# print a newline
	la $a0, NEWLINE
	syscall
	
	
	addi $v0, $zero,4 	# print the string PURPLE
	la $a0, PURPLE
	syscall
	
	addi $v0, $zero,1	# print the value of the variable orange
	la $a0, purple
	syscall
	
	addi $v0, $zero,4	# print a newline
	la $a0, NEWLINE
	syscall
	
	
	print_after:
	
	
DONE:	
	lw $ra, 4($sp) # get return address from stack
	lw $fp, 0($sp) # restore the caller’s frame pointer
	addiu $sp, $sp, 24 # restore the caller’s stack pointer
	jr $ra # return to caller’s code
