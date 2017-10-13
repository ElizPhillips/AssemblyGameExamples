.data
	welcome: .asciiz "Here is an example of a menu.\n"
	menu_prompt: .asciiz "Menu:\nFor the rules and how to play, enter 1\nTo play, enter 2\n"
	rules_desc: .asciiz "How to play:\n-This is a pointless game, so there are no rules!\n To go back to the menu, enter 1\n To start the game, enter 2"
	game_start: .asciiz "Welcome to the pointless game!\n"
	prompt_num: .asciiz "\nEnter a number: "
	farewell: .asciiz "\n Thank you so much for playing"
	num1: .space 2
	num2: .space 2
	answer: .space 2
	
.text
	li $v0, 4
	la $a0, welcome
	syscall
	
	menu:
	li $v0, 4
	la $a0, menu_prompt
	syscall
	
	li $v0, 5
	syscall
	la $t0, ($v0)
	beq $t0, 1, rules
	beq $t0, 2, play
	
	
	rules:
	li $v0, 4
	la $a0, rules_desc
	syscall
	
	li $v0, 5
	syscall
	la $t0, ($v0)
	beq $t0, 1, rules
	beq $t0, 2, play
	
	
	play:
	li $v0, 4
	la $a0, game_start
	syscall
	li $v0, 4
	la $a0, prompt_num
	syscall
	
	li $v0, 5
	syscall
	la $t0, ($v0)
	li $v0, 4
	la $a0, prompt_num
	syscall
	li $v0, 5
	syscall
	la $t1, ($v0)
	add $t2, $t1, $t0
	
	beq $t0, 1, rules
	beq $t0, 2, play
	
	
	
	completed_game:
	li $v0, 4
	la $a0, farewell
	syscall
	
	li $v0, 10
	syscall