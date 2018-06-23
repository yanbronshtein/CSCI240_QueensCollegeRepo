#Julien Bankier
#June 23, 2018
#Bankier_h2
#
#Write a MIPS assembly language program that accomplishes the following tasks:
#The program will prompt the user to enter 10 values that will represent the elements of an array.
#Compute and display the average of these elements.
#Display the elements of the array on one column, in reverse order with a step of 2.
#
#psudo-code 
# int[] array = int[10];
# int sum,num, avr = 0;
# scanner reader = new scanner(system.in);
# system.out.println("enter a num");
# for (int i = 0; i<array.length; i++)
#	int num = reader.nextInt()
#	array[i] = num;
#	sum = sum + num;
# avr = sum/10;
# for (int i = array.length; i>0, i-=2)
#	println(array[i]);
#system.exit(0)
#
#

.data 
	array: .space 40 # 10 ints * 4 
	size: .word 10
	promptnum: 	.asciiz "Enter a numbers to store in array: "
	computedAverage: .asciiz "Average of array indexs is:"
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
	
	
	#print sum ($a3)
  	##move $a0, $a3
   	#syscall
   	
   	
	
	#reset counter to 0
	#addi $t0, $zero, 0
	#load array into t1 at 0
	

printArray:

	beq $t0, 0, exit	#as long as its not 0	
	lw $t1, array($t0)
	#increment down by 2
	jal printElem
	
	 
	
	addi $t0, $t0, -8
	
	jal carriageReturn
	
	
	j printArray
	
	
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
	
printElem:
#print array
	li $v0, 1
	move $a0, $t1
	syscall	
	jr $ra
	


	
	
	
	
	
	
	
	
	 
	
