.data 	
pri: .asciiz "\nIngrese el primer lado del triangulo es: "
seg: .asciiz "\nIngrese el segundo lado del triangulo es: "
ter: .asciiz "\nIngrese el tercer lado del triangulo es: "
valido: .asciiz "\nEl triangulo es valido"
nvalido: .asciiz "\nEl triangulo NO es valido"
.text 
main: 
# ------------Primer Número------------
	#Imprimir el primer texto
	la $a0, pri 	
	li $v0, 4 				
	syscall 
	
	#Leemos el primer numero
	li $v0, 5
	syscall 
	move $t1, $v0
	
	#Imprimimos el primer numero
	move $a0, $t1
	li $v0, 1
	syscall

# ------------Segundo Número------------
	#Imprimir el segundo texto
	la $a0, seg 	
	li $v0, 4 				
	syscall 
	
	#Leemos el segundo numero
	li $v0, 5
	syscall 
	move $t2, $v0
	
	#Imprimimos el segundo numero
	move $a0, $t2
	li $v0, 1
	syscall
	
# ------------Tercer Número------------
	#Imprimir el tercer texto
	la $a0, ter 	
	li $v0, 4 				
	syscall 
	
	#Leemos el tercer numero
	li $v0, 5
	syscall 
	move $t3, $v0
	
	#Imprimimos el tercer numero
	move $a0, $t3
	li $v0, 1
	syscall
	
	add $t0, $t1, $t2
	
# ------------Comparaciones------------
	bgt $t0, $t3, IF
	
	ELSE:
		la $a0, nvalido
		b END
	IF:
		li $t0, 0
		add $t0, $t1, $t3
		
		bgt $t0, $t2, LABEL_IF
		
		LABEL_ELSE:
			la $a0, nvalido
			b END
		
		LABEL_IF:
			li $t0, 0
			add $t0, $t2, $t3
			
			bgt $t0, $t1, l_if
			
			l_else:
				la $a0, nvalido
				b END
			l_if:
				la $a0, valido
	END:
		li $v0, 4
		syscall
	
jr $ra