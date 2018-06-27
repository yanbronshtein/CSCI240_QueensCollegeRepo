#Name:Yaniv Bronshtein
#Date Modified: 06/25/18
#
#Description:
#This program prompts the user to input 10 numbers and then proceeds to store the values in an array, calculates the average, and then 
#prints the list in reverse order with a specified step size


.data
	PROMPTNUMS: .asciiz "Please enter 10 integer values\n"
	array: .space 40
	n: .word 10
	GOODBYE: .asciiz "\nla reverde Profesor Fluture\n"
	GOODBYEBRIEF: .asciiz "\ pa Profesor Fluture\n"
	TAB: .asciiz "\t"

.globl main
.text

main:
	#Prompt user for 10 integers
	li $v0,4
	la $a0, PROMPTNUMS
	syscall
	

	#initializations
#	la $s0, array #s0 is a pointer to the start of our array
#	lw $s2, n

	la $s0, array # pseudoinstruction (load address)
 	# I will explain this soon.
	add $s1, $zero, $zero # initialize ct, $s1 = 0.
readInt:
 	add $t0, $s0, $s1 # address of byte to examine next
 	lw $t1, 0( $t0 ) # load that byte
 	beq $t1, $zero, printArray # branch if *(s + ct) == '\0'
 	addi $s1, $s1, 1 # increment ct
 	j loop
 	
 printArray:
 	add $t0, $s0, $s1 # address of byte to examine next
 	lw $t1, 0( $t0 ) # load that byte
 	beq $t1, $zero, printArray # branch if *(s + ct) == '\0'
 	addi $s1, $s1, 1 # increment ct
 	j loop



#readInt:
#	li $v0, 5 #Read integer from user
#	beq $v0, 99,exit #Check for sentinel
#
#	sll $t0, $s2, 2 # offset = i * 4
#	sw $t0, ( $s0 ) # a [ 15 ]
#	add $t0, $s0, $t0 # base + offset
	#lw $s1, 0( $t0 )
	 
	
	

	

printTab:
	li $v0,4 #print tab
	la $a0, TAB
	syscall
	jr $ra	
	
	
exit:
	li $v0, 4
	la $a0, GOODBYEBRIEF
	syscall
	
	li $v0,10
	syscall
	
	
	
	
	
	
	
	

	
	
	 
	
