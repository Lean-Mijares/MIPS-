#Description: asks the user to enter an integer number then enter a bit position (between 0 and 31) and display the value of that bit.
#Input: Integer: 5,  Bit Position: 0
#Output: 1

########################## Data Segment #############################
.data
   	int: .asciiz "Enter an integer: "
   	bit_position: .asciiz "\nEnter a bit position (between 0 and 31): "
   	bit_value: .asciiz "\nValue of the bit is: "
   
 ########################## Text Segment #############################
.text	
  	#display input message
   	la $a0, int
   	li $v0, 4
   	syscall

	#get integer input from the user
   	li $v0, 5
   	syscall
   	addi $s0, $v0, 0
	
	#display input message
   	la $a0, bit_position
   	li $v0, 4
   	syscall
 
 	#get bit position input from the user
   	li $v0, 5
   	syscall
   	
   	addi $s1, $v0, 0
   	li $t0, 0
   	
while: 
	bge $t0, $s1, end 
      	srl $s0, $s0, 1
      	addi $t0, $t0, 1
      	
      	j while

end:
   	la $a0, bit_value
   	li $v0, 4
   	syscall

   	and $a0, $s0, 1
   	li $v0, 1
   	syscall
   	
   	li $v0, 10	
   	syscall
