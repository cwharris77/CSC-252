# ----------- main() -----------
.text


.globl main
main:
	# set of values.
	lui   $fp,      0x4384
	ori   $fp, $fp, 0x7767
	lui   $s0,      0xac63
	ori   $s0, $s0, 0x4282
	lui   $s1,      0x9b5f
	ori   $s1, $s1, 0xd006
	lui   $s2,      0x1373
	ori   $s2, $s2, 0x7c9d
	lui   $s3,      0x923d
	ori   $s3, $s3, 0x0494
	lui   $s4,      0x715c
	ori   $s4, $s4, 0x203d
	lui   $s5,      0xbf5b
	ori   $s5, $s5, 0xe260
	lui   $s6,      0xcd05
	ori   $s6, $s6, 0x7c10
	lui   $s7,      0x9361
	ori   $s7, $s7, 0x8268

	# instead of explicitly dumping the stack pointer, I'll push a dummy
	# variable onto the stack.  Some students are reporting different
	# stack values in their output.
	lui   $t0, 0x31c6
	ori   $t0, $t0,0xd22b
	addiu $sp, $sp,-4
	sw    $t0, 0($sp)
	
	
.data
main__STR1:	.asciiz "asdf"
main__STR2:	.asciiz "123\n456\n789"
main__STR3:	.asciiz "The quick brown fox jumped over the lazy dog."
main__STR4:	.asciiz "qwertyuiopasdfghjklzxcvbnm"
main__STR5:	.asciiz "ABCDEFABCDEFABCDEFABCDEF"
main__STR6:	.asciiz "xYzXyZxxyy"
.text

.data
main__MAP1:	.ascii "................"	# ASCII 0x0
		.ascii "................"	# ASCII 0x1
		.ascii "................"	# ASCII 0x2
		.ascii "qwertyuiop......"	# ASCII 0x3 - numerals
		.ascii ".asdfghjklzxcvbn"	# ASCII 0x4 - uppercase, part 1
		.ascii "mMNBVCXZLKJ....."	# ASCII 0x5 - uppercase, part 2
		.ascii ".HGFDSAPOIUYTREW"	# ASCII 0x6 - lowercase, part 1
		.ascii "Q0987654321....."	# ASCII 0x7 - lowercase, part 2
		.asciiz ""       # null terminator, for debugging after the call

main__MAP2:	.ascii "................"	# ASCII 0x0
		.ascii "................"	# ASCII 0x1
		.ascii "................"	# ASCII 0x2
		.ascii ")!@#$%^&*(......"	# ASCII 0x3 - numerals
		.ascii ".abcdefghijklmno"	# ASCII 0x4 - uppercase, part 1
		.ascii "pqrstuvwxyz....."	# ASCII 0x5 - uppercase, part 2
		.ascii ".ABCDEFGHIJKLMNO"	# ASCII 0x6 - lowercase, part 1
		.ascii "PQRSTUVWXYZ....."	# ASCII 0x7 - lowercase, part 2
		.asciiz ""       # null terminator, for debugging after the call
.text
	# we have a helper function for testing this function, since we want to
	# dump out some info after the function returns.
	la      $a0, main__STR1
	la      $a1, main__MAP1
	jal     test_subsCipher

	la      $a0, main__STR1
	la      $a1, main__MAP2
	jal     test_subsCipher

	la      $a0, main__STR2
	la      $a1, main__MAP1
	jal     test_subsCipher

	la      $a0, main__STR2
	la      $a1, main__MAP2
	jal     test_subsCipher

	la      $a0, main__STR3
	la      $a1, main__MAP1
	jal     test_subsCipher

	la      $a0, main__STR3
	la      $a1, main__MAP2
	jal     test_subsCipher

	la      $a0, main__STR4
	la      $a1, main__MAP1
	jal     test_subsCipher

	la      $a0, main__STR4
	la      $a1, main__MAP2
	jal     test_subsCipher

	la      $a0, main__STR5
	la      $a1, main__MAP1
	jal     test_subsCipher

	la      $a0, main__STR5
	la      $a1, main__MAP2
	jal     test_subsCipher

	la      $a0, main__STR6
	la      $a1, main__MAP1
	jal     test_subsCipher

	la      $a0, main__STR6
	la      $a1, main__MAP2
	jal     test_subsCipher


		
	# dump out all of the registers.
