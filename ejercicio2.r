.data 	
cantidad: .asciiz "\nIngrese la cantidad de numeros:"
num: .asciiz "\nIngrese un numero: "
suma: .asciiz "\nLa suma es: "
prom: .asciiz "\nEl promedio es: "
may: .asciiz "\nEl mayor es: "
men: .asciiz "\nEl menor es: "
.text 
main: 
	
	#Imprimir el texto de cantidad de números
	la $a0, cantidad 	
	li $v0, 4 				
	syscall 
	
	#Leemos un entero, el número estará en el registro v0
	li $v0, 5
	syscall 
	add $t2, $v0, $zero
	
	#Imprimimos el número que es la cantidad de iteraciones
		#Pasamos el número del registro t2 a a0
		# t2 es en el número de iteraciones
	move $a0, $t2
	li $v0, 1
	syscall
	
	li $t0, 0	#acumulado
	li $t1, 0   #índice
	li.s $f0, 0.0	#promedio
	li $t4, 0	#número actual
	li $t7, 0	#mayor
	li $t6, 0	#menor
	Loop:
		beq $t2,$t1, Exit 
		
		
		#Imprimir el texto del número
		la $a0, num
		li $v0, 4 
		syscall
		
		#Ingresar el número
		li $v0, 5
		syscall
		add $t0, $t0, $v0
		move $t4, $v0
		
		#Imprimir el número
		move $a0, $v0
		li $v0, 1
		syscall
		
		#iniciar los valores de mayor y menor en el primer valor escrito
		#blez: menor o igual que 0
		blez  $t6, IF
		
		ELSE:
			j FIN		
		IF:
			add $t7, $t4, $zero
			add $t6, $t4, $zero
		FIN:
		
			#mayor que 
			bge $t4, $t7, label_if
			
			label_else:
				j label_end
				
			label_if:
				move $t7, $t4
				
			label_end:
			
				ble $t4, $t6, LABEL_IF
				
				LABEL_ELSE:
					j LABEL_END
				LABEL_IF:
					move $t6, $t4
				LABEL_END:
					add $t1, $t1, 1   # i++	a
			
		j Loop
	Exit:	
		#Imprimir el texto de la suma
		la $a0, suma
		li $v0, 4 
		syscall
		
		move $a0, $t0
		li $v0, 1 					
		syscall
		
		#Imprimir el texto del promedio
		la $a0, prom
		li $v0, 4
		syscall
		
		#Instancia de los floats para la división
		li.s $f1, 0.0
		li.s $f2, 0.0
		
		#Conversión de int to float del promedio
		mtc1 $t0, $f1
		cvt.s.w $f1, $f1
		
		#Conversión de int to float del número de iteraciones
		mtc1 $t2, $f2
		cvt.s.w $f2, $f2
		
		div.s $f0, $f1, $f2	
		#Imprimir el promedio
		mov.s $f12, $f0
		li $v0, 2
		syscall
		
		#Imprimir el texto de mayor
		la $a0, may
		li $v0, 4
		syscall
		
		move $a0, $t7
		li $v0, 1
		syscall
		
		#Imprimir el texto de menor
		la $a0, men
		li $v0, 4
		syscall
		
		move $a0, $t6
		li $v0, 1
		syscall
		
jr $ra