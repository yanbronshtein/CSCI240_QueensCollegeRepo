###################################################

#Name: Yaniv Bronshtein
#Last Modified: 06/2/18
#
#Program Name: bronshtein_hw2.S

#Description: This program prompts the user to input
#2 integers in the specified ranges computes a value
#based on the specified formula and displays the output back to the user according to the formula :8*int1+int2-26



#Pseudocode:
#


#Write a MIPS assembly language program that accomplishes the following tasks:
#The program will prompt the user to enter 10 values that will represent the elements of an array.
#Compute and display the average of these elements.
#Display the elements of the array on one column, in reverse order with a step of 2.



# #include <stdio.h>
# #include <stdlib.h>





#int average(int array[],int size)
#{
#    int i;
#    int avg, sum = 0,step = 2,size = 10;
#    for (i = 0; i < size; ++i) {
#        sum += array[i];
#    }
#    avg = (sum / size);
#    return avg;
#}

#void printArray(int array[],int size,int step)
#{
#	int i;
#	for(int i = size; i > 0; --i)
#	{
#		printf("%d\n",array[i];
	
#	}
#}
#int main(int argc, char **argv){ 
#	int array[size];	
#	int sum = 0,avg = 0;
# 	printf("Enter a set of 10 integer values.\n");
#	int i;
	
#	for(i = 0; i < size ;++i)
#	{
#		scanf("%d",(array + i));
#		
#	}
#	avg = average(average,size);
#	printf("The average is:\n");
#	printArray(array,size,step);
#	
#	return 0;
#}

.data 
	array: .space 40 # 10 ints * 4 
	size: .word 10
	promptnum: 	.asciiz "Enter a set of integer values.\n"
	computedAverage: .asciiz "The average is:\n"
	newline: .asciiz "\n"


.text

	addi $t0, $zero, 0	#create couter init at 0
	
	#prompt for first num
	jal readInt
	
	
	move $t1, $v0 	#move int to a dif location

	sw $t1, array($t0)	#save at index 0 in array
	

	addi $t0, $t0, 4	#incremnt counter up by one

	add $a3, $a3, $t1	#add number to sum
	

	jal readInt	#again for number 2

	move $t2, $v0	#move int to a dif location

	sw $t2, array($t0)	#save at index 1 in array

	addi $t0, $t0, 4	#incremnt counter up by one

	add $a3,$a3, $t2	#add number to sum
	

	jal readInt 	#again for number 3

	move $t3, $v0 	#move int to a dif location

	sw $t3, array($t0) 	#save at index 2 in array

	addi $t0, $t0, 4 	#incremnt counter up by one

	add $a3,$a3, $t3 	#add number to sum
	

	jal readInt 	#again for number 4

	move $t4, $v0 	#move int to a dif location

	sw $t4, array($t0) 	#save at index 3 in array

	addi $t0, $t0, 4 	#incremnt counter up by one

	add $a3,$a3, $t4 	#add number to sum
	

	jal readInt 	#again for number 5

	move $t5, $v0 	#move int to a dif location

	sw $t5, array($t0)	#save at index 4 in array

	addi $t0, $t0, 4	#incremnt counter up by one

	add $a3,$a3, $t5	#add number to sum
	

	jal readInt	#again for number 6

	move $t6, $v0	#move int to a dif location

	sw $t6, array($t0)	#save at index 5 in array

	addi $t0, $t0, 4	#incremnt counter up by one

	add $a3,$a3, $t6	#add number to sum
	

	jal readInt	#again for number 7

	move $t7, $v0	#move int to a dif location

	sw $t7, array($t0)	#save at index 6 in array

	addi $t0, $t0, 4	#incremnt counter up by one

	add $a3,$a3, $t7	#add number to sum
	

	jal readInt	#again for number 8

	move $t8, $v0	#move int to a dif location

	sw $t8, array($t0)	#save at index 7 in array

	addi $t0, $t0, 4	#incremnt counter up by one

	add $a3,$a3, $t8	#add number to sum
	

	jal readInt 	#again for number 9

	move $t9, $v0	#move int to a dif location

	sw $t9, array($t0)	#save at index 8 in array

	addi $t0, $t0, 4	#incremnt counter up by one

	add $a3,$a3, $t9	#add number to sum
	

	addi $t9, $zero, 0	#zero out t9 so i can use it again

	jal readInt	#again for number 10

	move $t9, $v0	#move int to a dif location

	sw $t9, array($t0)	#save at index 8 in array

	addi $t0, $t0, 4	#incremnt counter up by one

	add $a3,$a3, $t9	#add number to sum
	
	jal calcAverage
	jal carriageReturn
	#print sum ($a3)
  	##move $a0, $a3
   	#syscall
   	
   	
	
	#reset counter to 0
	#addi $t0, $zero, 0
	#load array into t1 at 0
	

printReverseArray:

	beq $t0, 0, exit	#as long as its not 0	
	lw $t1, array($t0)
	#increment down by 2
	jal printNum
	
	 
	
	addi $t0, $t0, -8
	
	jal carriageReturn
	
	
	j printReverseArray
	

	
calcAverage:
	la $t9, size
	div $a3, $t8
	mflo $t1
	#Print prompt average
	li $v0, 4
	la $a0,computedAverage 
	syscall
	jal printNum
	
	jr $ra
	
	
	 # End Program
    exit:	
    	li $v0, 10
   	syscall
	
	
readInt:
	li $v0, 4
	la $a0, promptnum
	syscall
	#read int
	li $v0, 5
	syscall
	jr $ra

storeElement:
	move $v1, $v0 	#move int to a dif location

	sw $v1, array($t0)	#save at index 0 in array
	jr $ra
	
carriageReturn:
			
	#print new line
	li $v0, 4
	la $a0, newline
	syscall
	jr $ra
	
printNum:
#print array
	li $v0, 1
	move $a0, $t1
	syscall	
	jr $ra
	

	
	
		

	 	
	