#Implemente un programa que solicite un numero N, luego este debe
#mostrar que numeros desde 1 a 20, son multiplos de N.

.data
str_in: 	 .asciiz "Ingrese un numero:\n"
str_el_numero:	 .asciiz "\nEl numero "
str_si:		 .asciiz " SI "
str_no:		 .asciiz " no "
str_es_multiplo_de: .asciiz "es multiplo de "

.text

main:
	#print "Ingrese un numero"
	la $a0, str_in
	li $v0, 4
	syscall

	#t0 = input
	li $v0, 5
	syscall
	add $t0, $v0, $zero

	#t1 = i = 1
	li $t1, 1

	#t2 = stop = 21
	li $t2, 21

	while:
		#while t1 != t2
		beq $t1, $t2, endWhile

		# t3 = i % input
		div $t1, $t0
		mfhi $t3

		#print "El numero "
        	la $a0, str_el_numero
        	li $v0, 4
        	syscall

		#print i
		move $a0, $t1
		li $v0, 1
		syscall

		#if (t3==0) {print si}; else {print no}
		bne $t3, $zero, else
		if:
			#print " si"
			la $a0, str_si
			li $v0, 4
			syscall

			j endIf
		else:
			#print " no"
			la $a0, str_no
			li $v0, 4
			syscall

		endIf:
			#print " es multiplo de "
			la $a0, str_es_multiplo_de
			li $v0, 4
			syscall

			#print input
			move $a0, $t0
			li $v0, 1
			syscall

		#i++
		addi $t1, $t1, 1
		j while

	endWhile:

	#return
	li $v0, 10
	syscall
