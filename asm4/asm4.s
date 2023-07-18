.data
	newline: .asciiz "\n"
	turtle:  .asciiz "Turtle \""
	end:     .asciiz "\""
	pos:	 .asciiz "  pos "
	comma:	 .asciiz ","
	dir:	 .asciiz "  dir "
	od:	 .asciiz "  odometer "
	north:   .asciiz "North\n"
	south:   .asciiz "South\n"
	east:    .asciiz "East\n"
	west:    .asciiz "West\n"
	this:   .asciiz "Got here\n"
	
.text

.globl turtle_init
	# A function which takes a pointer to a turtle object and name as parameters and initializes the fields of the
	# turtle
	# Returns null.
	# Registers:
	#	Uses no extra registers besides the parameters passed in
	#	
turtle_init:

	addiu $sp, $sp, -24		# standard prolouge 
	sw $fp, 0($sp)
	sw $ra, 4($sp)
	addiu $fp, $sp, 20
	
	sb $zero, 0($a0)           	# initialize x to 0
	sb $zero, 1($a0)		# initialize y to 0
	sb $zero, 2($a0)		# initialize dir to 0
	sb $zero, 3($a0)		# initialize pad to 0
	
	sw $a1, 4($a0)			# initialize name to to pointer to name string
	
	sw $zero, 8($a0)		# initialize odom to 0
	
	lw $ra, 4($sp)			# standard epilogue 
	lw $fp, 0($sp)
	addiu $sp, $sp, 24
	jr $ra

.globl turtle_debug
	# Prints the fields of the turtle 
	# Returns null.
	# Registers:
	#	t0 - pointer to turtle name
	#	t1 - pointer to x field
	#	t2 - pointer to y field
	#	t3 - pointer to dir field
	#	t5  - pointer to odometer field
	#	t3, t4 - various temporaries
	#
turtle_debug:
	
	addiu $sp, $sp, -24		# standard prolouge 
	sw $fp, 0($sp)
	sw $ra, 4($sp)
	addiu $fp, $sp, 20
	
	addi $t0, $zero, 0		# t0 = pointer to name
	addi $t0, $a0, 4
	
	addi $t1, $zero, 0		# t1 = pointer to x
	addi $t1, $a0, 0
	
	addi $t2, $zero, 0		# t2 = pointer to y
	addi $t2, $a0, 1
	
	addi $t3, $zero, 0		# t3 = pointer to dir
	addi $t3, $a0, 2
	
	addi $t5, $zero, 0		# t5 = pointer to odometer
	addi $t5, $a0, 8		
	
	addi $v0, $zero, 4		# print string turtle
	la $a0, turtle
	syscall
	
	addi $v0, $zero, 4		# print turtle name
	lw $a0, 0($t0)
	syscall
	
	addi $v0, $zero, 4		# print string end
	la $a0, end
	syscall
	
	addi $v0, $zero, 4		# print string newline
	la $a0, newline
	syscall
	
	addi $v0, $zero, 4		# print string pos
	la $a0, pos
	syscall
	
	addi $v0, $zero, 1		# print x
	lb $a0, 0($t1)
	syscall
	
	addi $v0, $zero, 4		# print x
	la $a0, comma
	syscall
	
	addi $v0, $zero, 1		# print y
	lb $a0, 0($t2)
	syscall
	
	addi $v0, $zero, 4		# print string newline
	la $a0, newline
	syscall
	
	addi $v0, $zero, 4		# print string dir
	la $a0, dir
	syscall
	
	lb $t3, 0($t3)			# t3 = value of dir
	
	beq $t3, $zero, print_north	# if dir == 0 print north
	
	addi $t4, $zero, 0		# initialize t4 to 0
	
	addi $t4, $t3, -1		# t4 = t3 - 1
	beq $t4, $zero, print_east	# if dir == east print east
	
	addi $t4, $t4, 1		# reset t4 to value of t3
	addi $t4, $t3, -2		# t4 = t3 - 2
	beq $t4, $zero, print_south	# if dir == south goto print south
	
	addi $t4, $t4, 2		# reset t4 to value of t3
	addi $t4, $t3, -3		# t4 = t3 - 3
	beq $t4, $zero, print_west	# if dir == south goto print west
	
	print_north:
	addi $v0, $zero, 4		# print string north
	la $a0, north
	syscall
	
	j after_print
	
	print_east:
	addi $v0, $zero, 4		# print string east
	la $a0, east
	syscall
	
	j after_print
	
	print_south:
	addi $v0, $zero, 4		# print string south
	la $a0, south
	syscall
	
	j after_print
	
	print_west:
	addi $v0, $zero, 4		# print string west
	la $a0, west
	syscall
	
	j after_print
	
	after_print:
	addi $v0, $zero, 4		# print string od
	la $a0, od
	syscall
	
	addi $v0, $zero, 1		# print value of odometer
	lw $a0, 0($t5)
	syscall
	
	addi $v0, $zero, 4		# print string newline
	la $a0, newline
	syscall
	
	addi $v0, $zero, 4		# print string newline to add a blank line
	la $a0, newline
	syscall
	
	lw $ra, 4($sp)			# standard epilogue 
	lw $fp, 0($sp)
	addiu $sp, $sp, 24
	jr $ra
	
	
