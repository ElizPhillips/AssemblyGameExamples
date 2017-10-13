#Credit to Daylin Ettles and Johny Do
.text
 li $a0, 1
  li $a1, 100 #1000 is 1sec
  li $a2, 1
  li $a3, 127
  la $v0, 31
  syscall
  start:
  li $a0, 90
  li $a1, 500 #1000 is 1sec
  li $a2, 1
  li $a3, 50
  la $v0, 33
  syscall
  li $a0, 100
  li $a1, 500 #1000 is 1sec
  li $a2, 1
  li $a3, 50
  la $v0, 33
  syscall
  li $a0, 90
  li $a1, 500 #1000 is 1sec
  li $a2, 1
  li $a3, 50
  la $v0, 33
  syscall 
  j start