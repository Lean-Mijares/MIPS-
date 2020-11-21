#Title: CHP 2 LAB TASK 4           
#Author: Lean Elizebette Mijares                            
#Date: October 7, 2020
#Description: Executes statement: s = (a + b) – (c + 101), where a, b, and c are user provided integer, and s is computed and printed as an output. 
#Input: 5, 10, -30
#Output: -56

########################## Data Segment ####################################
.data
    a_int: .asciiz "Please Enter for A: "
    b_int: .asciiz "Please Enter for B: "
    c_int: .asciiz "Please Enter for C: "
    s_int: .asciiz "\nThe S is: "
    
########################## Code Segment ####################################
.text
.globl main
main:
	#print the input message
	li $v0, 4
	la $a0, a_int                       # main function entry
 	syscall
 	
 	#get input for A
 	li $v0,5
 	syscall
    	move $s0, $v0
    	
    	#print the input message
    	la $a0, b_int                     
 	li $v0, 4
 	syscall
 	
 	#get input for B
 	li $v0,5
 	syscall
    	move $s1, $v0
    	
    	#print the input message
    	la $a0, c_int                     
 	li $v0, 4
 	syscall
 	
 	#get input for C
 	li $v0,5
 	syscall
    	move $s2, $v0

	add $t0, $s0, $s1			#add A and B and store to $t0
	add $t1, $s2, 101			#add C and int 101 and store to $t1
	sub $t2, $t0, $t1   		#subtract $t0 and $t1 and store to $t2
	
	#print the output message                                  
 	li $v0, 4
 	la $a0, s_int  
 	syscall
 	
 	#print the S
	li $v0, 1
	move $a0, $t2
	syscall 	 
    	
    	li $v0, 10                           # system call to exit program
    	syscall
