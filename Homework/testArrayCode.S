


.data
	PROMPT1: .asciiz "Please enter 10 integer values\n"
	PROMPT2: .asciiz "Done\n"
	.align 4
	array: .space 40 #Assign 40 bytes for 10 integer elements
#	n: .word 10
	n: .word 3



#.globl main	
.text

	
main:
	#Prompt
	li $v0,4 #Prompt the user to enter a second integer that is less than 0
 	la $a0, PROMPT1
 	syscall
 	
 	#Counter variable

# 	la $t0,n 
 	#Pointer to array
 	la $a0, array
strlen:
li $t0, 0 # initialize the count to zero
loop:
lbu $t1, 0($a0) # load the next character into t1
beqz $t1, exit # check for the null character
addi $a0, $a0, 1 # increment the string pointer
addi $t0, $t0, 1 # increment the count
j loop # return to the top of the loop
#End Program
 	exit:
 	li $v0, 10                                                                                                                                                               
    	syscall
