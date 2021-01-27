#Title: CHP3 LAB TASK 7                    
#Author: Lean Elizebette Mijares                            
#Date: October 9, 2020
#Description: Program that asks the user to enter an unsigned number and read it and swap the bits at odd positions with those at even positions and display the resulting number.
#Input: 9
#Output: 6

########################## Data Segment ####################################

.data
    int_msg: .asciiz "Please enter an integer: "
    int_bin: .asciiz "\nOutput after swapping bit is: "
    
########################## Code Segment ####################################

.text
.globl main
 main:

    	li $v0, 4                                 # main function entry 
    	la $a0, int_msg
    	syscall

    	li $v0, 5
	syscall
	
	move $t0, $v0

	addi $t1, $zero, 0xAAAAAAAA #for even bits
	addi $t2, $zero, 0x55555555 #for odd bits

	and $s0, $t1, $t0
	and $s1, $t2, $t0

	srl $s2, $s0, 1 
	sll $s3, $s1, 1 

	or $t3, $s2, $s3 

	li $v0, 4
	la $a0, int_bin
	syscall

	move $a0, $t3
	li $v0, 1
	syscall

	li $v0 10                              # system call to exit program
	syscall

