#EECS 314 Final Project
#Cale Harter
#Wesley Gould
#Elizabeth McNany
#Devon McCullough

# appropriating option 9 to load game and 8 to save it

.data

hanoi_print_state_msg: .asciiz "The puzzle looks like the following:\n"
hanoi_done_msg: .asciiz "done\n"
hanoi_newline: .asciiz "\n"
hanoi_space: .asciiz " "
hanoi_bar: .asciiz "|"
hanoi_disk: .asciiz "_"
hanoi_first_column_prompt: .asciiz "A voice in your head asks, 'Which column would you like to pick up a disk from?'\n1.Left\n2.Middle\n3.Right\n4.Quit\n"
hanoi_second_column_prompt: .asciiz "The voice then asks, 'Which column would you like to put the disk onto?'\n1.Left\n2.Middle\n3.Right\n4.Quit\n"
hanoi_error_msg: .asciiz "The strange voice says, 'An error occured in Towers of Hanoi game, executing test subject.', and then you die painlessly.\n"
hanoi_success_msg:.asciiz "You finish the game only to see the pieces reset themselves exactly as they were before.\n"
hanoi_rule_violation_msg: .asciiz "\nThe voice in your head says, 'That is an invalid move, try again.'\n\n"

seeding_random_number_generator_prompt: .asciiz "Seeding the random number generator:\n"
enter_a_number_prompt: .asciiz "Please enter a number:\n"

promptN:
	.asciiz "Please enter N:\n"

newline:
	.asciiz "\n"
	
promptEntrance:
		.asciiz "The last thing you remember, you were standing on the street and looking at the abandoned mansion on top of the hill.\n Then there was a blinding flash, and you now find yourself standing in the most spacious entry way you have ever seen.\n A six foot tall crystal chandelier hangs from the ceiling, and several sculptures stand atop pedestals around the room.\n Two grand staircases, each about six feet wide, wind their way up to the second floor.\n You see doors to your left and right, as well as one directly ahead of you between the two staircases.\n The double doors leading into the house loom behind you, and as you start towards them, you hear a lock snap shut.\n You hear a horrible wailing coming from the balcony above.\n Sitting on a table adjacent to you is a child's Towers of Hanoi puzzle\n" 
promptEntranceChoice1:
		.asciiz "To enter the parlor, type 1.\n"
promptEntranceChoice2:
		.asciiz "To enter the Dining Room, type 2.\n"
promptEntranceChoice3:
		.asciiz "To go upstairs, type 3.\n"
promptEntranceHanoi:
		.asciiz "To play with the Towers of Hanoi set, press 4.\n"
promptPlayHanoi:
		.asciiz "You are quite a strange person to be playing with logic puzzles at a time like this.\n"
promptDining:
		.asciiz "\nAs you enter the dining room, you are taken aback by what you see.\n Although this house is supposedly abandoned, there is a veritable feast laid before you on the massive table in the center of the room.\n Dozens of dishes are present, and each one looks more delicious than the last.\n In the center of the table is a massive turkey.\n While all of the places look as if they have just been set, a single chair has been pulled away from the table, as if it were expecting someone to sit down at any moment...\n"
promptDiningChoice1:
		.asciiz "To sit down at the chair, enter 1.\n"
promptDiningChoice2:
		.asciiz "To eat some of the food, type 2.\n"
promptDiningChoice3:
		.asciiz "To return to the entrance hall, type 3.\n"
promptChairDeath:
		.asciiz "\nYou approach the table and sit in the offered chair.\n As you do, figures appear in the other chairs.\n It seems you are the guest of honor at this dinner, and they have been waiting for your arrival.\n As you reach over and accept an offered glass of wine, you exchange niceties with the assembled guests.\n You make a joke, and they erupt into raucous laughter.\n You are having such a good time that you fail to notice that you have stopped breathing.\n It's a good thing you are enjoying yourself, as you will be attending this dinner for eternity...END\n"
promptEatSomething:
		.asciiz "\nYou reach down and pick up a roll from the table, and take a bite.\n As soon as you do, you feel the soft bread turn to ash in your mouth.\n You decide it's probably best not to try anything else.\n With one last glance back, you exit the room.\n"
promptLeaveDining1:
		.asciiz "To enter the parlor, type 1.\n"
promptLeaveDining2:
		.asciiz "To go upstairs, type 2.\n"
