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
	#move int to a dif location
	move $t1, $v0
	#save at index 0 in array
	sw $t1, array($t0)
	#incremnt counter up by one
	addi $t0, $t0, 4
	#add number to sum
	add $a3, $a3, $t1
	
	#again for number 2
	jal readInt
	#move int to a dif location
	move $t2, $v0
	#save at index 1 in array
	sw $t2, array($t0)
	#incremnt counter up by one
	addi $t0, $t0, 4
	#add number to sum
	add $a3,$a3, $t2
	
	#again for number 3
	jal readInt
	syscall 
	#move int to a dif location
	move $t3, $v0
	#save at index 2 in array
	sw $t3, array($t0)
	#incremnt counter up by one
	addi $t0, $t0, 4
	#add number to sum
	add $a3,$a3, $t3
	
	#again for number 4
	jal readInt
	#move int to a dif location
	move $t4, $v0
	#save at index 3 in array
	sw $t4, array($t0)
	#incremnt counter up by one
	addi $t0, $t0, 4
	#add number to sum
	add $a3,$a3, $t4
	
	#again for number 5
	jal readInt
	#move int to a dif location
	move $t5, $v0
	#save at index 4 in array
	sw $t5, array($t0)
	#incremnt counter up by one
	addi $t0, $t0, 4
	#add number to sum
	add $a3,$a3, $t5
	
	#again for number 6
	jal readInt
	#move int to a dif location
	move $t6, $v0
	#save at index 5 in array
	sw $t6, array($t0)
	#incremnt counter up by one
	addi $t0, $t0, 4
	#add number to sum
	add $a3,$a3, $t6
	
	#again for number 7
	jal readInt
	#move int to a dif location
	move $t7, $v0
	#save at index 6 in array
	sw $t7, array($t0)
	#incremnt counter up by one
	addi $t0, $t0, 4
	#add number to sum
	add $a3,$a3, $t7
	
	#again for number 8
	jal readInt
	#move int to a dif location
	move $t8, $v0
	#save at index 7 in array
	sw $t8, array($t0)
	#incremnt counter up by one
	addi $t0, $t0, 4
	#add number to sum
	add $a3,$a3, $t8
	
	#again for number 9
	jal readInt 
	#move int to a dif location
	move $t9, $v0
	#save at index 8 in array
	sw $t9, array($t0)
	#incremnt counter up by one
	addi $t0, $t0, 4
	#add number to sum
	add $a3,$a3, $t9
	
	#zero out t9 so i can use it again
	addi $t9, $zero, 0
	#again for number 10
	jal readInt
	#move int to a dif location
	move $t9, $v0
	#save at index 8 in array
	sw $t9, array($t0)
	#incremnt counter up by one
	addi $t0, $t0, 4
	#add number to sum
	add $a3,$a3, $t9
	
	
	#print sum ($a3)
  	##move $a0, $a3
   	#syscall
   	
   	
	
	#reset counter to 0
	#addi $t0, $zero, 0
	#load array into t1 at 0
	

printArray:
	#as long as its not 0
	beq $t0, 0, exit	
	lw $t1, array($t0)
	#increment down by 2

	
	#print array
	li $v0, 1
	move $a0, $t1
	syscall 
	
	addi $t0, $t0, -8
	
	#print new line
	li $v0, 4
	la $a0, newline
	syscall
	
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
	
	


	
	
	
	
	
	
	
	
	 
	