.globl turtle_turnLeft
	# Turns the turtle left
	# Returns null.
	# Registers:
	#	t0 - value of dir/temporaries
	#	t1 - various temporaries
	#
turtle_turnLeft:

	addiu $sp, $sp, -24			# standard prolouge 
	sw $fp, 0($sp)
	sw $ra, 4($sp)
	addiu $fp, $sp, 20
	
	addi $t0, $zero, 0
	lb $t0, 2($a0)				# t0 = dir
	
	addi $t0, $t0, -1

	slt $t1, $zero, $t0
	bne $t1, $zero, finish_left_turn	# if the dir was not 0, goto finsih turn
	
	addi $t0, $zero, 0
	addi $t0, $t0, 3			# else, t0 = 3
	
	finish_left_turn:			# this is where fields will be updated
	sb $t0, 2($a0)
	
	lw $ra, 4($sp)			# standard epilogue 
	lw $fp, 0($sp)
	addiu $sp, $sp, 24
	jr $ra
	
.globl turtle_turnRight
	# Turns the turtle right
	# Returns null.
	# Registers:
	#	t0 - value of dir/temporaries
	#	t1 - various temporaries
	#
turtle_turnRight:

	addiu $sp, $sp, -24			# standard prolouge 
	sw $fp, 0($sp)
	sw $ra, 4($sp)
	addiu $fp, $sp, 20
	
	addi $t0, $zero, 0
	lb $t0, 2($a0)			# t0 = dir
	
	addi $t0, $t0, 1
	
	addi $t1, $zero, 0		# t1 = 4
	addi $t1, $t1, 4
	
	bne $t0, $t1, finish_right_turn	# if the dir was not 0, goto finish right turn
	
	addi $t0, $zero, 0		# else, t0 = 0
	
	finish_right_turn:		# this is where fields will be updated
	sb $t0, 2($a0)
	
	lw $ra, 4($sp)			# standard epilogue 
	lw $fp, 0($sp)
	addiu $sp, $sp, 24
	jr $ra
	
