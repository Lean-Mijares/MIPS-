#Description: prints "Hello ", followed by the name entered by the user.
#Input: Lorem
#Output: Hello, Lorem

########################## Data Segment ####################################
.data
    name_str: .asciiz "Enter your name: "
    name: .space 50
    output_msg: .asciiz "Hello, "

########################## Code Segment ####################################
.text
.globl main
main:
	#print the input message
	li $v0, 4                     
	la $a0, name_str
 	syscall
 	
 	#get input from the user
 	li $v0,8			#system call for reading string
 	la $a0, name
 	li $a1, 50		#number of characters to read
 	syscall
	
	#print the output message
 	li $v0, 4
 	la $a0, output_msg
    	syscall
	
	#print the output
	li $v0, 4
	la $a0, name
	syscall
	
    	li $v0, 10                      # system call to exit program
    	syscall
