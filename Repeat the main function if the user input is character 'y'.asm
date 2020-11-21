#Description: Repeat the main function if the user input is character 'y'
#Input: 5
#Output: 10 Repeat [y/n]

########################## Data Segment ####################################
.data
    first_int: .asciiz "\nPlease Enter Integer number: "
    output_msg: .asciiz "The Output is: "
    repeat_msg: .asciiz "\nRepeat [y/n]? "
    ans: .space 50
########################## Code Segment ####################################
.text
.globl main
main:
	#print the input message
	la $a0, first_int                   
 	li $v0, 4
 	syscall
 	
 	#get input from the user
 	li $v0,5
 	syscall
    	move $t0, $v0
	
	#print the output message
 	li $v0, 4
 	la $a0, output_msg
    	syscall
    
    	add $t1, $t0, $t0			 #add the input integer and store in register $t1
    	
    	#print the output
    	li $v0, 1
    	move $a0, $t1
    	syscall
    	
	jal mainf				#jump to mainf
	
mainf:
	#print the repeat message
	li $v0, 4
	la $a0, repeat_msg
    	syscall
    
	la $a0, ans
 	li $a1, 3
 	li $v0, 8
 	syscall 
	
	lb $t2, 0($a0)
	
	#if user input y and 'Y' go to main
    	beq $t2 , 'y', main
    	beq $t2 , 'Y', main
    	
    	li $v0, 10                           # system call to exit program
    	syscall
