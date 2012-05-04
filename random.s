.data
seeding_random_number_generator_prompt: .asciiz "Seeding the random number generator:\n"
enter_a_number_prompt: .asciiz "Please enter a number:\n"
.text
.globl main
#xorshift random number generator
#see Marsaglia, George (July 2003). "Xorshift RNGs". Journal of Statistical Software Vol. 8 (Issue  14), or the wikipedia page for xorshift
#puts a semirandom unsigned int into t8
get_random_uint_in_t8:
lw $t0, 0($s7)
addi $t0, $t0, 12
#t is $t8
#t0+0 = z
#t0+4 = y
#t0+8 = x
#t0+12 = w

#t = t8
#temp1 = t7
#temp2 = t8
lw   $t7, 8($t0)
sll  $t8, $t7, 11  #t = x<<11
xor  $t8, $t7, $t8 #t = t^x
lw 	 $t7, 4($t0)#x = y
sw   $t7, 8($t0)
lw   $t7, 0($t0)   #y = z
sw   $t7, 4($t0)
lw   $t7, 12($t0)#z = w
sw   $t7, 0($t0)
srl  $t7, $t8, 8   #t>>8
xor  $t8, $t8, $t7 #t=^(t>>8)
lw   $t6, 12($t0)
srl  $t6, $t6, 19  #w>>19
xor  $t7, $t6, $t7 #t=t^(w>>19)
lw   $t6, 12($t0)
xor  $t7, $t6, $t7 #t=t^w
sw   $t7, 12($t0)
addi $t8, $t7, 0
j $ra

#xorshift's seed
xorshift_seed_function:
addi $a0, $zero, 16 #sizeof(uint)*4
li $v0, 9
syscall

addi $s7, $v0, 0 #record the locations of w,x,y,z

la $a0, seeding_random_number_generator_prompt
li $v0, 4
syscall

#for i = 4; i>0; i--
addi $t0, $zero, 4

xorshift_seed_loop:

#read a number
la $a0, enter_a_number_prompt
li $v0, 4
syscall
li $v0, 5

addi $t8, $zero, 4
mult $t8, $t0
mflo $t8

add $t8, $s7, $t8

#store
sw $v0, 0($t8)

#i--
addi $t0, $t0, -1


#branch if less than 0
blez $t0, xorshift_seed_loop
j $ra

main:
jal xorshift_seed_function
li $v0, 10
syscall
