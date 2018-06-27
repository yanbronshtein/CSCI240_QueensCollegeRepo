#Name:Yaniv Bronshtein
#Last Modified: 06/25/18
#Description: This program calculates the factorial of a positive integer value


#include <iostream>
#using namespace std;
#
#
#bool isValidInput(int n)
#
#{
#    if(n < 0) {
#
#       cerr<<"Invalid Input: Must be a whole number"<<endl;
#        return false;
#    }
#
#
#    return true;
#}
#int factorial(int n)
#{
#    if(n > 1)
#    {
#        return n * factorial(n-1);
#
#    }
#    return 1;
#}


#int main() {
#
#    bool valid = false;
#    int n = 0;
#    do {
#        cout << "Please enter a natural number \n" << endl;
#        cin >> n;
#        valid = isValidInput(n);
#    }while(!valid);
#
#
#    int result = factorial(n);
#
#    cout<<"The factorial("<<n<<") is:   "<<result<<endl;
#
#
#
#    return 0;
#}


	.data
	PROMPTNUM: .asciiz "Please enter a natural number. You may hit '99' to exit at any time \n"
	#ERRORMESSAGE: .asciiz "Error: Invalid Number please enter a valid natural number\n"
	RESULTMESSAGE: .asciiz "The factorial of the number entered is\n"
	GOODBYE: .asciiz "\nLa revedere Profesor Fluture\n"
	SUCCESS: .asciiz "\nIt worked. Your input is valid!"
	
	.globl main
	.text
main:

	
 

readInt:
	li $v0, 4 # prompt user
	la $a0, PROMPTNUM
	syscall
	li $v0, 5 #read value
	syscall
	
	move $t0, $v0 #Copy n into temporary register
	beq $t0,99,exit #Exit program if user hit sentinel 
	move $a0, $t0 
	 
	jal isValidInput #Check if valid input

	bne $v0,1, readInt #keep prompting user and reading int while input is invalid
	#jr $ra #return from subroutine if input is valid
	
 	move $a0,$t0 #Copy verified value of n to pass as argument to factorial
 	jal factorial
 	
	move $s1, $v0
printResult:
	li $v0,4 
 	la $a0, RESULTMESSAGE
 	syscall

 	
 	li $v0,1
 	move $a0, $s1
 	syscall 	
 	j exit
	

	
factorial:
	bne $a0,0, inductiveCase
	li $v0,1 #return 1 if n=0 or n=1
	jr $ra


inductiveCase:
	add $sp, $sp, -8 # make room for 2 registers on stack
	sw $ra, 4($sp) # save return address register $ra
	sw $a0, 0($sp) # save argument register $a0=n
	
	add $a0, $a0, -1 # $a0 = n-1
	jal factorial # $v0 = factorial(n-1)
	
	#restore stack
	lw $a0, 0($sp) # restore $a0=n
	lw $ra, 4($sp) # restore $ra

	add $sp, $sp, 8 # multipop stack	
	mul $v0, $v0, $a0 # $v0 = fac(n-1) x n
	jr $ra # return

#bool isValidInput(int n)
#
#{
#    if(n < 0) {
#
#       cerr<<"Invalid Input: Must be a whole number"<<endl;
#        return false;
#    }
#
#
#    return true;
#}
isValidInput:
	slt $t2,$a0,$zero #return invalid
#	beq $t2,1,returnInvalid
	bne $t2, 1,returnValid #if the value in $t2 is not 1, then our input is valid 
	move $v0, $zero #By default return 0 or invalid
	jr $ra
						
returnValid:	
	li $v0,1
	jr $ra

 	
exit:
  	li $v0,4 
 	la $a0, GOODBYE
 	syscall
  	li $v0, 10                                                                                                                                                               
    	syscall
    	

  	