promptParlor:
		.asciiz "\nBefore you opened the door, you could hear the faint sounds of a television coming from the room beyond.\n As you enter, you see the television on the other side of the room, playing a black and white movie that you've never seen before.\n You notice that the TV is not plugged into the wall outlet.\n The rocking chair that sits facing the screen has its back to you, but you can see that it is distinctly rocking back and forth.\n"
promptParlorChoice1:
		.asciiz "To investigate the rocking chair, type 1.\n"
promptParlorChoice2:
		.asciiz "To get out of here as fast as you possibly can, enter 2.\n"
promptChair:
		.asciiz "\nYou approach the chair, and you get just close enough to see bones on the armrest before the seated figure rises.\n A decrepit skeleton slowly lifts itself from its seat and faces you.\n There is a short pause, followed swiftly by a scream so loud the light fixtures around the room shake.\n The fleshless being slowly advances toward you.\n"
promptChairChoice1:
		.asciiz "To attack the skeleton, enter 1.\n"
promptChairChoice2:
		.asciiz "To run away, enter 2.\n"
promptAttack:
		.asciiz "\nYou ready yourself against the skeleton's attack, but you see now that it seems to be having a very hard time moving.\n You cautiosly approach and, feeling bolder, give the skeleton a light shove.\n It falls to the floor in a heap, loose bones scattering in all directions.\n As you congratulate yourself on your victory, you notice a glint of metal coming from inside the skull atop the pile at your feet.\n You reach in and grasp a key. You slide it into your pocket, hoping it will be of use later.\n You try the main doors, and when the key fails to open them, you decide to try the second floor.\n"
promptRunUpstairs:
		.asciiz "\nYou head through the entrance hall and up the staircase, realizing that, while the wailing coming from above seems to be getting louder, it is coming from the third floor.\n You emerge onto a balcony that travels along the edges of the high ceiling of the entrance hall.\n You can see a staircase leading up, as well as doorways that open into what looks like a bathroom, playroom, and child's room.\n"
promptUpstairsChoice1:
			.asciiz "To head to the third floor, enter 1\n"
promptUpstairsChoice2:
		.asciiz "To investigate the bathroom, enter 2\n"
promptUpstairsChoice3:
		.asciiz "To see what's in the Child's Room, enter 3\n"
promptUpstairsChoice4:
		.asciiz "To enter the playroom, enter 4\n"
promptBathroom:
		.asciiz "\nYou open the door, and as a wave of nausea rolls over you, you empty your stomach onto the floor.\n Blood has been splashed everywhere, so much that it has completely covered the bathtub at the end of the room.\n Vile epithets are scratched into the walls, many of which are cursing someone named James.\n Some of the slashes in the wall appear to be leaking even more blood into the room.\n"
promptBathroomLeave:
		.asciiz "You know you need to leave or you will be sick again. \nTo go to the child's room, enter 1. \nTo go to the playroom, type 2. \nTo travel upstairs, enter 3.\n"
promptChildRoom:
		.asciiz "\nYou carefully push open the door and are greeted with the sight of a bed covered in stuffed animals.\n The room looks as if no one has been in it for years, but as you look down you notice that there is a stuffed rabbit at your feet.\n"
promptChildChoice1:
		.asciiz "To take the rabbit with you, enter 1.\n"
promptGetRabbit:
		.asciiz "\nThe rabbit is soft, and comforts you slightly.\n"
promptChildChoice2:
		.asciiz "To let it lie there, type 2.\n"
promptChildLeave1:
		.asciiz "To enter the playroom, enter 1.\n"
promptChildLeave2:
		.asciiz "To go upstairs, type 2.\n"
promptChildLeave3:
		.asciiz "To visit the bathroom, enter 3.\n"
promptPlayroom:
		.asciiz "\nFollowing the sound of quiet sobbing, you open the door.\n Inside you see a little girl, sitting at a small table and clutching a teddy bear.\n She appears to be crying, but it is impossible to tell, as you can see right through her.\n She notices you standing there and says, \"Hello. Will you play with me? No one wants to play with me any more.\"\n"
promptNoToy:
		.asciiz "Before you can react, you see the room start to grow, and feel your body stiffening.\n After several seconds, your limp form lies on the ground, button eyes staring blankly ahead.\n The last guest has arrived, and the tea party can begin...END\n"
