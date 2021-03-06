.data
hanoi_print_state_msg: .asciiz "the current game state is:\n"
hanoi_done_msg: .asciiz "done\n"
hanoi_newline: .asciiz "\n"
hanoi_space: .asciiz " "
hanoi_bar: .asciiz "|"
hanoi_disk: .asciiz "_"
hanoi_first_column_prompt: .asciiz "Which column would you like to pick up a disk from\n1.Left\n2.Middle\n3.Right\n4.Quit\n"
hanoi_second_column_prompt: .asciiz "Which column would you like to put the disk onto\n1.Left\n2.Middle\n3.Right\n4.Quit\n"
hanoi_error_msg: .asciiz "An error occured in Towers of Hanoi game, quitting.\n"
hanoi_success_msg:.asciiz "Congradulations, you win!\n"
hanoi_rule_violation_msg: .asciiz "\nThat is an invalid move, try again\n\n"
.text
.globl main
#towers of hanoi game
#overwrites most of the t memory
towers_of_hanoi:

#set initial position of the rings
#  _|_     |      |
# __|__    |      |
#___|___   |      |

#t9 = return pointer
addi $t9, $ra, 0
jal hanoi_set_init_state #initialize hanoi game
#t0 will be 0 if still going, 1 if failure and 2 if success
try_hanoi:
jal hanoi_show
jal hanoi_iteration  #let the user make a move
#jal hanoi_print_state
addi $t4, $zero, 0
beq $t0, $t4, try_hanoi
addi $ra, $t9, 0
j $ra

hanoi_print_newline:
la $a0, hanoi_newline
li $v0, 4
syscall
j $ra

hanoi_print_space:
la $a0, hanoi_space
li $v0, 4
syscall
j $ra

hanoi_print_bar:
la $a0, hanoi_bar
li $v0, 4
syscall
j $ra

hanoi_print_disk:
la $a0, hanoi_disk
li $v0, 4
syscall
j $ra

hanoi_test_and_print:
addi $s6, $ra, 0
#if $t5 = 1, then top bar
addi $t4, $zero, 1
bne $t5, $t4, hanoi_test_mid

addi $t4, $zero, 1
bne $t4,$t6, hanoi_test_top_center
#if $t6 = 1 then left
andi $t4, $t1, 4
beq $t4, $zero, hanoi_test_empty
j hanoi_test_confirm

hanoi_test_top_center:
#if $t6 = 2 then center
addi $t4, $zero, 2
bne $t4,$t6 hanoi_test_top_right
andi $t4, $t2, 4
beq $t4, $zero, hanoi_test_empty
j hanoi_test_confirm

hanoi_test_top_right:
#else if $t6 = 3 then right
addi $t4, $zero, 3
bne $t4,$t6 hanoi_test_empty
andi $t4, $t3, 4
beq $t4, $zero, hanoi_test_empty
j hanoi_test_confirm

hanoi_test_mid:
#if $t5 = 2, then mid bar
addi $t4, $zero, 2
bne $t5, $t4, hanoi_test_bot

addi $t4, $zero, 1
bne $t4,$t6, hanoi_test_mid_center
#if $t6 = 1 then left
andi $t4, $t1, 2
beq $t4, $zero, hanoi_test_empty
j hanoi_test_confirm

hanoi_test_mid_center:
#if $t6 = 2 then center
addi $t4, $zero, 2
bne $t4,$t6 hanoi_test_mid_right
andi $t4, $t2, 2
beq $t4, $zero, hanoi_test_empty
j hanoi_test_confirm

hanoi_test_mid_right:
#else if $t6 = 3 then right
addi $t4, $zero, 3
bne $t4,$t6 hanoi_test_empty
andi $t4, $t3, 2
beq $t4, $zero, hanoi_test_empty
j hanoi_test_confirm

hanoi_test_bot:
#if $t5 = 3, then bottom bar
addi $t4, $zero, 3
bne $t5, $t4, hanoi_test_mid

