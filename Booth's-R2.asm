#CPTR380 - Computer Architecture
#Daniel Mendoza
#Winter 2026
#Boot's Multiplication Radix-2 Algorith
#----------------------------------------

.data
multiplicant_prompt: .asciiz "\nEnter multiplicant in decimal: (-128 to 128)"
multiplier_prompt: .asciiz "\nEnter multiplier in decimal: (-128 to 128)"
product: .asciiz "\nproduct: "
counter: .asciiz "\ncounter: "
line: .asciiz "\n--------------------------------"

# Register Content:
# $s0 = counter
# $s1 = m multiplicant
# $s2 = -m 
# $s3 = r multiplier or product
# $s4 = index or r-1

.text 
main:
    #prompt for multiplicant
    la $a0, multiplicant_prompt
    li $v0, 4
    syscall

    #read input
    li $v0, 5
    syscall
    move $s1, $v0           # save m in s1
    
    #shift m and -m 8 bits
    sll $s1, $s1, 24
    sra $s1, $s1, 16
    neg $s2, $s1            # save -m in s2         
    # now both are xxxx xxxx 0000 0000 
    # since most significant 4 bytes are signed bits, it does not need to be masked   
    
    #prompt for multiplier
    la $a0, multiplier_prompt 
    li $v0, 4
    syscall

    #read input
    li $v0, 5
    syscall
    move $s3, $v0           #save r in $s3
    andi $s3, $s3, 0x00FF   # making any digit to the left of r (8 bits) 0

    # $s0 is counter and $s
    add $s0, $zero, $zero   #set counter to 0
    add $s4, $zero, $zero   #set r-1 to 0

loop:
    andi $t0, $s3, 1 
    beq $t0, $zero, case_0X
    j case_1X
    
case_0X:
    # do nothing if 00
    andi $t0, $s4, 1 
    beq $t0, $zero, shift
       
    # add m $s1 if 01
    add $s3, $s3, $s1
    j shift

case_1X:
    # do nothing if 11
    andi $t0, $s4, 1 
    bne $t0, $zero, shift

    # add -m $s2 if 10
    add $s3, $s3, $s2
    j shift
    
shift:
    andi $t0, $s3, 1
    move $s4, $t0           # move lsb of r into index
    sra $s3, $s3, 1         # arithmetic shift r to the right by 1 to perserve sign

    # Print product and counter
    addi $s0, $s0, 1        # increment
    la $a0, line
    li $v0, 4
    syscall                 # Print line
    la $a0, counter
    li $v0, 4
    syscall                 # Print "counter: " 
    move $a0, $s0
    li $v0, 1
    syscall                 # Print counter address
    la $a0, product
    li $v0, 4
    syscall                 # Print "product: " 
    move $a0, $s3
    li $v0, 1
    syscall                 # Print product address

    slti $t0, $s0, 8        # $t0 will be 0 if counter => 8
    bne $t0, $zero, loop    # exit on 8th run
exit:
    li $v0, 10

    syscall
