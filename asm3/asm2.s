.data 
	fib_string: 	.asciiz "Fibonacci Numbers:\n"
	zero:		.asciiz "  0: 1\n"
	one: 		.asciiz "  1: 1\n"
	space: 	 	.asciiz "  "
	colon: 	 	.asciiz ": "
	newline: 	.asciiz "\n"
	runCheckString: .asciiz "Run Check: "
	asc: 		.asciiz "ASCENDING"
	des: 		.asciiz "DESCENDING"
	neither: 	.asciiz "NEITHER"


.text
.globl studentMain 
studentMain: 
	addiu $sp, $sp, -24 # allocate stack space-- default of 24 here sw 
	sw $fp, 0($sp)     # save caller’s frame pointer
	sw $ra, 4($sp)     # save return address
	addiu $fp, $sp, 20 # setup main’s frame pointer
	
	
	la $s0, fib		 		# stores the input of fib which will determine if the task is run
	lw $s0, 0($s0)
	
	beq $s0, $zero, square_start
	
	# Task 1: Fibonacci
	# if (fib != 0) 
	#{
	# 	printf("Fibonacci Numbers:\n"); 
	# 	printf(" 0: 1\n");
	# 	printf(" 1: 1\n"); 
	# 	
	#	int prev = 1, beforeThat = 1; 
	# 	int n = 2; 
	# 	
	# 	while (n <= fib) { 
	#	 	/* REMINDER: C’s printf() function uses "format specifiers," 
	# 	 	like * %d, as the markers for where to drop in the values * * * */ 
	# 		that follow. In the code below, the first %d should be replaced by the value of the variable n, and the second by cur.
	# 	
	# 		int cur = prev+beforeThat; 
	# 		printf(" %d: %d\n", n, cur); 
	# 		n++; 
	# 		beforeThat = prev; prev = cur; 
	# 	} 
	# 	
	# 	printf("\n"); 
	#}
	# Registers:
	#	s0      - value of fib
	#	t1 - t5 - various temporaries
	
	addi $v0, $zero, 4 			# print the string fib
	la $a0, fib_string 	
	syscall
	
	addi $v0, $zero,4 			# print the string zero
	la $a0, zero 
	syscall
	
	addi $v0, $zero,4 			# print the string one
	la $a0, one
	syscall
	
	addi $t1, $t1, 1			# t1 = prev = 1
	addi $t2, $t2, 1			# t2 = beforeThat = 1
	addi $t3, $t3, 2			# t3 = n = 2
	
	while:
	slt $t5, $s0, $t3			# t5 = 1 if fib < n
	bne $t5, $zero, fib_end		# branch if this is true
	
	add $t4, $t1, $t2			# cur = prev + beforeThat

	
	j print					# jump to the print loop 
	after_print:				
	
	addi $t3, $t3, 1 			# n++
	
	andi $t2, $t2, 0			# reset beforeThat to 0
	addi $t2, $t1, 0			# beforeThat = prev
	
	andi $t1, $t1, 0			# reset prev to 0
	addi $t1, $t4, 0			# prev = curr
	
	andi $t4, $t4, 0			# curr = 0
	
	j while					# jump to the top of the loop 
	
	# a loop to load the value of curr and print it
	print:
	
	addi $v0, $zero,4 			# print two spaces
	la $a0, space
	syscall
	
	addi $v0, $zero, 1			# print n
	la $a0, ($t3)
	syscall
	
	addi $v0, $zero, 4			# print ": "
	la $a0, colon
	syscall
	
	addi $v0, $zero, 1			# print curr
	la $a0, 0($t4)
	syscall
	
	addi $v0, $zero, 4			# print a newline
	la $a0, newline
	syscall
	
	j after_print
	
	fib_end:
	addi $v0, $zero, 4			# print a newline
	la $a0, newline
	syscall
	
	square_start:
	
	#if (square != 0)
	#{
	#// NOTE: square_fill is a byte
	#// NOTE: square_size is a word
	#	for (int row=0; row < square_size; row++)
	#	{
	#		char lr, mid;
	#		if (row == 0 || row == square_size-1)
	#		{
	#			lr = ’+’;
	#			mid = ’-’;
	#		}
	#		else
	#		{
	#			lr = ’|’;
	#			mid = square_fill;
	#		}
	#		/* The %c format specifier, in printf(), prints a single
	#		* character. MIPS syscall 11 will be useful here.
	#		*/
	#		printf("%c", lr);
	#		for (int i=1; i<square_size-1; i++)
	#		printf("%c", mid);
	#		printf("%c\n", lr);
	#		}
	#		printf("\n");
	#}	
	#
	# Registers:
	#	s1 - value of square
	#	s5 - square fill
	#	s6 - square size
	#	t0 - row
	#	t1 - lr
	#	t2 - mid
	#	t3 - i
	#	t4 - slt holder
	#	t5 - temporary if needed
	#	t6 - square_size - 1
	
	la $s1, square		 		# s0 = square which will determine if the task is run
	lw $s1, 0($s1)
	
	beq $s1, $zero, run_check_start
	
	la $s5, square_fill
	lb $s5, 0($s5)
	
	la $s6, square_size
	lw $s6, 0($s6)
	
			
	andi $t1, $t1, 0			# reseting temp values to 0
	andi $t2, $t2, 0
	andi $t3, $t3, 0
	andi $t4, $t4, 0
	andi $t5, $t5, 0
	
	addi $t3, $t3, 1			# i = 1
	addi $t0, $t0, 1			# t0 = 1
	
	sub $t6, $s6, $t0			# t6 = square length - 1
	
	andi $t0, $t0, 0			# t0 = 0
	
	outer_for:
	slt $t4, $t0, $s6			# while row < square size
	beq $t4, $zero, square_end
	
	slt $t4, $t0, $zero			# t4 = row < 0
	bne $t4, $zero, second_condition
	
	slt $t4, $zero, $t0
	bne $t4, $zero, second_condition	# t4 = 0 < row
	
	j if_inner				# run the if statement because row == 0
	
	second_condition:
	slt $t4, $t0, $t6			# t4 = row < size - 1
	bne $t4, $zero, square_else
	
	slt $t4, $t6, $t0			# t4 = size - 1 < row
	bne $t4, $zero, square_else	
						# if row is neither > or < size - 1 it must be equal to, and
						# the if condition is met
	if_inner:
	addi $t1, $t1, '+'			# lr = +
	addi $t2, $t2, '-'			# mid = -
	j after_conditions
	
	square_else:				# else block 
	addi $t1, $t1, '|'			# lr = |
	add $t2, $t2, $s5			# mid = square fill 
	
	
	after_conditions:
	addi $v0, $zero, 11			# print lr
	la $a0, 0($t1)
	syscall
	
	print_loop:
	slt $t4, $t3, $t6
	beq $t4, $zero, square_after_print
	
	addi $v0, $zero, 11			# print mid
	la $a0, 0($t2)
	syscall
	
	addi $t3, $t3, 1			# i++
	j print_loop
	
	square_after_print:
	
	addi $v0, $zero, 11			# print lr
	la $a0, 0($t1)
	syscall
	
	addi $v0, $zero, 4			# print newlline
	la $a0, newline
	syscall
	
	andi $t1, $t1, 0			# reset the value of lr
	andi $t2, $t2, 0			# reset the value of mid
	andi $t3, $t3, 0			# reset teh value of i
	addi $t3, $t3, 1			# i = 1
	
	addi $t0, $t0, 1			# row++
	j outer_for
	
	#print a blank line
	square_end:
	addi $v0, $zero, 4			# print a newline
	la $a0, newline
	syscall
	
	run_check_start:
	
	# Task: Run Check:
	# if the given integer list is ascending print Run Check: Ascending
	# if the list is descending print Run Check: Ddescending
	# if neither print Neither
	# Registers:
	#     t0 - index
	#     t1 - value of intArray at index
	#     t2 - ascending boolean
	#     t3 - descending boolean
	#     t4 - index + 1
	#     t5 - value of intArray at index + 1
	#     t6 - slt holder
	#     t7 - 1
	#     t8 - value to keep track of loop runs 
	#     s4 - location of the array
	#     s5 - number of integers to check in array
	#     s7 = i
	
	la $s2, runCheck 			# load runCheck into s1
	lw $s2, 0($s2)
	
	beq $s2, $zero, countWords 		# if runcheck == 0 goto countWords
	
	andi $t0, $t0, 0			# reseting temp values to 0
	andi $t1, $t1, 0			
	andi $t2, $t2, 0
	andi $t3, $t3, 0
	andi $t4, $t4, 0
	andi $t5, $t5, 0
	
	addi $s7, $s7, 1			# s7 = 1
			
	addi $t4, $t4, 1			# t4 = 1
	
	la $s4, intArray			# s4 = location intArray
	lw $t1, 0($s4)				# t0 = value at intArray[0]
	lw $t5, 4($s4)				# t4 = value of intArray[1]
	
	la $s5, intArray_len 			# s5 = intArray_len
	lw $s5, 0($s5)
	
	addi $t2, $t2, 1			# asceding and descending are true
	addi $t3, $t3, 1
	
	addi $t7, $t7, 1			# t7 = 1
	addi $t8, $t8, 0			# t8 = 0
	
	runCheck_loop:
	slt $t6, $t4, $s5			# if index + 1 < intArray_len loop, otherwise break
	beq $t6, $zero, runCheck_print
	
	slti $t6, $t8, 1			# if the loop has only run once or the values are equal run the first pass loop 
	bne $t6, $zero, first_pass
	
	j other_passes
	
	update_variables:
	add $s7, $s7, $s7			# i *= 2
	add $s7, $s7, $s7			# i = i * 4
	
	add $s7, $s4, $s7			# s7 = &intArray[i]
	
	lw $t1, 0($s7)				# t1 = intArray[i]

	andi $t5, $t5, 0			# t5 = 0
	addi $t5, $s7, 4			# t5 = address of i
	lw $t5, 0($t5)				# t5 = intArray[i]

	j runCheck_loop
	
	first_pass:
	slt $t6, $t1, $t5
	bne $t6, $zero, setAscending
	
	slt $t6, $t5, $t1
	bne $t6, $zero, setDescending
	
	addi $t8, $t8, 1
	
	back:
	addi $t0, $t0, 1			# index++
	addi $t4, $t4, 1			# index + 1++
	
	j update_variables
	
	other_passes:
	slt $t6, $t1, $t5			# if value[index] < value[index + 1] check if the list is ascending
	bne $t6, $zero, checkAscending
	
	slt $t6, $t5, $t1
	bne $t6, $zero, checkDescending
	
	addi $t0, $t0, 1			# index++
	addi $t4, $t4, 1			# index + 1++
	
	j update_variables
	
	
	# Set the booleans to false
	setDescending:				# Set descending to false
	sub $t3, $t3, $t7			# descending = 0
	addi $t8, $t8, 1			# loop count = 1

	j back
	
	setAscending:				# Set ascending to false
	sub $t2, $t2, $t7			# ascending = 0
	addi $t8, $t8, 1			# loop count = 1
	
	j back 
	
	# Check if the booleans are false 
	checkAscending:
	slti $t6, $t2, 1			# t6 = ascending < 1
	beq $t6, $zero, runCheck_end		# branch if this is true
	
	checkDescending:
	slti $t6, $t3, 1			# t6 = descending < 1
	beq $t6, $zero, runCheck_end		# branch if this is true
	
	
	#Print statements 
	runCheck_print:
	slti $t6, $t2, 1			# if ascending is false, check descending 
	bne $t6, $zero, printDescending
	
	addi $v0, $zero, 4			# print runCheckString
	la $a0, runCheckString
	syscall
	
	addi $v0, $zero, 4			# print ascending 
	la $a0, asc
	syscall
	
	addi $v0, $zero, 4			# print newline
	la $a0, newline
	syscall
	
	j runCheck_end				# jump to runCheck end
	
	printDescending:
	slti $t6, $t3, 1			# if descending is false go to neither
	bne $t6, $zero, printNeither
	
	addi $v0, $zero, 4			# print runCheckString
	la $a0, runCheckString
	syscall
	
	addi $v0, $zero, 4			# print descending
	la $a0, des
	syscall
	
	addi $v0, $zero, 4			# print newline
	la $a0, newline
	syscall
	
	j runCheck_end				# jump to runCheck end
	
	printNeither:
	
	addi $v0, $zero, 4			# print runCheckString
	la $a0, runCheckString
	syscall
	
	addi $v0, $zero, 4			# print neither
	la $a0, neither
	syscall
	
	addi $v0, $zero, 4			# print newline
	la $a0, newline
	syscall
	
	runCheck_end:
	addi $v0, $zero, 4			# print a newline
	la $a0, newline
	syscall
	
	countWords:
	
	

DONE:	
	lw $ra, 4($sp) # get return address from stack
	lw $fp, 0($sp) # restore the caller’s frame pointer
	addiu $sp, $sp, 24 # restore the caller’s stack pointer
	jr $ra # return to caller’s code