addi $t4, $zero, 1
bne $t4,$t6, hanoi_test_bot_center
#if $t6 = 1 then left
andi $t4, $t1, 1
beq $t4, $zero, hanoi_test_empty
j hanoi_test_confirm

hanoi_test_bot_center:
#if $t6 = 2 then center
addi $t4, $zero, 2
bne $t4,$t6 hanoi_test_bot_right
andi $t4, $t2, 1
beq $t4, $zero, hanoi_test_empty
j hanoi_test_confirm

hanoi_test_bot_right:
#else if $t6 = 3 then right
addi $t4, $zero, 3
bne $t4,$t6 hanoi_test_empty
andi $t4, $t3, 1
beq $t4, $zero, hanoi_test_empty
j hanoi_test_confirm

hanoi_test_empty:
jal hanoi_print_space
j hanoi_done_test_and_print

hanoi_test_confirm:
jal hanoi_print_disk
j hanoi_done_test_and_print

hanoi_done_test_and_print:
addi $ra, $s6, 0
j $ra

hanoi_show:
addi $t8, $ra, 0
addi $t5, $zero, 1
addi $t6, $zero, 1
jal hanoi_print_top_bar
addi $t6, $zero, 2
jal hanoi_print_top_bar
addi $t6, $zero, 3
jal hanoi_print_top_bar
jal hanoi_print_newline
addi $t5, $zero, 2
addi $t6, $zero, 1
jal hanoi_print_mid_bar
addi $t6, $zero, 2
jal hanoi_print_mid_bar
addi $t6, $zero, 3
jal hanoi_print_mid_bar
jal hanoi_print_newline
addi $t5, $zero, 3
addi $t6, $zero, 1
jal hanoi_print_bot_bar
addi $t6, $zero, 2
jal hanoi_print_bot_bar
addi $t6, $zero, 3
jal hanoi_print_bot_bar
jal hanoi_print_newline
addi $ra, $t8, 0
j $ra

hanoi_print_top_bar:
addi $t7, $ra, 0
jal hanoi_print_space
jal hanoi_print_space
jal hanoi_test_and_print
jal hanoi_print_bar
jal hanoi_test_and_print
jal hanoi_print_space
jal hanoi_print_space
addi $ra, $t7, 0
j $ra

hanoi_print_mid_bar:
addi $t7, $ra, 0
jal hanoi_print_space
jal hanoi_test_and_print
jal hanoi_test_and_print
jal hanoi_print_bar
jal hanoi_test_and_print
jal hanoi_test_and_print
jal hanoi_print_space
addi $ra, $t7, 0
j $ra

hanoi_print_bot_bar:
addi $t7, $ra, 0
jal hanoi_test_and_print
jal hanoi_test_and_print
jal hanoi_test_and_print
jal hanoi_print_bar
jal hanoi_test_and_print
jal hanoi_test_and_print
jal hanoi_test_and_print
addi $ra, $t7, 0
j $ra

hanoi_set_init_state:
addi $t1, $zero, 7
addi $t2, $zero, 0
addi $t3, $zero, 0
j $ra

hanoi_print_state:
la $a0, hanoi_print_state_msg
li $v0, 4
syscall

addi $a0, $t1, 0
li $v0, 1
syscall

addi $a0, $t2, 0
li $v0, 1
syscall

addi $a0, $t3, 0
li $v0, 1
syscall

la $a0, hanoi_newline
li $v0, 4
syscall
j $ra

hanoi_iteration:
##################################

addi $t8, $ra, 0
la $a0, hanoi_first_column_prompt
li $v0, 4
syscall

li $v0, 5
syscall

addi $t5, $v0, 0
addi $t4, $zero, 4
beq $t4, $t5, hanoi_iteration_quit
addi $t4, $zero, 3
bne $t4, $t5, hanoi_iteration_try_2
addi $s5, $t3, 0
j hanoi_iteration_test_bar1

hanoi_iteration_try_2: 
addi $t4, $zero, 2
bne $t4, $t5, hanoi_iteration_try_3
addi $s5, $t2, 0
j hanoi_iteration_test_bar1

