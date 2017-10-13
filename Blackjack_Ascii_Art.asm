.data
	welcome: .asciiz "Welcome to the game of Blackjack!\nMy name is Computer, and I will be dealing for you today."
	menu: .asciiz "Menu:\nFor the rules and how to play, enter 1\nTo play, enter 2\nTo see your money, enter 3\nTo see the previous hand, enter 4\nTo cash out, enter 5\n"
	error: .asciiz "Error, please try again"
	ruless: .asciiz "How to play:\n-Every 5 games, a 52 card deck will be shuffled and used for the games\n-The player will place his or her bet in the betting box\n-The player will be dealt two cards, face up, as will the dealer\n-The player must choose whether to hit (take a card) or stand (end their turn)\n-Number cards count as their natural value; the jack, queen, and king count as 10; aces are valued as either 1 or 11 according to the player's choice\n-After all boxes have finished playing, the dealer's hand is resolved by drawing cards until the hand busts or achieves a value of 17 or higher\n-A player achieves a blackjack if they get 21 points in the first two cards they are dealt\n\nRules:\n-Player wins if the player:\n    a) Gets blackjack\n    b) Gets a total higher than the dealer after both have finished taking hits\n    c) The dealer busts and the player does not\n-The dealer always wins a tie\n-Blackjack beats any hand that is not a blackjack, even one with a value of 21"
	pleasure: .asciiz "It was a pleaure dealing for you, have a nice day!"
	moneyy: .asciiz "Money:\n$"
	cashin: .asciiz "How much would you like to cash in?"
	guyss: .asciiz "Please enter a positive ingter of equal or lesser value to $1,000,000."
	cashout: .asciiz "Your total winnings are: $"
	cashoutt: .asciiz "Would you like to cash out? (type y or n)"
	nomoree: .asciiz "You have no more money :("
	yorn: .space 2
	previous: .asciiz "Pervious hand:"
	should: .space 2
	nonee: .asciiz "No previous hand..."
	playercardss: .asciiz "Player Cards:\n"
	playercards: .space 30
	dealercardss: .asciiz "Dealer Cards:\n"
	dealercards: .space 30
	comma: .asciiz ","
	countingcards: .space 14
	return: .asciiz "\n"
	hit: .asciiz "Options:\n-enter 1 to hit\n-enter 2 to stand (no more hits)\n-enter 3 to view cards\n-enter 4 to fold"
	foldd: .asciiz "You fold."
	bustt: "You busted."
	winn: "You win!"
	loose: "You lose."
	buff: .space 2
	pleasee: .asciiz "Please enter one of the listed values or click cancel."
	bj: .asciiz "You got Blackjack!"
	bet: .asciiz "How much would you like to bet?"
	pleaseeee: .asciiz "Please enter a positive integer of equal or less value to your money."
	shuffel: .asciiz "The deck has been shuffled!"
	card1: .asciiz " ------------- 	"
	card2: .asciiz "|A            |	"
	card3: .asciiz "|   -------   |	"
	card4: .asciiz "|  |X      |  |	"
	card5: .asciiz "|  |       |  |	"
	card6: .asciiz "|4            |	"
	card7: .asciiz "|  | X   X |  |	"
	card8: .asciiz "|            4|	"
	card9: .asciiz "|5            |	"
	card10: .asciiz "|            5|	"
	card11: .asciiz "|6            |	"
	card12: .asciiz "|            6|	"
	card13: .asciiz "|7            |	"
	card14: .asciiz "|  | X X X |  |	"
	card15: .asciiz "|            7|	"
	card16: .asciiz "|8            |	"
	card17: .asciiz "|            8|	"
	card18: .asciiz "|9            |	"
	card19: .asciiz "|            9|	"
	card20: .asciiz "|10           |	"
	card21: .asciiz "|           10|	"
	card22: .asciiz "|J            |	"
	card23: .asciiz "|  |   J   |  |	"
	card24: .asciiz "|            J|	"
	card25: .asciiz "|Q            |	"
	card26: .asciiz "|  |   Q   |  |	"
	card27: .asciiz "|            Q|	"
	card28: .asciiz "|K            |	"
	card29: .asciiz "|  |   K   |  |	"
	card30: .asciiz "|            K|	"
	card31: .asciiz "|  |   A   |  |	"
	card32: .asciiz "|  |      X|  |	"
	card33: .asciiz "|            A|	"
	card34: .asciiz "|2            |	"
	card35: .asciiz "|  |   X   |  |	"
	card36: .asciiz "|            2|	"
	card37: .asciiz "|3            |	"
	card38: .asciiz "|            3|	"
	gamee: .space 2
	
	
	
	#list of registers:
	#$t0- money
	#$t1- number drawn
	#$t2- user's total
	#$t3- dealer's total
	#$t4- counting cards
	#$t5- card dealt
	#$t6- counting times through
	#$t7- user's cards
	#$t8- dealer's cards
	#$t9- random stuff
	#$s0- counting user's elevens
	#$s1- counting dealer's elevens
	#$s2- counting user's face cards
	#$s3- counting dealer's face cards
	#$s4- bet
	

