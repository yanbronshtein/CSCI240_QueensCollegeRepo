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


#checkInput1(int input2){
#	if(input1 < -20)
#		return 0
#	if(input > 5)
#		return 0
#	return 1	
#}
#checkInput2(int input2){
#	if(input < 0)
#		return 1;
#	return 0;	

#}

#void displayResult(int result)
#{
#	printf(""The result of the computation 8*int1 + int2 - 26 is \n %d",result);

#}
# int main()
#{
#	int int1 = 0,int2 = 0,result = 0;
#	do{
#		
#		printf("Please enter an integer in the range [-20,5]. Type the number 99 to quit\n");
#		scanf("%d",&int1);
#	}while(!checkInput1(input1) 
#
#
#	do{
#		printf("Please enter a second integer that is less than 0. Type the number 99 to quit\n");
#		scanf("%d",&int1);	
#	}while(!checkInput2(input2) 
#
#	result = (8*int1 + int2 - 26);
#	
#	display(result);
	
#	return 0;
#}

#
#Registers:
#	$t0 for int1
#	$t1 for int2
#	$t2 for result	  	 
 		
################################################### 	
 	.data
 		PROMPT1: .asciiz "Please enter an integer in the range [-20,5]. Type the number 99 to quit\n"
 		PROMPT2: .asciiz "Please enter a second integer that is less than 0. Type the number 99 to quit\n"
 		RESULT: .asciiz "The result of the computation is\n"
 		RESULT_PROMPT: .asciiz "The result of the computation 8*int1 + int2 - 26 is :\n"
 		int1: .word 0
 		int2: .word 0
 		result: .word 0

 	
 	
 	.text
 	.globl main
 	



main:
 	
	
 
 
#Obtain valid integer 1 in the range [-inf,0)
 while1:
 	li $v0,4 #Prompt the user to enter a second integer that is less than 0
 	la $a0, PROMPT1
 	syscall
 	
 	
 	li $v0,5 # system call code for reading an integer from console
 	syscall
 	move $t0, $v0 #Save the integer in register t1
 	
 	#push registers 
 	#call input validation function
 	
 	jal checkFirstInt
 	
 	bne $v0,1, while1 #continue to top of while loop if invalid input 
 	
 

 	 
 #Obtain valid integer in the range [-inf,0)
 while2:
 	li $v0,4 #Prompt the user to enter a second integer that is less than 0
 	la $a0, PROMPT2
 	syscall
 	
 	
 	li $v0,5 # system call code for reading an integer from console
 	syscall
 	move $t1, $v0 #Save the integer in register t1
 	
 	#call input validation function
 	jal checkSecondInt
 	
 	bne $v0,1, while2 #continue to top of while loop if invalid input
 	
	
	sw $t0, int1 #store int1 in memory
	sw $t1, int2 #store int2 int memory
#	result = (8*int1 + int2 - 26)	
	sll $t2, $t0,3 #int1*8
	add $t2,$t2, $t1 #int1*8 + int2
	addi $t2,$t2, -26 #int1 * 8 + int2 -26
	
	
	sw $t2, result #store result in memory
	#display the result
	
	
displayResult:
 	li $v0,4 #system call code for Print String
 	la $a0, RESULT_PROMPT
 	syscall
 	
 	li $v0,1
	move $a0, $t2
 	syscall
 	
 	
 	#End Program
 	li $v0, 10                                                                                                                                                               
    	syscall

 
 

 	
 	

 	
 
 
 #Input Validation for first int
 	
 checkFirstInt:
 	#check lower bound
 	
 	
 	slti $t2,$t0,-20
 	beq $t2,1,returnInvalid1
 	
 	#check upper bound
 	li $t3, 5
 	sub $t3,$t3,$t0
 	bltz $t3, returnInvalid1
 	

 	#default returns valid
 	li $v0, 1
 	jr $ra
 	
 returnInvalid1:
 	move $v0, $zero
 	jr $ra	
 	
 
#Input Validation for second int
 checkSecondInt:
 	#check upper bound
 	slti $t2,$t1,0
 	bne $t2,1,returnInvalid2 
 	li $v0,1
 	jr $ra
 
returnInvalid2:
 	move $v0, $zero
 	jr $ra	
	 	
 
 

 	
 	
 	
 	
 	
 	