promptToy:
		.asciiz "She spies the stuffed rabbit you have and giggles.\n You entertain the ghost girl by sitting down for a tea party with the rabbit.\n After a few minutes of playtime, she asks you if you've seen her mommy around. \"Mommy got really mad one night, and she hurt me and my brother. I know she's sorry, and I want to play with her more, but she won't come down. Could you ask her to?\"\n She hands you her teddy bear and continues playing with the rabbit.\n You set off up the stairs in an attempt to find her mother.\n"
prompt3rdFloor:
		.asciiz "\nAs you climb the stairs to the third level of the house, the screaming and shrieking you have been hearing intensifies.\n You see a closed door in front of you, as well as what looks like a guest room.\n The master bedroom looms at the end of the hallway.\n"
prompt3rdChoice1:
		.asciiz "To go to the closed door, enter 1.\n"
prompt3rdChoice2:
		.asciiz "To go to the guest room, enter 2.\n"
prompt3rdChoice3:
		.asciiz "To enter the master bedroom, type 3.\n"
promptLockedNoKey:
		.asciiz "\nYou walk up to the door and try to open it, only to find that it will not budge.\n You attempt to force the door open, and your struggles mask the sound of shambling coming from down the corridor.\n You give up on the door just in time to see a large monster standing before you.\n You have just enough time to scream before you are devoured...END\n"
promptLockedKey:
		.asciiz "\nThe door does not open on the first try, but then you notice that the key you picked up earlier matches the lock.\n You carefully slide the key into the lock and turn it.\n Instantly, the door swings open, and you gasp at what is revealed.\n Inside, sitting upon a pedestal, is a Proton Pack as well as a ghost trap.\n Smiling, you heft the contraption onto your back, and continue your exploration of the house.\n"
promptGuestRoom:
		.asciiz "\nThe door opens easily, and you find yourself looking at the ghost of a tall, beautiful blonde woman.\n She turns to face you, and a look of pure terror crosses her face.\n Suddenly, she is hurled backward against the wall.\n She shakily gets to her feet.\n Before your eyes, you see the figure lifted and thrown across the room through a broken window.\n Her echoing scream trails off as her form fades.\n As you look back at the table she she was seated at, you find an intricately crafted mirror.\n"
promptGuestChoice1:
		.asciiz "To pick up the mirror, press 1.\n"
promptGuestChoice2:
		.asciiz "To leave the mirror behind, press 2.\n"
promptGetMirror:
		.asciiz "When you look in the mirror, you see ghostly figures in the darkness behind you.  They appear to be waiting for something."
promptMasterBedroom:
		.asciiz "\nAs you enter the Master Bedroom, the door slams shut behind you.\n You can hear the the lock engage, a terrible chill fills the air and a wind picks up from everywhere at once.\n An apparition materializes in front of you and the color drains from your face.\n Seven feet tall, with eyes and hair of the deepest black, she turns to you and, with a voice filled with the wailing of the damned, asks, \"Who dares enter my home? Why should I spare your pathetic life?\"\n"
promptUseMirror:
		.asciiz "To use the mirror, enter 1.\n"
promptUseProton:
		.asciiz "To use the proton pack, enter 2.\n"
promptUseTeddy:
		.asciiz "To use the Teddy Bear, enter 3.\n"
promptAttackG:
		.asciiz "To attack the ghost, enter 4.\n"
promptMirror:
		.asciiz "\n\"You dare bring that object to me!?\" the spirit yells, full of rage.\n She points at you, and you can feel yourself becoming chilled to the bone.\n You also get the sense that you are growing smaller and smaller.\n The mirror drops to the floor, and you look out into the room from the glass of your new, eternal prison.\n"
promptProtonSuccess:
		.asciiz "\nYou point the proton gun you are carrying at the geist, and her screams become more panicked.\n The stream of protons undulates wildly, but the spirit is getting visibly weaker.\n You slide the trap beneath her, and her screams dwindle to nothing as she becomes trapped forever.\n Smiling you make your way out of the house and out into the street, and you don't even look back as the building fades into nothingness.\n"
promptProtonFailure:
		.asciiz "\nThe proton pack's battery explodes, killing you. You are trapped in the house forever as a ghost, destined to sing cliched 80's songs.\n"