.text
	la $s5, 5
	
	li $v0, 4
	la $a0, welcome
	syscall
	li $v0, 4
	la $a0, return
	syscall
	
	cash:
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, cashin
	syscall
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 5
	syscall
	la $t0, ($v0)
	blez $t0, tryagainn
	bgt $t0, 1000000, tryagainn
	b menuu
	tryagainn:
	li $v0, 4
	la $a0, guyss
	syscall
	b cash
	
	
	menuu:
	beqz $t0, nomore
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4 #menuu
	la $a0, menu
	syscall
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 5
	syscall
	la $a2, ($v0)
	li $v0, 4
	la $a0, return
	syscall
	
	choice:
	beq $a2, 1, rules #choice
	beq $a2, 2, play
	beq $a2, 3, money
	beq $a2, 4, see
	beq $a2, 5, askkk
	b tryagain	
	
	tryagain: 
	li $v0, 4 #tryagain
	la $a0, error
	syscall
	li $v0, 4
	la $a0, return
	syscall
	
	b menuu
	
	rules:
	li $v0, 4 #rules
	la $a0, ruless
	syscall
	li $v0, 4
	la $a0, return
	syscall
	
	b menuu	
	
	see:
	lb $t9, gamee
	beqz $t9, none
	la $t9, 1
	sb $t9, should
	b ask3
	see2:
	la $t9, 0
	sb $t9, should
	
	b menuu
	
	none:
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, nonee
	syscall
	li $v0, 4
	la $a0, return
	syscall
	b menuu
	
	play:
	start2:
	la $t9, 1
	sb $t9, gamee
	bne $s5, 5, start3
	shuffle:
	la $s5, 0
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, shuffel
	syscall
	li $v0, 4
	la $a0, return
	syscall
	la $t2, 0
	sb $t2, countingcards
	sb $t2, countingcards + 1
	sb $t2, countingcards + 2
	sb $t2, countingcards + 3
	sb $t2, countingcards + 4
	sb $t2, countingcards + 5
	sb $t2, countingcards + 6
	sb $t2, countingcards + 7
	sb $t2, countingcards + 8
	sb $t2, countingcards + 9
	sb $t2, countingcards + 10
	sb $t2, countingcards + 11
	sb $t2, countingcards + 12
	sb $t2, countingcards + 13
	start3:
	la $v0, 4
	la $a0, bet
	syscall
	li $v0, 4
	la $a0, return
	syscall
	la $v0, 5
	syscall
	la $s4, ($v0)
	bgt $s4, $t0, pleaseee
	blez $s4, pleaseee
	la $t2, 0
	la $t3, 0
	la $t1, 0
	la $s0, 0
	la $s1, 0
	la $s2, 0
	la $s3, 0
	sb $t2, playercards
	sb $t3, dealercards
	la $t6, 0
	la $t7, playercards
	la $t8, dealercards
	add $s5, $s5, 1
	
	
	ask:
	blt $t6, 4, ask2
	ask3:
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, playercardss
	syscall
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, playercards
	syscall
	li $v0, 4
	la $a0, return
	syscall
	la $s7, 0
	la $t9, 0
	cardd:
	lb $s6 playercards($s7)
	beq $s6, 65, cardd1
	beq $s6, 50, cardd1
	beq $s6, 51, cardd1
	beq $s6, 52, cardd1
	beq $s6, 53, cardd1
	beq $s6, 54, cardd1
	beq $s6, 55, cardd1
	beq $s6, 56, cardd1
	beq $s6, 57, cardd1
	beq $s6, 49, cardd1
	beq $s6, 74, cardd1
	beq $s6, 81, cardd1
	beq $s6, 75, cardd1
	add $s7, $s7, 1
	beq $s6, 44, cardd
	beq $s6, 48, cardd
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	carddd:
	lb $s6 playercards($s7)
	beq $s6, 65, cardd2
	beq $s6, 50, cardd34
	beq $s6, 51, cardd37
	beq $s6, 52, cardd6
	beq $s6, 53, cardd9
	beq $s6, 54, cardd11
	beq $s6, 55, cardd13
	beq $s6, 56, cardd16
	beq $s6, 57, cardd18
	beq $s6, 49, cardd20
	beq $s6, 74, cardd22
	beq $s6, 81, cardd25
	beq $s6, 75, cardd28
	add $s7, $s7, 1
	beq $s6, 44, carddd
	beq $s6, 48, carddd
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	cardddd:
	lb $s6 playercards($s7)
	beq $s6, 65, cardd3
	beq $s6, 50, cardd3
	beq $s6, 51, cardd3
	beq $s6, 52, cardd3
	beq $s6, 53, cardd3
	beq $s6, 54, cardd3
	beq $s6, 55, cardd3
	beq $s6, 56, cardd3
	beq $s6, 57, cardd3
	beq $s6, 49, cardd3
	beq $s6, 74, cardd3
	beq $s6, 81, cardd3
	beq $s6, 75, cardd3
	add $s7, $s7, 1
	beq $s6, 44, cardddd
	beq $s6, 48, cardddd
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	carddddd:
	lb $s6 playercards($s7)
	beq $s6, 65, cardd4
	beq $s6, 50, cardd5
	beq $s6, 51, cardd35
	beq $s6, 52, cardd5
	beq $s6, 53, cardd7
	beq $s6, 54, cardd7
	beq $s6, 55, cardd7
	beq $s6, 56, cardd7
	beq $s6, 57, cardd14
	beq $s6, 49, cardd7
	beq $s6, 74, cardd4
	beq $s6, 81, cardd4
	beq $s6, 75, cardd4
	add $s7, $s7, 1
	beq $s6, 44, carddddd
	beq $s6, 48, carddddd
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	
	cardddddd:
	lb $s6 playercards($s7)
	beq $s6, 65, cardd5
	beq $s6, 50, cardd35
	beq $s6, 51, cardd5
	beq $s6, 52, cardd7
	beq $s6, 53, cardd5
	beq $s6, 54, cardd5
	beq $s6, 55, cardd5
	beq $s6, 56, cardd35
	beq $s6, 57, cardd5
	beq $s6, 49, cardd7
	beq $s6, 74, cardd5
	beq $s6, 81, cardd5
	beq $s6, 75, cardd5
	add $s7, $s7, 1
	beq $s6, 44, cardddddd
	beq $s6, 48, cardddddd
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	carddddddd:
	lb $s6 playercards($s7)
	beq $s6, 65, cardd31
	beq $s6, 50, cardd5
	beq $s6, 51, cardd35
	beq $s6, 52, cardd5
	beq $s6, 53, cardd35
	beq $s6, 54, cardd7
	beq $s6, 55, cardd14
	beq $s6, 56, cardd7
	beq $s6, 57, cardd14
	beq $s6, 49, cardd7
	beq $s6, 74, cardd23
	beq $s6, 81, cardd26
	beq $s6, 75, cardd29
	add $s7, $s7, 1
	beq $s6, 44, carddddddd
	beq $s6, 48, carddddddd
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall	
	
	cardddddddd:
	lb $s6 playercards($s7)
	beq $s6, 65, cardd5
	beq $s6, 50, cardd35
	beq $s6, 51, cardd5
	beq $s6, 52, cardd7
	beq $s6, 53, cardd5
	beq $s6, 54, cardd5
	beq $s6, 55, cardd5
	beq $s6, 56, cardd35
	beq $s6, 57, cardd5
	beq $s6, 49, cardd7
	beq $s6, 74, cardd5
	beq $s6, 81, cardd5
	beq $s6, 75, cardd5
	add $s7, $s7, 1
	beq $s6, 44, cardddddddd
	beq $s6, 48, cardddddddd
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	carddddddddd:
	lb $s6 playercards($s7)
	beq $s6, 65, cardd32
	beq $s6, 50, cardd5
	beq $s6, 51, cardd35
	beq $s6, 52, cardd5
	beq $s6, 53, cardd7
	beq $s6, 54, cardd7
	beq $s6, 55, cardd7
	beq $s6, 56, cardd7
	beq $s6, 57, cardd14
	beq $s6, 49, cardd7
	beq $s6, 74, cardd32
	beq $s6, 81, cardd32
	beq $s6, 75, cardd32
	add $s7, $s7, 1
	beq $s6, 44, carddddddddd
	beq $s6, 48, carddddddddd
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	cardddddddddd:
	lb $s6 playercards($s7)
	beq $s6, 65, cardd3
	beq $s6, 50, cardd3
	beq $s6, 51, cardd3
	beq $s6, 52, cardd3
	beq $s6, 53, cardd3
	beq $s6, 54, cardd3
	beq $s6, 55, cardd3
	beq $s6, 56, cardd3
	beq $s6, 57, cardd3
	beq $s6, 49, cardd3
	beq $s6, 74, cardd3
	beq $s6, 81, cardd3
	beq $s6, 75, cardd3
	add $s7, $s7, 1
	beq $s6, 44, cardddddddddd
	beq $s6, 48, cardddddddddd
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	carddddddddddd:
	lb $s6 playercards($s7)
	beq $s6, 65, cardd33
	beq $s6, 50, cardd36
	beq $s6, 51, cardd38
	beq $s6, 52, cardd8
	beq $s6, 53, cardd10
	beq $s6, 54, cardd12
	beq $s6, 55, cardd15
	beq $s6, 56, cardd17
	beq $s6, 57, cardd19
	beq $s6, 49, cardd21
	beq $s6, 74, cardd24
	beq $s6, 81, cardd27
	beq $s6, 75, cardd30
	add $s7, $s7, 1
	beq $s6, 44, carddddddddddd
	beq $s6, 48, carddddddddddd
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	cardddddddddddd:
	lb $s6 playercards($s7)
	beq $s6, 65, cardd1
	beq $s6, 50, cardd1
	beq $s6, 51, cardd1
	beq $s6, 52, cardd1
	beq $s6, 53, cardd1
	beq $s6, 54, cardd1
	beq $s6, 55, cardd1
	beq $s6, 56, cardd1
	beq $s6, 57, cardd1
	beq $s6, 49, cardd1
	beq $s6, 74, cardd1
	beq $s6, 81, cardd1
	beq $s6, 75, cardd1
	add $s7, $s7, 1
	beq $s6, 44, cardddddddddddd
	beq $s6, 48, cardddddddddddd
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, dealercardss
	syscall
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, dealercards
	syscall
	li $v0, 4
	la $a0, return
	syscall
	cardds:
	lb $s6 dealercards($s7)
	beq $s6, 65, cardd1
	beq $s6, 50, cardd1
	beq $s6, 51, cardd1
	beq $s6, 52, cardd1
	beq $s6, 53, cardd1
	beq $s6, 54, cardd1
	beq $s6, 55, cardd1
	beq $s6, 56, cardd1
	beq $s6, 57, cardd1
	beq $s6, 49, cardd1
	beq $s6, 74, cardd1
	beq $s6, 81, cardd1
	beq $s6, 75, cardd1
	add $s7, $s7, 1
	beq $s6, 44, cardds
	beq $s6, 48, cardds
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	carddds:
	lb $s6 dealercards($s7)
	beq $s6, 65, cardd2
	beq $s6, 50, cardd34
	beq $s6, 51, cardd37
	beq $s6, 52, cardd6
	beq $s6, 53, cardd9
	beq $s6, 54, cardd11
	beq $s6, 55, cardd13
	beq $s6, 56, cardd16
	beq $s6, 57, cardd18
	beq $s6, 49, cardd20
	beq $s6, 74, cardd22
	beq $s6, 81, cardd25
	beq $s6, 75, cardd28
	add $s7, $s7, 1
	beq $s6, 44, carddds
	beq $s6, 48, carddds
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	cardddds:
	lb $s6 dealercards($s7)
	beq $s6, 65, cardd3
	beq $s6, 50, cardd3
	beq $s6, 51, cardd3
	beq $s6, 52, cardd3
	beq $s6, 53, cardd3
	beq $s6, 54, cardd3
	beq $s6, 55, cardd3
	beq $s6, 56, cardd3
	beq $s6, 57, cardd3
	beq $s6, 49, cardd3
	beq $s6, 74, cardd3
	beq $s6, 81, cardd3
	beq $s6, 75, cardd3
	add $s7, $s7, 1
	beq $s6, 44, cardddds
	beq $s6, 48, cardddds
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	carddddds:
	lb $s6 dealercards($s7)
	beq $s6, 65, cardd4
	beq $s6, 50, cardd5
	beq $s6, 51, cardd35
	beq $s6, 52, cardd5
	beq $s6, 53, cardd7
	beq $s6, 54, cardd7
	beq $s6, 55, cardd7
	beq $s6, 56, cardd7
	beq $s6, 57, cardd14
	beq $s6, 49, cardd7
	beq $s6, 74, cardd4
	beq $s6, 81, cardd4
	beq $s6, 75, cardd4
	add $s7, $s7, 1
	beq $s6, 44, carddddds
	beq $s6, 48, carddddds
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	
	cardddddds:
	lb $s6 dealercards($s7)
	beq $s6, 65, cardd5
	beq $s6, 50, cardd35
	beq $s6, 51, cardd5
	beq $s6, 52, cardd7
	beq $s6, 53, cardd5
	beq $s6, 54, cardd5
	beq $s6, 55, cardd5
	beq $s6, 56, cardd35
	beq $s6, 57, cardd5
	beq $s6, 49, cardd7
	beq $s6, 74, cardd5
	beq $s6, 81, cardd5
	beq $s6, 75, cardd5
	add $s7, $s7, 1
	beq $s6, 44, cardddddds
	beq $s6, 48, cardddddds
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	carddddddds:
	lb $s6 dealercards($s7)
	beq $s6, 65, cardd31
	beq $s6, 50, cardd5
	beq $s6, 51, cardd35
	beq $s6, 52, cardd5
	beq $s6, 53, cardd35
	beq $s6, 54, cardd7
	beq $s6, 55, cardd14
	beq $s6, 56, cardd7
	beq $s6, 57, cardd14
	beq $s6, 49, cardd7
	beq $s6, 74, cardd23
	beq $s6, 81, cardd26
	beq $s6, 75, cardd29
	add $s7, $s7, 1
	beq $s6, 44, carddddddds
	beq $s6, 48, carddddddds
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall	
	
	cardddddddds:
	lb $s6 dealercards($s7)
	beq $s6, 65, cardd5
	beq $s6, 50, cardd35
	beq $s6, 51, cardd5
	beq $s6, 52, cardd7
	beq $s6, 53, cardd5
	beq $s6, 54, cardd5
	beq $s6, 55, cardd5
	beq $s6, 56, cardd35
	beq $s6, 57, cardd5
	beq $s6, 49, cardd7
	beq $s6, 74, cardd5
	beq $s6, 81, cardd5
	beq $s6, 75, cardd5
	add $s7, $s7, 1
	beq $s6, 44, cardddddddds
	beq $s6, 48, cardddddddds
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	carddddddddds:
	lb $s6 dealercards($s7)
	beq $s6, 65, cardd32
	beq $s6, 50, cardd5
	beq $s6, 51, cardd35
	beq $s6, 52, cardd5
	beq $s6, 53, cardd7
	beq $s6, 54, cardd7
	beq $s6, 55, cardd7
	beq $s6, 56, cardd7
	beq $s6, 57, cardd14
	beq $s6, 49, cardd7
	beq $s6, 74, cardd32
	beq $s6, 81, cardd32
	beq $s6, 75, cardd32
	add $s7, $s7, 1
	beq $s6, 44, carddddddddds
	beq $s6, 48, carddddddddds
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	cardddddddddds:
	lb $s6 dealercards($s7)
	beq $s6, 65, cardd3
	beq $s6, 50, cardd3
	beq $s6, 51, cardd3
	beq $s6, 52, cardd3
	beq $s6, 53, cardd3
	beq $s6, 54, cardd3
	beq $s6, 55, cardd3
	beq $s6, 56, cardd3
	beq $s6, 57, cardd3
	beq $s6, 49, cardd3
	beq $s6, 74, cardd3
	beq $s6, 81, cardd3
	beq $s6, 75, cardd3
	add $s7, $s7, 1
	beq $s6, 44, cardddddddddds
	beq $s6, 48, cardddddddddds
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	carddddddddddds:
	lb $s6 dealercards($s7)
	beq $s6, 65, cardd33
	beq $s6, 50, cardd36
	beq $s6, 51, cardd38
	beq $s6, 52, cardd8
	beq $s6, 53, cardd10
	beq $s6, 54, cardd12
	beq $s6, 55, cardd15
	beq $s6, 56, cardd17
	beq $s6, 57, cardd19
	beq $s6, 49, cardd21
	beq $s6, 74, cardd24
	beq $s6, 81, cardd27
	beq $s6, 75, cardd30
	add $s7, $s7, 1
	beq $s6, 44, carddddddddddds
	beq $s6, 48, carddddddddddds
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	
	cardddddddddddds:
	lb $s6 dealercards($s7)
	beq $s6, 65, cardd1
	beq $s6, 50, cardd1
	beq $s6, 51, cardd1
	beq $s6, 52, cardd1
	beq $s6, 53, cardd1
	beq $s6, 54, cardd1
	beq $s6, 55, cardd1
	beq $s6, 56, cardd1
	beq $s6, 57, cardd1
	beq $s6, 49, cardd1
	beq $s6, 74, cardd1
	beq $s6, 81, cardd1
	beq $s6, 75, cardd1
	add $s7, $s7, 1
	beq $s6, 44, cardddddddddddds
	beq $s6, 48, cardddddddddddds
	la $s7, 0
	add $t9, $t9, 1
	li $v0, 4
	la $a0, return
	syscall
	lb $t9, should
	beq $t9, 1, see2
	
	li $v0, 4
	la $a0, return
	syscall
	ask2:
	bgt $t2, 21, bust
	beq $t1, 1, choosed
	blt $t6, 4, start #ask
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, hit
	syscall
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 5
	syscall
	la $a1, ($v0)
	li $v0, 4
	la $a0, return
	syscall
	bgt $a1, 4, please
	blt $a1, 1, please
	beq $a1, 4, fold
	
	decide:
	beq $a1, 1, start
	beq $a1, 3, ask
	bne $a1, 2, please
	la $t1, 1
	b start
	
	please:
	li $v0, 4
	la $a0, pleasee
	syscall
	b ask2
	
	start:
	blt $t6, 2, chooseu #start
	blt $t6, 4, choosed
	beq $t1, 0, chooseu
	beq $t1, 2, fold
	beq $t1, 1, choosed
	
	chooseu: 
	li $v0, 42 #choose
	la $a0, 1
	la $a1, 13
	syscall
	la $t5, ($a0)
	beq $t5, 0, zero
	beq $t5, 1, one
	beq $t5, 2, two
	beq $t5, 3, three
	beq $t5, 4, four
	beq $t5, 5, five
	beq $t5, 6, six
	beq $t5, 7, seven
	beq $t5, 8, eight
	beq $t5, 9, nine
	beq $t5, 10, ten
	beq $t5, 11, eleven
	beq $t5, 12, twelve
	
	zero:
	lb $t4, countingcards #zero
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	add $s0, $s0, 1
	sb $t4, countingcards
	la $t4, 65
	sb $t4, ($t7)
	la $t4, 44
	sb $t4, 1($t7)
	la $t4, 0
	sb $t4, 2($t7)
	add $t7, $t7, 2
	add $t2, $t2, 1
	b ask
	
	one:
	lb $t4, countingcards + 1 #one
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 1
	la $t4, 50
	sb $t4, ($t7)
	la $t4, 44
	sb $t4, 1($t7)
	la $t4, 0
	sb $t4, 2($t7)
	add $t7, $t7, 2
	add $t2, $t2, 2
	b ask
	
	two:
	lb $t4, countingcards + 2 #two
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 2
	la $t4, 51
	sb $t4, ($t7)
	la $t4, 44
	sb $t4, 1($t7)
	la $t4, 0
	sb $t4, 2($t7)
	add $t7, $t7, 2
	add $t2, $t2, 3
	b ask
	
	three:
	lb $t4, countingcards + 3 #three
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 3
	la $t4, 52
	sb $t4, ($t7)
	la $t4, 44
	sb $t4, 1($t7)
	la $t4, 0
	sb $t4, 2($t7)
	add $t7, $t7, 2
	add $t2, $t2, 4
	b ask
	
	four:
	lb $t4, countingcards + 4 #four
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 4
	la $t4, 53
	sb $t4, ($t7)
	la $t4, 44
	sb $t4, 1($t7)
	la $t4, 0
	sb $t4, 2($t7)
	add $t7, $t7, 2
	add $t2, $t2, 5
	b ask
	
	five:
	lb $t4, countingcards + 5 #five
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 5
	la $t4, 54
	sb $t4, ($t7)
	la $t4, 44
	sb $t4, 1($t7)
	la $t4, 0
	sb $t4, 2($t7)
	add $t7, $t7, 2
	add $t2, $t2, 6
	b ask
	
	six:
	lb $t4, countingcards + 6 #six
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 6
	la $t4, 55
	sb $t4, ($t7)
	la $t4, 44
	sb $t4, 1($t7)
	la $t4, 0
	sb $t4, 2($t7)
	add $t7, $t7, 2
	add $t2, $t2, 7
	b ask
	
	seven:
	lb $t4, countingcards + 7 #seven
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 7
	la $t4, 56
	sb $t4, ($t7)
	la $t4, 44
	sb $t4, 1($t7)
	la $t4, 0
	sb $t4, 2($t7)
	add $t7, $t7, 2
	add $t2, $t2, 8
	b ask
	
	eight:
	lb $t4, countingcards + 8 #eight
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 8
	la $t4, 57
	sb $t4, ($t7)
	la $t4, 44
	sb $t4, 1($t7)
	la $t4, 0
	sb $t4, 2($t7)
	add $t7, $t7, 2
	add $t2, $t2, 9
	b ask
	
	nine:
	lb $t4, countingcards + 9 #nine
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	add $s2, $s2, 1
	sb $t4, countingcards + 9
	la $t4, 49
	sb $t4, ($t7)
	la $t4, 48
	sb $t4, 1($t7)
	la $t4, 44
	sb $t4, 2($t7)
	la $t4, 0
	sb $t4, 3($t7)
	add $t7, $t7, 3
	add $t2, $t2, 10
	b ask
	
	ten:
	lb $t4, countingcards + 10 #ten
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	add $s2, $s2, 1
	sb $t4, countingcards + 10
	la $t4, 74
	sb $t4, ($t7)
	la $t4, 44
	sb $t4, 1($t7)
	la $t4, 0
	sb $t4, 2($t7)
	add $t7, $t7, 2
	add $t2, $t2, 10
	b ask
	
	eleven:
	lb $t4, countingcards + 11 #eleven
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	add $s2, $s2, 1
	sb $t4, countingcards + 11
	la $t4, 81
	sb $t4, ($t7)
	la $t4, 44
	sb $t4, 1($t7)
	la $t4, 0
	sb $t4, 2($t7)
	add $t7, $t7, 2
	add $t2, $t2, 10
	b ask
	
	twelve:
	lb $t4, countingcards + 12 #twelve
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	add $s2, $s2, 1
	sb $t4, countingcards + 12
	la $t4, 75
	sb $t4, ($t7)
	la $t4, 44
	sb $t4, 1($t7)
	la $t4, 0
	sb $t4, 2($t7)
	add $t7, $t7, 2
	add $t2, $t2, 10
	b ask
	
	choosed:
	bge $t3, 17, compare #choose
	li $v0, 42 
	la $a0, 1
	la $a1, 13
	syscall
	la $t5, ($a0)
	bgt $t6, 3, check
	bne $s1, 1, check
	beq $s3, 1, loose
	check:
	beqz $s1, choosed2
	bgt $t3, 11, choosed2
	bgt $t3, 6, compare
	choosed2:
	beq $t5, 0, zerod
	beq $t5, 1, oned
	beq $t5, 2, twod
	beq $t5, 3, threed
	beq $t5, 4, fourd
	beq $t5, 5, fived
	beq $t5, 6, sixd
	beq $t5, 7, sevend
	beq $t5, 8, eightd
	beq $t5, 9, nined
	beq $t5, 10, tend
	beq $t5, 11, elevend
	beq $t5, 12, twelved
	
	zerod:
	lb $t4, countingcards #zero
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	add $s1, $s1, 1
	sb $t4, countingcards
	la $t4, 65
	sb $t4, ($t8)
	la $t4, 44
	sb $t4, 1($t8)
	la $t4, 0
	sb $t4, 2($t8)
	add $t8, $t8, 2
	add $t3, $t3, 1
	b ask
	
	oned:
	lb $t4, countingcards + 1 #one
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 1
	la $t4, 50
	sb $t4, ($t8)
	la $t4, 44
	sb $t4, 1($t8)
	la $t4, 0
	sb $t4, 2($t8)
	add $t8, $t8, 2
	add $t3, $t3, 2
	b ask
	
	twod:
	lb $t4, countingcards + 2 #two
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 2
	la $t4, 51
	sb $t4, ($t8)
	la $t4, 44
	sb $t4, 1($t8)
	la $t4, 0
	sb $t4, 2($t8)
	add $t8, $t8, 2
	add $t3, $t3, 3
	b ask
	
	threed:
	lb $t4, countingcards + 3 #three
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 3
	la $t4, 52
	sb $t4, ($t8)
	la $t4, 44
	sb $t4, 1($t8)
	la $t4, 0
	sb $t4, 2($t8)
	add $t8, $t8, 2
	add $t3, $t3, 4
	b ask
	
	fourd:
	lb $t4, countingcards + 4 #four
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 4
	la $t4, 53
	sb $t4, ($t8)
	la $t4, 44
	sb $t4, 1($t8)
	la $t4, 0
	sb $t4, 2($t8)
	add $t8, $t8, 2
	add $t3, $t3, 5
	b ask
	
	fived:
	lb $t4, countingcards + 5 #five
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 5
	la $t4, 54
	sb $t4, ($t8)
	la $t4, 44
	sb $t4, 1($t8)
	la $t4, 0
	sb $t4, 2($t8)
	add $t8, $t8, 2
	add $t3, $t3, 6
	b ask
	
	sixd:
	lb $t4, countingcards + 6 #six
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 6
	la $t4, 55
	sb $t4, ($t8)
	la $t4, 44
	sb $t4, 1($t8)
	la $t4, 0
	sb $t4, 2($t8)
	add $t8, $t8, 2
	add $t3, $t3, 7
	b ask
	
	sevend:
	lb $t4, countingcards + 7 #seven
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 7
	la $t4, 56
	sb $t4, ($t8)
	la $t4, 44
	sb $t4, 1($t8)
	la $t4, 0
	sb $t4, 2($t8)
	add $t8, $t8, 2
	add $t3, $t3, 8
	b ask
	
	eightd:
	lb $t4, countingcards + 8 #eight
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	sb $t4, countingcards + 8
	la $t4, 57
	sb $t4, ($t8)
	la $t4, 44
	sb $t4, 1($t8)
	la $t4, 0
	sb $t4, 2($t8)
	add $t8, $t8, 2
	add $t3, $t3, 9
	b ask
	
	nined:
	lb $t4, countingcards + 9 #nine
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	add $s3, $s3, 1
	sb $t4, countingcards + 9
	la $t4, 49
	sb $t4, ($t8)
	la $t4, 48
	sb $t4, 1($t8)
	la $t4, 44
	sb $t4, 2($t8)
	la $t4, 0
	sb $t4, 3($t8)
	add $t8, $t8, 3
	add $t3, $t3, 10
	b ask
	
	tend:
	lb $t4, countingcards + 10 #ten
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	add $s3, $s3, 1
	sb $t4, countingcards + 10
	la $t4, 74
	sb $t4, ($t8)
	la $t4, 44
	sb $t4, 1($t8)
	la $t4, 0
	sb $t4, 2($t8)
	add $t8, $t8, 2
	add $t3, $t3, 10
	b ask
	
	elevend:
	lb $t4, countingcards + 11 #eleven
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	add $s3, $s3, 1
	sb $t4, countingcards + 11
	la $t4, 81
	sb $t4, ($t8)
	la $t4, 44
	sb $t4, 1($t8)
	la $t4, 0
	sb $t4, 2($t8)
	add $t8, $t8, 2
	add $t3, $t3, 10
	b ask
	
	twelved:
	lb $t4, countingcards + 12 #twelve
	beq $t4, 4, start
	add $t6, $t6, 1
	add $t4, $t4, 1
	add $s3, $s3, 1
	sb $t4, countingcards + 12
	la $t4, 75
	sb $t4, ($t8)
	la $t4, 44
	sb $t4, 1($t8)
	la $t4, 0
	sb $t4, 2($t8)
	add $t8, $t8, 2
	add $t3, $t3, 10
	b ask
	
	fold:
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, foldd
	syscall
	li $v0, 4
	la $a0, return
	syscall
	b loosee
	
	bust:
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, bustt
	syscall
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, return
	syscall
	b loosee
	
	compare:
	beqz $s0, compare3
	bgt $t2, 11, compare3
	add $t2, $t2, 10
	bne $s0, 1, compare3
	beq $s2, 1, win
	compare3:
	beqz $s1, compare2
	bgt $t3, 11, compare2
	add $t3, $t3, 10
	compare2:
	bgt $t3, 21, win
	bgt $t2, $t3, win
	loosee:
	li $v0, 4
	la $a0, loose
	syscall
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, return
	syscall
	sub $t0, $t0, $s4
	b money
	
	win:
	bne $s0, 1, win2
	bne $s2, 1, win2
	lb $t9, playercardss + 18
	beqz $t9, win3
	lb $t9, playercardss + 19
	bnez $t9, win2
	win3:
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, bj
	li $v0, 4
	la $a0, return
	syscall
	syscall
	win2:
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, winn
	syscall
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, return
	syscall
	add $t0, $t0, $s4
	b money
	
	pleaseee:
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, pleaseeee
	syscall
	li $v0, 4
	la $a0, return
	syscall
	b start2
	
	cardd1:
	li $v0, 4
	la $a0, card1
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd2:
	li $v0, 4
	la $a0, card2
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd3:
	li $v0, 4
	la $a0, card3
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd4:
	li $v0, 4
	la $a0, card4
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd5:
	li $v0, 4
	la $a0, card5
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd6:
	li $v0, 4
	la $a0, card6
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd7:
	li $v0, 4
	la $a0, card7
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd8:
	li $v0, 4
	la $a0, card8
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd9:
	li $v0, 4
	la $a0, card9
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd10:
	li $v0, 4
	la $a0, card10
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd11:
	li $v0, 4
	la $a0, card11
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd12:
	li $v0, 4
	la $a0, card12
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd13:
	li $v0, 4
	la $a0, card13
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd14:
	li $v0, 4
	la $a0, card14
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd15:
	li $v0, 4
	la $a0, card15
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd16:
	li $v0, 4
	la $a0, card16
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd17:
	li $v0, 4
	la $a0, card17
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd18:
	li $v0, 4
	la $a0, card18
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd19:
	li $v0, 4
	la $a0, card19
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd20:
	li $v0, 4
	la $a0, card20
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd21:
	li $v0, 4
	la $a0, card21
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd22:
	li $v0, 4
	la $a0, card22
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd23:
	li $v0, 4
	la $a0, card23
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd24:
	li $v0, 4
	la $a0, card24
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd25:
	li $v0, 4
	la $a0, card25
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd26:
	li $v0, 4
	la $a0, card26
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd27:
	li $v0, 4
	la $a0, card27
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd28:
	li $v0, 4
	la $a0, card28
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd29:
	li $v0, 4
	la $a0, card29
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd30:
	li $v0, 4
	la $a0, card30
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd31:
	li $v0, 4
	la $a0, card31
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd32:
	li $v0, 4
	la $a0, card32
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd33:
	li $v0, 4
	la $a0, card33
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd34:
	li $v0, 4
	la $a0, card34
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd35:
	li $v0, 4
	la $a0, card35
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd36:
	li $v0, 4
	la $a0, card36
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd37:
	li $v0, 4
	la $a0, card37
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	
	cardd38:
	li $v0, 4
	la $a0, card38
	syscall
	add $s7, $s7, 1
	beq $t9, 0, cardd
	beq $t9, 1, carddd
	beq $t9, 2, cardddd
	beq $t9, 3, carddddd
	beq $t9, 4, cardddddd
	beq $t9, 5, carddddddd
	beq $t9, 6, cardddddddd
	beq $t9, 7, carddddddddd
	beq $t9, 8, cardddddddddd
	beq $t9, 9, carddddddddddd
	beq $t9, 10, cardddddddddddd
	beq $t9, 11, cardds
	beq $t9, 12, carddds
	beq $t9, 13, cardddds
	beq $t9, 14, carddddds
	beq $t9, 15, cardddddds
	beq $t9, 16, carddddddds
	beq $t9, 17, cardddddddds
	beq $t9, 18, carddddddddds
	beq $t9, 19, cardddddddddds
	beq $t9, 20, carddddddddddds
	beq $t9, 21, cardddddddddddds
	

	
	money:
	li $v0, 4 #money
	la $a0, moneyy
	syscall
	li $v0, 1
	la $a0, ($t0)
	syscall
	li $v0, 4
	la $a0, return
	syscall
	
	b menuu	
	
	askkk:
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, cashoutt
	syscall
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 8
	la $a0, yorn
	la $a1, 2
	syscall
	li $v0, 4
	la $a0, return
	syscall
	lb $a0, yorn
	beq $a0, 89, done
	beq $a0, 121, done
	b menuu
	
	nomore:
	li $v0, 4
	la $a0, nomoree
	syscall
	b done
	
	done:
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4 #done
	la $a0, pleasure
	syscall
	li $v0, 4
	la $a0, return
	syscall
	li $v0, 4
	la $a0, return
	syscall
	
	li $v0, 4
	la $a0, cashout
	syscall
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	li $v0, 10
	syscall
