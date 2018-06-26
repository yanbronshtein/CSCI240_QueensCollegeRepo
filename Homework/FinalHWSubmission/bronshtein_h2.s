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
	array: .space 40 
	PROMPT: 	.asciiz "Enter a an integer value.\n"
	calculatedAverage: .asciiz "The average is:\n"
	newline: .asciiz "\n"
	GOODBYE: .asciiz "\nLa revedere Profesor Fluture\n"
	size: .word 10



.text


main:
	addi $t0, $zero, 0	#initialize the counter
	
	
	jal readInt #prompt 1st num
	
	
	move $t1, $v0 	#move int to a different

	sw $t1, array($t0)	#save at first index in array
	

	addi $t0, $t0, 4	#array+4

	add $a3, $a3, $t1	#sum +=array[i]
	

	jal readInt	#prompt second num

	move $t2, $v0	#move int to a different

	sw $t2, array($t0)	#save at index 1 in array

	addi $t0, $t0, 4	#array+4

	add $a3,$a3, $t2	#sum +=array[i]
	

	jal readInt 	#prompt 3rd num

	move $t3, $v0 	#move int to a dif location

	sw $t3, array($t0) 	#save at index 2 in array

	addi $t0, $t0, 4 	#array+4

	add $a3,$a3, $t3 	#sum +=array[i]
	

	jal readInt 	#prompt 4th num

	move $t4, $v0 	#move int to a dif location

	sw $t4, array($t0) 	#save at index 3 in array

	addi $t0, $t0, 4 	#array = array+4

	add $a3,$a3, $t4 	#sum +=array[i]
	

	jal readInt 	#prompt 5th num

	move $t5, $v0 	#move int to a dif location

	sw $t5, array($t0)	#save at index 4 in array

	addi $t0, $t0, 4	#array+4

	add $a3,$a3, $t5	#sum +=array[i]
	

	jal readInt	#prompt 6th num

	move $t6, $v0	#move int to a dif location

	sw $t6, array($t0)	#save at index 5 in array

	addi $t0, $t0, 4	#array+4

	add $a3,$a3, $t6	#sum +=array[i]
	

	jal readInt	#prompt 7th num

	move $t7, $v0	#move int to a dif location

	sw $t7, array($t0)	#save at index 6 in array

	addi $t0, $t0, 4	#array+4

	add $a3,$a3, $t7	#sum +=array[i]
	

	jal readInt	#prompt 8th num

	move $t8, $v0	#move int to a dif location

	sw $t8, array($t0)	#save at index 7 in array

	addi $t0, $t0, 4	#array+4

	add $a3,$a3, $t8	#sum +=array[i]
	

	jal readInt 	#prompt 9th num

	move $t9, $v0	#move int to a dif location

	sw $t9, array($t0)	#save at index 8 in array

	addi $t0, $t0, 4	#array+4

	add $a3,$a3, $t9	#sum +=array[i]
	

	addi $t9, $zero, 0	#zero out t9 so i can use it again

	jal readInt	#prompt 10th num

	move $t9, $v0	#move int to a dif location

	sw $t9, array($t0)	#save at index 8 in array

	addi $t0, $t0, 4	#array+4

	add $a3,$a3, $t9	#sum +=array[i]
	
	jal calcAverage
	jal carriageReturn
	#move index to one offset from the size so it correclty pointing at the alst element in array
	addi $t0, $t0, -4
	j printArray
	#print sum ($a3)
  	##move $a0, $a3
   	#syscall
   	
   	
	
	#reset counter to 0
	#addi $t0, $zero, 0
	#load array into t1 at 0

calcAverage:	
	li $v0, 4
	la $a0, calculatedAverage
	syscall
	
	
	#print sum ($a3) / 10 rounded down
	div $a3, $a3, 10
	li $v0, 1
  	move $a0, $a3
   	syscall
 
   	
	li $v0, 4
	la $a0, newline
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	jr $ra
	

  				
printArray:
	#as long as its not -4 keep going
	beq $t0, -4, exit	
	lw $t1, array($t0)
	#increment down by 2
	
	#print array
	li $v0, 1
	move $a0, $t1
	syscall 
	
	#print new line
	li $v0, 4
	la $a0, newline
	syscall
	
	addi $t0, $t0, -8
	
	j printArray

	

    	
	
	
readInt:
	li $v0, 4
	la $a0, PROMPT
	syscall
	#read int
	li $v0, 5
	syscall
	jr $ra


#I had some bugs here so I ended up hardcoding
carriageReturn:
			
	#print new line
	li $v0, 4
	la $a0, newline
	syscall
	jr $ra
	

#I had some bugs here so I ended up hardcoding
printNum:
#print array
	li $v0, 1
	move $a0, $t1
	syscall	
	jr $ra
	
exit:
  	li $v0,4 #Prompt the user to enter a second integer that is less than 0
 	la $a0, GOODBYE
 	syscall
  	li $v0, 10                                                                                                                                                               
    	syscall
	
	
		

	 	
	
