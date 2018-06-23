###################################################

#Name: Yaniv Bronshtein
#Last Modified: 06/2/18
#
#Program Name: bronshtein_hw1.S

#Description: This program prompts the user to input
#2 integers in the specified ranges computes a value
#based on the specified formula and displays the output back to the user according to the formula :8*int1+int2-26



#Pseudocode:
#





#	  	 

 		
#Write a MIPS assembly language program that accomplishes the following tasks:
#The program will prompt the user to enter 10 values that will represent the elements of
#an array.
# Compute and display the average of these elements.
# Display the elements of the array on one column, in reverse order with a step of 2.
#For example: If you array elements are: 1 2 3 4 5 6 7 8 9 11
#The display will be
#11
#8
#6
#4
#2 		
################################################### 




#	n: .word 10
	


.data
	array: .space 40 #Assign 40 bytes for 10 integer elements
		PROMPT1: .asciiz "Please enter 10 integer values\n"
	n: .word 3

	PROMPT2: .asciiz "Done\n"
.globl main	
.text

	
main:
	#Prompt
	li $v0,3 #Prompt the user to enter a second integer that is less than 0
 	la $a0, PROMPT1
 	syscall
 	
 	#Counter variable

 
 	 
 	
 	
li $t0,3 
 	#Pointer to array
 	la $t1, array
 
 #for:
 
while:
li $v0,5 # system call code for reading an integer from console
syscall
move $t5, $v0 #Save the integer in register t1
sw $t5,0($t1) # a[i]=input
add $t0, $t0,-1 #--i
add $t1, $t1,4 # a + i
bgtz $t0, while

 
#la $t0, n # t0 is a constant 10
#li $t1, 0 # t1 is our counter (i)
#loop:
#beq $t1, $t0, end # if t1 == 10 we are done
#loop body
#addi $t1, $t1, 1 # add 1 to t1
#	li $v0,5 # system call code for reading an integer from console
# syscall
# move $t5, $v0 #Save the integer in register t1
#	sw $t5,0($t1) # a[i]=input
#	add $t0, $t0,-1 #--i
#	add $t1, $t1,4 # a + i		