promptTeddyBear:
		.asciiz "\nYou take out little girl's teddy bear and show it to the spirit.\n You explain to her that her children want her to stop scaring them.\n The spirit slowly approaches you, and takes the bear from your hand.\n Instantly, she starts shrinking until she is the size of a normal human.\n \"Thank you,\" she whispers, \"for I have forgotten my children. I hope that they can forgive me.\"\n With that the spirit disappears, and the cries that have been filling the house cease.\n You suddenly feel very lightheaded, and before you realize what's happening, you fall to the floor unconscious.\n You awaken on the sidewalk where you were standing earlier.\n As you look back at the mansion, you can see that there are no longer any lights on, and it looks as though the house has not been lived in for years.\n"
promptAttackGhost:
		.asciiz "\nYou take a wild swing at the spirit, and your hand passes harmlessly through her spectral form.\n What did you think would happen if you tried to attack a ghost?\n The last thing you see as the spirit tears you apart is your own limbs being thrown across the room.\n"

promptGameInstr:
		.asciiz "\nWelcome to Scary House, the Game.  You will have several options for each room you encounter.  To save the game at any point, enter 9.  To load a saved game, enter 8 now.\nGood luck.\n\n"
promptLoadGame:
		.asciiz "\nPlease enter game code:\n"
promptLoadGame2:
		.asciiz "\nPlease enter game key:\n"
promptLoadingGame:
		.asciiz "\nLoading game...\n\n"
promptSaveGame:
		.asciiz "\nSaving game...\nGame code:\n"
promptSaveGame2:
		.asciiz "\nGame key:\n"
promptSavingGame:
		.asciiz "\nPlease write this code and key down in order to load your game later.\nThanks for playing, come back soon!\n"
		
.globl main

.text

#xorshift random number generator
#see Marsaglia, George (July 2003). "Xorshift RNGs". Journal of Statistical Software Vol. 8 (Issue  14), or the wikipedia page for xorshift
#puts a semirandom unsigned int into t8
get_random_uint_in_t8:
addi $t0, $s7, 0
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
addi $t0, $zero, 3

xorshift_seed_loop:

#read a number
la $a0, enter_a_number_prompt
li $v0, 4
syscall
li $v0, 5
syscall

addi $t8, $zero, 4
mult $t8, $t0
mflo $t8

add $t8, $s7, $t8

#store
sw $v0, 0($t8)

#i--
addi $t0, $t0, -1


#branch if less than 0
bgez $t0, xorshift_seed_loop
j $ra

printranduint:
addi $s3, $ra, 0
jal get_random_uint_in_t8
addi $v0, $zero, 1
addi $a0, $t8, 0
syscall
addi $ra, $s3, 0
j $ra


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
#seed rng and bury the first few results
jal xorshift_seed_function

addi $t4, $zero, 8000
buryLoop:
jal get_random_uint_in_t8
addi $t4, $t4, -1
bgtz $t4, buryLoop

EntranceStart:

li $v0,4
la $a0, promptGameInstr
syscall

li $v0,4
la $a0, promptEntrance
syscall

li $v0,4
la $a0, promptEntranceChoice1
syscall

li $v0,4
la $a0, promptEntranceChoice2
syscall

li $v0,4
la $a0, promptEntranceChoice3
syscall

li $v0, 4
la $a0, promptEntranceHanoi
syscall

li $v0,5
syscall
move $t0,$v0

beq $t0, 1, Parlor
beq $t0, 2, DiningRoom
beq $t0, 3, Upstairs
beq $t0, 4, callHanoi
beq $t0, 8, LoadGame

callHanoi:
jal towers_of_hanoi
j EntranceStart

# may want to move this
LoadGame:
li $v0, 4
la $a0, promptLoadGame
syscall

li $v0, 5
syscall
move $t6, $v0	# program counter

li $v0, 4
la $a0, promptLoadGame2
syscall

li $v0, 5
syscall
move $t0, $v0	# inventory code

li $v0, 4
la $a0, promptLoadingGame
syscall

# set item registers
li $t8, 10
div $t0, $t8
mflo $t0
mfhi $t5

li $t8, 10
div $t0, $t8
mflo $t0
mfhi $t4

li $t8, 10
div $t0, $t8
mflo $t0
mfhi $t3

li $t8, 10
div $t0, $t8
mflo $t0
mfhi $t2

li $t8, 10
div $t0, $t8
mflo $t0
mfhi $t1

