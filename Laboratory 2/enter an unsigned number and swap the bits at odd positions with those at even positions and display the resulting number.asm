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
	#display input message
    	li $v0, 4                         
    	la $a0, int_msg
    	syscall
	
	#get input from the user
    	li $v0, 5
	syscall
	move $t0, $v0		#set the input value to $t0

	addi $t1, $zero, 0xAAAAAAAA 	#hex vlue for even bits 
	addi $t2, $zero, 0x55555555 	#hex value for odd bits

	and $s0, $t1, $t0
	and $s1, $t2, $t0

	srl $s2, $s0, 1 
	sll $s3, $s1, 1 

	or $t3, $s2, $s3 
	
	#display the output message
	li $v0, 4
	la $a0, int_bin
	syscall
	
	#display the output value
	move $a0, $t3
	li $v0, 1
	syscall

	#exit program
	li $v0 10           
	syscall

