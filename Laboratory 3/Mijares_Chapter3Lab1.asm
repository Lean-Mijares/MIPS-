#Title: Display expression of computing expression A + 2B - 5.                  
#Author: Lean Elizebette Mijares                            
#Date: October 7, 2020
#Description: ask the user to enter two integers A and B and then display the result of computing the expression: A + 2B - 5.
#Input: 8, 10
#Output: 23

########################## Data Segment ####################################
.data
    a_int: .asciiz "\nPlease Enter First Integer number: \n"
    b_int: .asciiz "\nPlease Enter Second Integer number: \n"
    r_msg: .asciiz "\nResult: "
    
########################## Code Segment ####################################
.text
.globl main
main:

	li $v0, 4
	la $a0, a_int                       # main function entry
 	syscall
 	
 	li $v0,5
 	syscall
    	move $t0, $v0
    	
    	la $a0, b_int                     
 	li $v0, 4
 	syscall
 	
 	li $v0,5
 	syscall
    	move $t1, $v0
	    	        	
	mul $s0, $t1, 2
	add $s1, $t0, $s0
	sub $s2, $s1, 5
	
	la $a0, r_msg                     
 	li $v0, 4
 	syscall
	
	li $v0, 1
	move $a0, $s2
	syscall
	    	 	
    	li $v0, 10                           # system call to exit program
    	syscall