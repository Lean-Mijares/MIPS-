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
	#display the input message
	li $v0, 4
	la $a0, s_num                       
 	syscall
 	
 	lwc1 $f0, zeroasfloat 	#store 0.0 to $f0
 	ldc1 $f4, float1 		#store 24.5 to $f4
 	
 	#get input value from the user in float
 	li $v0, 6
 	syscall
 	
 	mul.s $f12, $f0, $f4 	#$f0 * $f4 and store to $f12	
 	
 	#display the output message
    	li $v0, 4
    	la $a0, content
    	syscall
    	
    	#display the output value in float
    	li $v0, 2
    	mov.s $f12, $f12
    	syscall
    	
    	#exit program
    	li $v0, 10                         
    	syscall