# go to address specified in program counter
jr $t6

# end load game

# begin save game
SaveGame:
li $v0, 4
la $a0, promptSaveGame
syscall

# skip back $t7 spaces to do all printouts
addi $t7, $t7, 3 # 2 for pipelining and 1 for line of syscall
li $t6, 4
mult $t7, $t6	# 4 bytes/addr
mflo $t7
sub $t0, $ra, $t7

# print out 'game code' - program counter
li $v0, 1
move $a0, $t0
syscall

# print out 'game key' - inventory
li $v0, 4
la $a0, promptSaveGame2
syscall

li $v0, 1
move $a0, $t1
syscall

li $v0, 1
move $a0, $t2
syscall

li $v0, 1
move $a0, $t3
syscall

li $v0, 1
move $a0, $t4
syscall

li $v0, 1
move $a0, $t5
syscall

li $v0, 4
la $a0, promptSavingGame
syscall
b end
# end save game

Parlor:
li $v0,4
la $a0, promptParlor
syscall

li $v0,4
la $a0, promptParlorChoice1
syscall

li $v0,4
la $a0, promptParlorChoice2
syscall

li $v0,5
syscall
move $t0,$v0

li $t7, 15
addi $t6, $t0, -9
bgezal $t6, SaveGame
beq $t0, 1, Chair
beq $t0, 2, Upstairs

Chair:
li $v0,4
la $a0, promptChair
syscall

li $v0,4
la $a0, promptChairChoice1
syscall

li $v0,4
la $a0, promptChairChoice2
syscall

li $v0,5
syscall
move $t0,$v0

li $t7, 15
addi $t6, $t0, -9
bgezal $t6, SaveGame
beq $t0, 1, Attack
beq $t0, 2, Upstairs

Attack:
li $v0,4
la $a0, promptAttack
syscall
li $t1, 1
b Upstairs


DiningRoom:
li $v0,4
la $a0, promptDining
syscall

li $v0,4
la $a0, promptDiningChoice1
syscall

li $v0,4
la $a0, promptDiningChoice2
syscall

li $v0,4
la $a0, promptDiningChoice3
syscall

li $v0,5
syscall
move $t0,$v0

li $t7, 18
addi $t6, $t0, -9
bgezal $t6, SaveGame
beq $t0, 1, ChairDeath
beq $t0, 2, EatSomething 
beq $t0, 3, Return

Return:
li $v0,4
la $a0, promptEntranceChoice1
syscall

li $v0,4
la $a0, promptEntranceChoice2
syscall

li $v0,4
la $a0, promptEntranceChoice3
syscall

li $v0,5
syscall
move $t0,$v0

li $t7, 15
addi $t6, $t0, -9
bgezal $t6, SaveGame
beq $t0, 1, Parlor
beq $t0, 2, DiningRoom
beq $t0, 3, Upstairs
 
ChairDeath:
li $v0,4
la $a0, promptChairDeath
syscall

b end

EatSomething:
li $v0,4
la $a0, promptEatSomething
syscall

li $v0,4
la $a0, promptLeaveDining1
syscall

li $v0,4
la $a0, promptLeaveDining2
syscall

li $v0,5
syscall
move $t0,$v0

li $t7, 15
addi $t6, $t0, -9
bgezal $t6, SaveGame
beq $t0, 1, Parlor
beq $t0, 2, Upstairs

Upstairs:
li $v0,4
la $a0, promptRunUpstairs
syscall

li $v0,4
la $a0, promptUpstairsChoice1
syscall

li $v0,4
la $a0, promptUpstairsChoice2
syscall

li $v0,4
la $a0, promptUpstairsChoice3
syscall

li $v0,4
la $a0, promptUpstairsChoice4
syscall

li $v0,5
syscall
move $t0,$v0

li $t7, 21
addi $t6, $t0, -9
bgezal $t6, SaveGame
beq $t0, 1, ThirdFloor
beq $t0, 2, Bathroom
beq $t0, 3, ChildsRoom
beq $t0, 4, Playroom

Bathroom:
li $v0,4
la $a0, promptBathroom
syscall

li $v0,4
la $a0, promptBathroomLeave
syscall

li $v0,5
syscall
move $t0,$v0

li $t7, 12
addi $t6, $t0, -9
bgezal $t6, SaveGame
beq $t0, 3, ThirdFloor
beq $t0, 1, ChildsRoom
beq $t0, 2, Playroom

