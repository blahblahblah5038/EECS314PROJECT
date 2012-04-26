#xorshift random number generator
#see Marsaglia, George (July 2003). "Xorshift RNGs". Journal of Statistical Software Vol. 8 (Issue  14), or the wikipedia page for xorshift
#puts a semirandom unsigned int into t8
get_random_uint_in_t8:
lw $t0, 0($s8)

#t is $t8
lw $t1, 12($t0) #w
lw $t2, 8($t0)  #x 
lw $t3, 4($t0)  #y
lw $t4, 0($t0)  #z

sll  $t8, $t2, 11  #t = x<<11
xor  $t8, $t8, $t2 #t = t^x
addi $t2, $t3, 0   #x = y
addi $t3, $t4, 0   #y = z
addi $t4, $t1, 0   #z = w
srl  $t5, $t8, 8   #t>>8
xor  $t8, $t8, $t5 #t=^(t>>8)
srl  $t5, $t1, 19  #w>>19
xor  $t8, $t8, $t5 #t=t^(w>>19)
xor  $t8, $t8, $t1 #t=t^w
j $ra

#xorshift's seed
xorshift_seed_function:
addi $a0, $zero, 16 #sizeof(uint)*4
li $v0, 9
syscall

sw $v0, 0($s8) #record the locations of w,x,y,z

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

#i--
addi $t0, $zero, -1

#store
sw $v0, 0($t0)

#branch if less than 0
bltz $t0, xorshift_seed_loop
j $ra