.globl turtle_move
turtle_move:
	# This function moves the turtle forward by a certain distance. It might be positive, negative, or zero. 
	# If the distance is positive, then it moves in the direction that it is facing; if it is negative, then it 
	# moves in the opposite direction (but keeps its current facing)
	# Registers:
	#	t0 - address of the turtle object
	#	t2 - various temporaries
	#	t3 - various temporaries
	#	t4 - various temporaries
	#	t7 - various temporaries
	#
	
	addiu $sp, $sp, -24		# standard prolouge 
	sw $fp, 0($sp)
	sw $ra, 4($sp)
	addiu $fp, $sp, 20
	
	addi $t0, $zero, 0		# t0 = 0
	add $t0, $t0, $a1		# t0 = value of a1
	
	addi $t1, $zero, 0		# t1 = 0
	addi $t2, $zero, 0		# t2 = 0
	
	sra $t1, $t0, 31		# t1 = 0 if t0 is positive, 0xFFFFF... if not
	xor $t2, $t1, $t0		# bits are flipped if t0 was negative
	sub $t3, $t2, $t1		# t4 = absolute value of t0
	
	add $t7, $zero, $t3		# t7 = absolute value of a1
	
	lw $t4, 8($a0)			# t4 = value of odometer
	
	add $t3, $t3, $t4		# t3 = old odometer val + new 
	
	sw $t3, 8($a0)			# update value of odometer
	
	# checks for direction
	lb $t3, 2($a0)			# t0 = value of dir
	
	beq $t3, $zero, north_check	# if dir == 0 goto north_check
	
	addi $t4, $zero, 0		# initialize t4 to 0
	
	addi $t4, $t3, -1		# t4 = t3 - 1
	beq $t4, $zero, east_check	# if dir == east east_check
	
	addi $t4, $t4, 1		# reset t4 to value of t3
	addi $t4, $t3, -2		# t4 = t3 - 2
	beq $t4, $zero, south_check	# if dir == south goto south check
	
	addi $t4, $t4, 2		# reset t4 to value of t3
	addi $t4, $t3, -3		# t4 = t3 - 3
	beq $t4, $zero, west_check	# if dir == west goto west check
	
	north_check:
	slt $t0, $a1, $zero		# t0 = a1 < 0
	bne $t0, $zero, move_south	# move south if true
	
	j move_north
	 
	east_check:
	slt $t0, $a1, $zero		# t0 = a1 < 0
	bne $t0, $zero, move_west	# move west if true
	
	j move_east
	 
	south_check:
	slt $t0, $a1, $zero
	bne $t0, $zero, move_north
	
	j move_south
	 
	west_check:
	slt $t0, $a1, $zero
	bne $t0, $zero, move_east

	j move_west
	
	move_north:
	lb $t0, 1($a0)			# t0 = y
	
	addi $t1, $zero, 0		# t1 = 0
	add  $t1, $t7, $t0		# t1 = t7 + t0, move dist + current y pos
	
	sb $t1, 1($a0)			# update y val
	
	j clamp_check
	
	move_east:
	lb $t0, 0($a0)			# t0 = x
	
	addi $t1, $zero, 0		# t1 = 0
	add  $t1, $t7, $t0		# t1 = t7 + t0, move dist + current x pos
	
	sb $t1, 0($a0)			# update x val
	
	j clamp_check
	
	move_south:
	lb $t0, 1($a0)			# t0 = y
	
	addi $t1, $zero, 0		# t1 = 0
	sub  $t1, $t0, $t7		# t1 = t0 - t7,  current y pos - move dist
	
	sb $t1, 1($a0)			# update y val
	
	j clamp_check
	
	move_west:
	lb $t0, 0($a0)			# t0 = x
	
	addi $t1, $zero, 0		# t1 = 0
	sub  $t1, $t0, $t7		# t1 = t0 - t7, current x pos - move dist 
	
	sb $t1, 0($a0)			# update x val
	
	clamp_check:
	
	lb $t0, 0($a0)			# t0 = x
	lb $t1, 1($a0)			# t1 = y
	
	slti $t2, $t0, -10 		# t3 = t0 < -10
	bne $t2, $zero, clamp_x_up	# if true goto clamp x up
	
	j check_x_down			
	
	clamp_x_up:
	addi $t3, $zero, -10		# t3 = -10
	
	sb $t3, 0($a0)			# update x to -10
	
	j check_y_up
	
	check_x_down:
	slti $t2, $t0, 10 		# t3 = 10 < t0
	beq $t2, $zero, clamp_x_down	# if true goto clamp x down
	
	j check_y_up
	
	clamp_x_down:
	addi $t3, $zero, 10		# t3 = 10
	
	sb $t3, 0($a0)			# update x to 10
	
	# clamp checks for the y val
	check_y_up:
	slti $t2, $t1, -10 		# t3 = t1 < -10
	bne $t2, $zero, clamp_y_up	# if true goto clamp y up
	
	j check_y_down			
	
	clamp_y_up:
	addi $t3, $zero, -10		# t3 = -10
	
	sb $t3, 1($a0)			# update y to -10
	
	j done
	
	check_y_down:
	slti $t2, $t1, 10 		# t3 = 10 < t1
	beq $t2, $zero, clamp_y_down	# if true goto clamp y down
	
	j done
	
	clamp_y_down:
	addi $t3, $zero, 10		# t3 = 10
	
	sb $t3, 1($a0)			# update y to 10
	
	done:
	lw $ra, 4($sp)			# standard epilogue 
	lw $fp, 0($sp)
	addiu $sp, $sp, 24
	jr $ra
	