ChildsRoom:
li $v0,4
la $a0, promptChildRoom
syscall

li $v0,4
la $a0, promptChildChoice1
syscall

li $v0,4
la $a0, promptChildChoice2
syscall

li $v0,5
syscall
move $t0,$v0

beq $t0, 2, ChildLeave

li $v0,4
la $a0, promptGetRabbit 
syscall

li $t2, 1

ChildLeave:
li $v0,4
la $a0, promptChildLeave1
syscall

li $v0,4
la $a0, promptChildLeave2
syscall

li $v0,4
la $a0, promptChildLeave3
syscall

li $v0,5
syscall
move $t0,$v0

li $t7, 15
addi $t6, $t0, -9
bgezal $t6, SaveGame
beq $t0, 3, Bathroom
beq $t0, 2, ThirdFloor
beq $t0, 1, Playroom

Playroom:
li $v0,4
la $a0, promptPlayroom
syscall

beq $t2, 1, Toy

li $v0,4
la $a0, promptNoToy
syscall

b end

Toy:
li $v0,4
la $a0, promptToy
syscall

li $t3, 1

b ThirdFloor



ThirdFloor:
li $v0,4
la $a0, prompt3rdFloor
syscall

li $v0,4
la $a0, prompt3rdChoice1
syscall

li $v0,4
la $a0, prompt3rdChoice2
syscall

li $v0,4
la $a0, prompt3rdChoice3
syscall


li $v0,5
syscall
move $t0,$v0

li $t7, 18
addi $t6, $t0, -9
bgezal $t6, SaveGame
beq $t0, 1, ClosedDoor
beq $t0, 2, GuestRoom
beq $t0, 3, MasterBedroom

ClosedDoor:
beq $t1, 1, DoorOpens

li $v0,4
la $a0, promptLockedNoKey
syscall

b end

DoorOpens:
li $v0,4
la $a0, promptLockedKey
syscall

li $t4,1

li $v0,4
la $a0, prompt3rdChoice2
syscall

li $v0,4
la $a0, prompt3rdChoice3
syscall

li $v0,5
syscall
move $t0,$v0

li $t7, 16
addi $t6, $t0, -9
bgezal $t6, SaveGame
beq $t0, 2, GuestRoom
beq $t0, 3, MasterBedroom

GuestRoom:
li $v0,4
la $a0, promptGuestRoom
syscall

li $v0,4
la $a0, promptGuestChoice1
syscall

li $v0,4
la $a0, promptGuestChoice2
syscall

li $v0,5
syscall
move $t0,$v0

li $t7, 15
addi $t6, $t0, -9
bgezal $t6, SaveGame
beq $t0, 1, Mirror
beq $t0, 2, NoMirror

Mirror:
li $t5, 1

li $v0,4
la $a0, promptGetMirror
syscall

b MasterBedroom

NoMirror:
b MasterBedroom

MasterBedroom:
li $v0,4
la $a0, promptMasterBedroom
syscall

beq $t5,0, notMirror
li $v0,4
la $a0, promptUseMirror
syscall

notMirror:
beq $t4, 0, notProton
li $v0,4
la $a0, promptUseProton
syscall

notProton:
beq $t3, 0, notTeddy
li $v0,4
la $a0, promptUseTeddy
syscall

notTeddy:
li $v0,4
la $a0, promptAttackG
syscall

li $v0,5
syscall
move $t0,$v0

li $t7, 9
addi $t6, $t0, -9
bgezal $t6, SaveGame
beq $t0, 1, usedMirror
beq $t0, 2, usedProton
beq $t0, 3, usedTeddy
beq $t0, 4, Attacked

usedMirror:
li $v0,4
la $a0, promptMirror
syscall

b end

usedProton:
jal get_random_uint_in_t8

addi $t7, $zero, 2
div $t8, $t7
mfhi $t8
blez $t8, protonFail

protonSuccess:
li $v0,4
la $a0, promptProtonSuccess
syscall
b end

protonFail:
li $v0,4
la $a0, promptProtonFailure
syscall
b end

usedTeddy:
li $v0,4
la $a0, promptTeddyBear
syscall

Attacked:
li $v0,4
la $a0, promptAttackGhost
syscall

b end



end:
li $v0,10
syscall