hanoi_iteration_try_3: 
addi $t4, $zero, 1
bne $t4, $t5, hanoi_iteration_error
addi $s5, $t1, 0
j hanoi_iteration_test_bar1

hanoi_iteration_test_bar1:
addi $t4, $zero, 0
beq $t4, $s5, hanoi_rule_violation

#################################
la $a0, hanoi_second_column_prompt
li $v0, 4
syscall

li $v0, 5
syscall

addi $t6, $v0, 0
addi $t4, $zero, 4
beq $t4, $t6, hanoi_iteration_quit
addi $t4, $zero, 3
bne $t6, $t4, hanoi_iteration_try_2_2
addi $s6, $t3, 0
j hanoi_iteration_test_bar2

hanoi_iteration_try_2_2: 
addi $t4, $zero, 2
bne $t6, $t4, hanoi_iteration_try_3_2
addi $s6, $t2, 0
j hanoi_iteration_test_bar2

hanoi_iteration_try_3_2: 
addi $t4, $zero, 1
bne $t6, $t4, hanoi_iteration_error
addi $s6, $t1, 0
j hanoi_iteration_test_bar2

hanoi_iteration_test_bar2:
#addi $t4, $zero, 0
#beq $t4, $s6, hanoi_rule_violation

sub $t4, $s5, $s6
blez $t4, hanoi_rule_violation

andi $t4, $s5, 4
bgtz $t4, hanoi_bit_found
andi $t4, $s5, 2
bgtz $t4, hanoi_bit_found
andi $t4, $s5, 1
bgtz $t4, hanoi_bit_found
j hanoi_iteration_error

hanoi_bit_found:
xor $s5, $s5, $t4
or $s6, $s6, $t4

addi $t4, $zero, 3
bne $t4, $t6, hanoi_try_apply_d2
addi $t3, $s6, 0
j hanoi_assigned_move

hanoi_try_apply_d2:
addi $t4, $zero, 2
bne $t4, $t6, hanoi_try_apply_d1
addi $t2, $s6, 0
j hanoi_assigned_move

hanoi_try_apply_d1:
addi $t4, $zero, 1
bne $t4, $t6, hanoi_iteration_error
addi $t1, $s6, 0
j hanoi_assigned_move

hanoi_assigned_move:
addi $t4, $zero, 3
bne $t4, $t5, hanoi_try_unapply_d2
addi $t3, $s5, 0
j hanoi_unassigned_move

hanoi_try_unapply_d2:
addi $t4, $zero, 2
bne $t4, $t5, hanoi_try_unapply_d1
addi $t2, $s5, 0
j hanoi_unassigned_move

hanoi_try_unapply_d1:
addi $t4, $zero, 1
bne $t4, $t5, hanoi_iteration_error
addi $t1, $s5, 0
j hanoi_unassigned_move

hanoi_unassigned_move:
addi $t4, $zero, 0
bne $t1, $t4, hanoi_next_iteration
bne $t2, $t4, hanoi_next_iteration
addi $t4, $zero, 7
bne $t3, $t4, hanoi_next_iteration
j hanoi_success

###################################


hanoi_iteration_error:
la $a0, hanoi_error_msg
li $v0, 4
syscall
addi $t0, $zero, 0
j hanoi_iteration_quit

hanoi_success:
la $a0, hanoi_success_msg
li $v0, 4
syscall
addi $t0, $zero, 2
addi $ra, $t8, 0
j $ra

hanoi_iteration_quit:
addi $t0, $zero, 1
addi $ra, $t8, 0
j $ra

hanoi_rule_violation:
la $a0, hanoi_rule_violation_msg
li $v0, 4
syscall
addi $t0, $zero, 0
addi $ra, $t8, 0
j $ra

hanoi_next_iteration:
addi $t0, $zero, 0
addi $ra, $t8, 0
j $ra

main:
jal towers_of_hanoi
jal hanoi_show
la $a0, hanoi_done_msg
li $v0, 4
syscall
li $v0, 10
syscall