.data
TESTCASE_DUMP1:	.ascii  "\n"
               	.ascii 	"+-----------------------------------------------------------+\n"
		.ascii	"|    Magic Value (popped from the stack):                   |\n"
		.asciiz	"+-----------------------------------------------------------+\n"

TESTCASE_DUMP2:	.ascii  "\n"
               	.ascii 	"+-----------------------------------------------------------+\n"
		.ascii	"|    Testcase Register Dump (fp, then 8 sX regs):           |\n"
		.asciiz	"+-----------------------------------------------------------+\n"
.text
	addi	$v0, $zero, 4		# print_str(TESTCASE_DUMP1)
	la	$a0, TESTCASE_DUMP1
	syscall

	# we pop this from the stack so that, if the stack pointer is not
	# predictable, we'll still get reliable results.
	lw      $a0, 0($sp)
	addiu   $sp, $sp,4
	jal     printHex

	# the rest of the registers have hard-coded values
	addi	$v0, $zero, 4		# print_str(TESTCASE_DUMP2)
	la	$a0, TESTCASE_DUMP2
	syscall

	add	$a0, $fp, $zero
	jal     printHex
	add	$a0, $s0, $zero
	jal     printHex
	add	$a0, $s1, $zero
	jal     printHex
	add	$a0, $s2, $zero
	jal     printHex
	add	$a0, $s3, $zero
	jal     printHex
	add	$a0, $s4, $zero
	jal     printHex
	add	$a0, $s5, $zero
	jal     printHex
	add	$a0, $s6, $zero
	jal     printHex
	add	$a0, $s7, $zero
	jal     printHex
	
	# terminate the program	
	addi	$v0, $zero, 10		# syscall_exit
	syscall
	# never get here!



.globl printSubstitutedString
printSubstitutedString:
	# standard prologue
	addiu  $sp, $sp, -24
	sw     $fp, 0($sp)
	sw     $ra, 4($sp)
	sw     $a0, 8($sp)       # save arg1 for later
	addiu  $fp, $sp, 20

	# corrupt the tX registers!
	lui    $t0,      0xe983
	ori    $t0, $t0, 0x2bcb
	lui    $t1,      0xfebd
	ori    $t1, $t1, 0xc0db
	lui    $t2,      0x4ec1
	ori    $t2, $t2, 0xd506
	lui    $t3,      0x537d
	ori    $t3, $t3, 0xa54c
	lui    $t4,      0x67f4
	ori    $t4, $t4, 0x1fbd
	lui    $t5,      0xaf04
	ori    $t5, $t5, 0x5788
	lui    $t6,      0xe555
	ori    $t6, $t6, 0x8939
	lui    $t7,      0x7411
	ori    $t7, $t7, 0x0599
	lui    $t8,      0x7c7d
	ori    $t8, $t8, 0x27cd
	
.data
printSubstitutedString__MSG1:	.asciiz "pSS(dup): dup="
.text
	addi   $v0, $zero, 4     # print_str(MSG1)
	la     $a0, printSubstitutedString__MSG1
	syscall

	lb     $a0, 8($sp)       # print_str(str)
	syscall

	addi   $v0, $zero,11     # print_char('\n')
	addi   $a0, $zero,'\n'
	syscall
	
	# standard epilogue
	lw     $ra, 4($sp)
	lw     $fp, 0($sp)
	addiu  $sp, $sp, 24
	jr     $ra



.globl test_subsCipher
test_subsCipher:
	# standard prologue
	addiu  $sp, $sp, -24
	sw     $fp, 0($sp)
	sw     $ra, 4($sp)
	sw     $a0, 8($sp)       # save arg1 for later
	sw     $a1, 12($sp)      # save arg2 for later
	addiu  $fp, $sp, 20

	# first, we call the student function	
	jal    subsCipher
	
	# now, we dump out both of the inputs - to ensure that the
	# student didn't modify them.
