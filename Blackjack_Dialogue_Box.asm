.data
	welcome: .asciiz "Welcome to the game of Blackjack!\nMy name is Computer, and I will be dealing for you today."
	menu: .asciiz "For the rules and how to play, enter 1\nTo play, enter 2\nTo see your money, enter 3\nTo see the previous hand, enter 4\nTo cash out, choose cancel"
	error: .asciiz "Error, please try again"
	ruless: .asciiz "How to play:\n-Every 5 games, a 52 card deck will be shuffled and used for the games\n-The player will place his or her bet in the betting box\n-The player will be dealt two cards, face up, as will the dealer\n-The player must choose whether to hit (take a card) or stand (end their turn)\n-Number cards count as their natural value; the jack, queen, and king count as 10; aces are valued as either 1 or 11 according to the player's choice\n-After all boxes have finished playing, the dealer's hand is resolved by drawing cards until the hand busts or achieves a value of 17 or higher\n-A player achieves a blackjack if they get 21 points in the first two cards they are dealt\n\nRules:\n-Player wins if the player:\n    a) Gets blackjack\n    b) Gets a total higher than the dealer after both have finished taking hits\n    c) The dealer busts and the player does not\n-The dealer always wins a tie\n-Blackjack beats any hand that is not a blackjack, even one with a value of 21"
	pleasure: .asciiz "It was a pleaure dealing for you,\nhave a nice day!"
	moneyy: .asciiz "$"
	cashin: .asciiz "How much would you like to cash in?"
	guyss: .asciiz "Please enter a positive ingter of equal or lesser value to $1,000,000."
	cashout: .asciiz "Your total winnings are: $"
	cashoutt: .asciiz "Would you like to cash out?"
	nomoree: .asciiz "You have no more money :("
	nonee: .asciiz "No previous hand..."
	playercardss: .ascii "Player Cards:\n"
	playercards: .space 30
	dealercardss: .ascii "\nDealer Cards:\n"
	dealercards: .space 30
	comma: .asciiz ","
	countingcards: .space 14
	return: .asciiz "\n"
	hit: .asciiz "-enter 1 to hit\n-enter 2 to stand (no more hits)\n-enter 3 to view cards\n-click cancel to fold"
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
	
	li $v0, 55
	la $a0, welcome
	la $a1, 1
	syscall
	
	cash:
	li $v0, 51
	la $a0, cashin
	syscall
	beq $a1, -2, done
	bltz $a1, tryagainn
	la $t0, ($a0)
	blez $t0, tryagainn
	bgt $t0, 1000000, tryagainn
	b menuu
	tryagainn:
	li $v0, 55
	la $a0, guyss
	la $a1, 0
	syscall
	b cash
	
	
	menuu:
	beqz $t0, nomore
	li $v0, 51 #menuu
	la $a0, menu
	syscall
	
	beqz $a1, choice
	beq $a1, 1, tryagain
	beq $a1, 3, tryagain
	beq $a1, -2, askkk
	
	choice:
	beq $a0, 1, rules #choice
	beq $a0, 2, play
	beq $a0, 3, money
	beq $a0, 4, see
	b tryagain	
	
	tryagain: 
	li $v0, 55 #tryagain
	la $a0, error
	la $a1, 0
	syscall
	
	b menuu
	
	rules:
	li $v0, 55 #rules
	la $a0, ruless
	la $a1, 1
	syscall
	
	b menuu	
	
	see:
	lb $t9, gamee
	beqz $t9, none
	li $v0, 59
	la $a0, playercardss
	la $a1, dealercardss
	syscall
	
	b menuu
	
	none:
	li $v0, 55
	la $a0, nonee
	la $a1, 0
	syscall
	b menuu
	
	
	play:
	.text
	start2:
	la $t9, 1
	sb $t9, gamee
	bne $s5, 5, start3
	shuffle:
	la $s5, 0
	li $v0, 55
	la $a0, shuffel
	la $a1, 1
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
	la $v0, 51
	la $a0, bet
	syscall
	beq $a1, -2, menuu
	bgtz, $a1, pleaseee
	la $s4, ($a0)
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
	blt $t6, 1, ask2
	li $v0, 59
	la $a0, playercardss
	la $a1, dealercardss
	syscall
	ask2:
	bgt $t2, 21, bust
	beq $t1, 1, choosed
	blt $t6, 4, start #ask
	li $v0, 54
	la $a0, hit
	la $a1, buff
	la $a2, 2
	syscall
	beq $a1, -3, please
	beq $a1, -4, please
	beqz $a1, decide
	beq $a1, -2, fold
	
	decide:
	lb $a1, buff
	beq $a1, 49, start
	beq $a1, 51, ask
	bne $a1, 50, please
	la $t1, 1
	b start
	
	please:
	li $v0, 55
	la $a0, pleasee
	la $a1, 1
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
	li $v0, 55
	la $a0, foldd
	la $a1, 2
	syscall
	b loosee
	
	bust:
	li $v0, 55
	la $a0, bustt
	la $a1, 1
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
	li $v0, 55
	la $a0, loose
	la $a1, 1
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
	li $v0, 55
	la $a0, bj
	la $a1, 1
	syscall
	win2:
	li $v0, 55
	la $a0, winn
	la $a1, 1
	syscall
	add $t0, $t0, $s4
	b money
	
	pleaseee:
	li $v0, 55
	la $a0, pleaseeee
	la $a1, 0
	syscall
	b start2

	
	money:
	li $v0, 56 #money
	la $a0, moneyy
	la $a1, ($t0)
	syscall
	
	b menuu	
	
	askkk:
	li $v0, 50
	la $a0, cashoutt
	syscall
	bgtz $a0, menuu
	b done
	
	nomore:
	li $v0, 55
	la $a0, nomoree
	la $a1, 0
	syscall
	b done
	
	done:
	li $v0, 55 #done
	la $a0, pleasure
	la $a1, 1
	syscall
	
	li $v0, 56
	la $a0, cashout
	la $a1, ($t0)
	syscall
	
	li $v0, 10
	syscall
