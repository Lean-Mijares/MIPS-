#Title: CHP3 LAB TASK 6                 
#Author: Lean Elizebette Mijares                            
#Date: October 8, 2020
#Description: Asks the user to enter a signed number and read it then display the content of multiplying this number by 24.5.
#Input: 3
#Output: 73.5

########################## Data Segment ####################################
.data

    s_num: .asciiz "\nPlease Enter a signed number: "
    content: .asciiz "\nOutput: "
    zeroasfloat: .float 0.0
    float1: .float 24.5
    
########################## Code Segment ####################################
.text
.globl main
main:

	li $v0, 4
	la $a0, s_num                       # main function entry
 	syscall
 	
 	lwc1 $f0,  zeroasfloat
 	ldc1 $f4, float1
 	
 	li $v0, 6
 	syscall
 	
 	mul.s $f12, $f0, $f4
 	
    	li $v0, 4
    	la $a0, content
    	syscall
    	
    	li $v0, 2
    	mov.s $f12, $f12
    	syscall
    	
    	li $v0, 10                           # system call to exit program
    	syscall
