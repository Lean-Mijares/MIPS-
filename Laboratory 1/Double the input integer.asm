#Description: Ask for Integer and double that input 
#Input: 5
#Output: 10

########################## Data Segment ####################################
.data
    first_int: .asciiz "Please Enter Integer number: "
    output_msg: .asciiz "The Output is: "

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
    
    	add $t1, $t0, $t0		   #add the input integer and store in register $t1
    	
    	#print the output
    	li $v0, 1
    	move $a0, $t1
    	syscall
	
    	li $v0, 10                       # system call to exit program
    	syscall
