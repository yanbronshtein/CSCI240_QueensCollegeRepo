#Yaniv Bronshtein
#Last Modified: 06/26/18
#Program Name: bronshtein_hw2.s

#Write a MIPS assembly language program that accomplishes the following:
#The program will prompt the user to enter an integer n between 0 and 10.
#If n is out of range, the program displays an error message and prompts again else
#compute Func(n): if (n = 0 or n=1) return 5
#else return 7*Func(n-2) Ð 8*n;
#repeat

#include <cstdio>
#using namespace std;


#include <iostream>
#using namespace std;
#
#
#bool isValidInt(int n)
#{
#	if(n < 0) {
#        cout << "Error: please enter a value in the proper range\n" << endl;
#
#        return false;
#    }
#
#	if(n > 10) {
#        cout << "Error: please enter a value in the proper range\n" << endl;
#        return false;
#    }
#
#	return true;
#}



#int func(int n)
#{
#	int returnVal1;
#   if(n > 1){
#
#        returnVal1 = 7 * func(n-2) - 8 * n;
#        return returnVal1;
#    }
#	return 5;
#}
#
#int main() {
#    int n = -1, result = 0;
#    bool valid = false;
#
#    do {
#        cout << "Please an integer in the range [0,10]\n" << endl;
#        cin >> n;
#        valid = isValidInt(n);
#    } while (!valid);
#
#
#   result = func(n);
#	cout<<"The result of func(n) is:"<<result<<endl;
#
#    return 0;
#}



#############Register use  ###############

#$s0: SENTINEL

#$s1: LOWER_BOUND
#$s2: UPPER_BOUND
#$s3: RESULT
#$s4: 1 
#$s6: 7 
#$t0: Usually holds the value of n
#$t4: In the final case this register will hold 7*func(n-2) 
#$t1: Will be used once to hold the result of the subtraction of UPPER_BOUND-n
#$t5: Will be used to hold the value 8*n
#$t7: Will hold the final result of the computation once it is time to print



.data
	PROMPTNUM: .asciiz "Please enter an integer in the range [0,10]. Type '99' to terminate the program \n"
	SUCCESS_MSG: .asciiz "The integer is valid! Good job! \n"
	ERROR_MSG: .asciiz "Error: please enter a value in the proper range\n"
	RESULT_MSG: .asciiz "The result of the computation func(n-2) - 8*n is:\n"
	GOODBYE_INFORMAL: .asciiz "pa Profesor Fluture \n"
	SENTINEL: .word 99
	LOWER_BOUND: .word 0
	UPPER_BOUND: .word 10
	NEWLINE: .asciiz "\n"
	

.globl main	
.text


#$t0: holds the value of n
main:
	lw $s0, SENTINEL

	lw $s1, LOWER_BOUND
	lw $s2, UPPER_BOUND
	lw $s3, RESULT
	li $s4, 1 
	li $s6, 7 

	

readInt:
	li $v0, 4  #Prompt the user for an integer
	la $a0, PROMPTNUM
	syscall 
	
	li $v0,5
	syscall
	beq $v0,$s0, exit #End program if user hit the sentinel value of 99 on the keyboard
	
	move $t0,$v0 #Save the integer read in from the user into $t0 
	move $a0, $t0  #Save the integer as argument to isValidInt()
	jal isValidInt
	
	beqz $v0,readInt #Keep prompting user to enter input while input is invalid
	
	

	#after breaking out of loop	
	move $a0, $t0
	
	jal func #function call func(n)
	
	move $a0, $v0
	jal printResult

	j exit

	
	 
	

isValidInt:

	bltz $a0, INVALID
	sub $t1, $s2, $a0 #Check if n> UPPER_BOUND meaning that UPPER_BOUND-n <0 $t1 holds the value of that subtraction
	bltz $t1,INVALID #If the contents of $t1 is negative, the result is out of range
	j VALID #Default is valid
	
	
VALID:
	li $v0,4
	la $a0,SUCCESS_MSG #Display the success message
	syscall
	li $v0,1 #return 1 if valid
	jr $ra
INVALID:
	li $v0,4
	la $a0,ERROR_MSG #display the error message
	syscall
	move $v0,$zero #return 0 if invalid
	jr $ra
	
		  
	
	
	
	

func:

	beq $a0, $zero,baseCase #Check if n==0
	beq $a0,$s4,baseCase	#check if n==1
	j inductiveCase


baseCase:
	li $v0,5 #return 5 by default
	jr $ra
	
inductiveCase:

	
	#save n followed by the return address onto the stack
	addi $sp, $sp, -8 #Allocate space on the stack
	sw $ra, 4($sp) #Preserve the return address onto the stack
	sw $a0, 0($sp) #Push n onto the stack
	
	addi $a0, $a0, -2 # Compute argument for the next call n = n-2
	jal func #jump and link to func (recursive)
	
	#restore stack 
	lw $ra,4($sp) #load the return address
	lw $a0,0($sp)  #Pop $a0	
	addi $sp, $sp, 8 #change the stack pointer	
	
	move $t4, $v0 #t4 has the result of func(n-2)

	
	mult $t4,$s6 #lo = 7*func(n-2) 
	mflo $t4 #Move lower 32 bits of multiplication into $t4
	
	
	sll $t5,$a0,3 #compute 8 *n
	
	sub $v0, $t4, $t5 #Return 7*func(n-2)- 8*n

	
	jr $ra
	
	

printResult:
	move $t7, $a0 #Preserve the value of n
	li $v0, 4
	la $a0, RESULT_MSG
	syscall
	
	#Print result value
	li $v0,1 
	move $a0, $t7
	syscall
	
	#print newline
	li $v0, 4
	la $a0, NEWLINE
	syscall
	jr $ra  




exit:
	li $v0, 4
	la $a0, GOODBYE_INFORMAL
	syscall
	li $v0,10
	syscall
	
	
	

	
	
	
	
	

	