.globl turtle_searchName
	# This function searches through the various Turtle objects in the array, looking for one which has a 
	# name which matches the needle parameter. Returns the index of turtle obj with name matching needle parameter
	# or -1 if none is found.
	# Registers:
	#	t0 - i
	#	t5 - holder for address of index
	#	t4 - size of turtle object
	#	t2 - various temporaries
	#
turtle_searchName:

	addiu $sp, $sp, -24		# standard prolouge 
	sw $fp, 0($sp)
	sw $ra, 4($sp)
	addiu $fp, $sp, 20
	
	addi $t0, $zero, 0		# t0 = 0 = i
	
	addi $t4, $zero, 12		# size of turtle object
	addi $t5, $zero, 0		# address of curent index
	
	search_loop:
	slt $t2, $t0, $a1
	beq $t2, $zero, loop_end
	
	mult $t0, $t4			# i * 12
	mflo $t5			# t5 = i * 12

	add  $t5, $t5, $a0		# t5 = address of base + i * 12
	
	addiu $sp, $sp, -16		# save paramaters onto the stack so strcmp can be called
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $t0, 8($sp)
	sw $t4, 12($sp)
	sw $t5, 16($sp)
	
	lw $a0, 4($t5)		        # a0 = address of current turtle name
	add $a1, $a2, $zero		# a1 = address of needle pointer
	
	jal strcmp
	
	lw $a0, 0($sp)			# restore the values of a0 and a1 and others
	lw $a1, 4($sp)
	lw $t0, 8($sp)
	lw $t4, 12($sp)
	lw $t5, 16($sp)
	addiu $sp, $sp, 16
	
	slt $t2, $v0, $zero		# t2 = v0 < 0
	bne $t2, $zero, continue	# if v0 < 0 continue
	
	slt $t2, $zero, $v0		# t2 = v0 > 0
	bne $t2, $zero, continue	# if v0 > 0 continue
	
	addi $v0, $t0, 0		# else return the index of the turtle object

	j search_name_done

	continue:
	addi $t0, $t0, 1		# i++
	j search_loop
	
	loop_end:
	addi $v0, $zero, -1
	
	search_name_done:
	lw $ra, 4($sp)			# standard epilogue 
	lw $fp, 0($sp)
	addiu $sp, $sp, 24
	jr $ra
	
.globl turtle_sortByX_indirect
turtle_sortByX_indirect:

	addiu $sp, $sp, -24		# standard prolouge 
	sw $fp, 0($sp)
	sw $ra, 4($sp)
	addiu $fp, $sp, 20
	
	
	lw $ra, 4($sp)			# standard epilogue 
	lw $fp, 0($sp)
	addiu $sp, $sp, 24
	jr $ra