.data
test_subsCipher__MSG1:	.asciiz "------------ Original String ------------\n"
test_subsCipher__MSG2:	.asciiz "----------------- Map -------------------\n"
test_subsCipher__MSG3:	.asciiz "-----------------------------------------\n"
.text
	addi   $v0, $zero, 4     # print_str(MSG1)
	la     $a0, test_subsCipher__MSG1
	syscall

	lw     $a0, 8($sp)       # print_str(str)
	syscall

	addi   $v0, $zero,11     # print_char('\n')
	addi   $a0, $zero,'\n'
	syscall
	
	addi   $v0, $zero, 4     # print_str(MSG2)
	la     $a0, test_subsCipher__MSG2
	syscall

	lw     $a0, 12($sp)      # print_str(map)
	syscall
	
	addi   $v0, $zero,11     # print_char('\n')
	addi   $a0, $zero,'\n'
	syscall
	
	addi   $v0, $zero, 4     # print_str(MSG3)
	la     $a0, test_subsCipher__MSG3
	syscall

	# standard epilogue
	lw     $ra, 4($sp)
	lw     $fp, 0($sp)
	addiu  $sp, $sp, 24
	jr     $ra



# void printHex(int val)
# {
#     printHex_recurse(val, 8);
#     printf("\n");
# }
printHex:
	# standard prologue
	addiu  $sp, $sp, -24
	sw     $fp, 0($sp)
	sw     $ra, 4($sp)
	addiu  $fp, $sp, 20
	
	# printHex(val, 8)
	addi   $a1, $zero, 8
	jal    printHex_recurse
	
	addi   $v0, $zero, 11      # print_char('\n')
	addi   $a0, $zero, 0xa
	syscall

	# standard epilogue
	lw     $ra, 4($sp)
	lw     $fp, 0($sp)
	addiu  $sp, $sp, 24
	jr     $ra
	
	
	
printHex_recurse:
	# standard prologue
	addiu  $sp, $sp, -24
	sw     $fp, 0($sp)
	sw     $ra, 4($sp)
	addiu  $fp, $sp, 20
	
	# if (len == 0) return;    // base case (NOP)
	beq    $a1, $zero, printHex_recurse_DONE

	# recurse first, before we print this character.
	#
	# The reason for this is because the easiest way to break up
	# a long integer is using a small shift and modulo; so *this*
	# call will be responsible for the *last* hex digit, and we'll
	# use recursion to handle the things which come *before* it.
	#
	# As we've seen just above, if the current len==1, then the
	# recursive call will be the base case, and a NOP.
	
	# of course, we have to save a0 before we recurse.  We do *NOT*
	# need to save a1, since we'll never need it again.
	sw     $a0, 8($sp)
	
	# printHex_recurse(val >> 4, len-1)
	srl    $a0, $a0,4
	addi   $a1, $a1,-1
	jal    printHex_recurse
	
	# restore a0
	lw     $a0, 8($sp)
	
	# the value we will print is (val & 0xf), interpreted as hex.
	andi   $t0, $a0,0x0f      # digit = (val & 0xf)
	
	slti   $t1, $t0,10        # t1 = (digit < 10)
	beq    $t1, $zero, printHex_recurse_LETTER
	
	# if we get here, then $t0 contains an integer from 0 to 9, inclusive.
	addi   $v0, $zero, 11     # print_char(digit+'0')
	addi   $a0, $t0, '0'
	syscall
	
	j      printHex_recurse_DONE
	
printHex_recurse_LETTER:
	# if we get here, then $t0 contains an integer from 10 to 15, inclusive.
	# convert to the equivalent letter.
	addi   $t0, $t0,-10        # digit -= 10
	
	addi   $v0, $zero, 11     # print_char(digit+'a')
	addi   $a0, $t0, 'a'
	syscall
	
	# intentional fall-through to the epilogue	

printHex_recurse_DONE:
	# standard epilogue
	lw     $ra, 4($sp)
	lw     $fp, 0($sp)
	addiu  $sp, $sp, 24
	jr     $ra
