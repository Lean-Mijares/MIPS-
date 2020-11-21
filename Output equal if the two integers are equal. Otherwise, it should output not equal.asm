#Description: Output equal if the two integers are equal. Otherwise, it should output not equal.
#Input: 5, 10
#Output: not equal

########################## Data Segment ####################################
.data
    first_int: .asciiz "Please Enter First Integer number: "
    second_int: .asciiz "Please Enter Second Integer number: "
    equal: .asciiz "\nThe two numbers are equal"
    notequal: .asciiz "\nThe two numbers are not equal"
    
########################## Code Segment ####################################
.text
.globl main
main:
	#print the input message
	la $a0, first_int                     # main function entry
 	li $v0, 4
 	syscall
 	
 	#get input from the user
 	li $v0,5
 	syscall
    	move $t0, $v0
    	
    	#print the input message
    	la $a0, second_int                     
 	li $v0, 4
 	syscall
 	
 	#get input from the user
 	li $v0,5
 	syscall
    	move $t1, $v0
	
    	bne $t0, $t1, label1		#if num1 and num2 are not equal go to label1
    	beq $t0, $t1, label2		#if num1 and num2 are equal go to label2
        
label1:
	#print the output message
	li $v0, 4
 	la $a0, notequal
    	syscall
    	
    	li $v0, 10                           # system call to exit program
    	syscall
        
label2:
	#print the output message
	li $v0, 4
 	la $a0, equal
    	syscall
    	
    	li $v0, 10                           # system call to exit program
    	syscall
