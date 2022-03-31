.data

str_ingresar:             .asciiz "Ingresar dos numeros: \n"
str_imprimirSum:          .asciiz "\nLa suma es: "
str_imprimirDif:          .asciiz "\nLa diferencia es: "
str_imprimirMulti:        .asciiz "\nLa multiplicacion es: "
str_imprimirDiv:          .asciiz "\nLa division es: "
str_imprimirProm:         .asciiz "\nEl promedio es: "


.text
main:

# Ingresar texto por teclado
la $a0, str_ingresar 
li $v0, 4           
syscall

# Lee el primer numero
li $v0, 5  
syscall
add $t0, $v0, $zero 

# Lee el segundo numero
li $v0, 5   
syscall
add $t1, $v0, $zero  

#  Apuntamos a la cadena str imprimirSum
la $a0, str_imprimirSum 
li $v0, 4               
syscall

# Realizamos la operacion
add $a0, $t0, $t1      
li $v0, 1              
syscall


#  Apuntamos a la cadena str imprimirDif
la $a0, str_imprimirDif 
li $v0, 4                
syscall

# Realizamos la operacion
sub $a0, $t0, $t1       
li $v0, 1              
syscall

#  Apuntamos a la cadena str imprimirMulti
la $a0, str_imprimirMulti  
li $v0, 4              
syscall

# Realizamos la operacion
mul $a0, $t0, $t1          
li $v0, 1                 
syscall


#  Apuntamos a la cadena str imprimirDiv
la $a0, str_imprimirDiv     
li $v0, 4                   
syscall

# Realizamos la operacion
mtc1 $t0, $f0               # convertimos t0 a flotante y lo almacenamos en f0
cvt.s.w $f0, $f0
mtc1 $t1, $f1               # convertimos t1 a flotante y lo almacenamos en f1
cvt.s.w $f1, $f1

div.s $f12, $f0, $f1        # guardamos en f12 la division entre f0 y f1
li $v0, 2                   
syscall


#  Apuntamos a la cadena str imprimirProm
la $a0, str_imprimirProm    
li $v0, 4                   
syscall

#Comvertimos a flotante
add $s0, $t0, $t1      
mtc1 $s0, $f3          # convierte a flotante el s0 y se almacena en $f3
cvt.s.w $f3, $f3

#Realizamos la operacion
li.s $f2, 2.0          # en f2 guardo 2, el cual es la cantidad de numeros a promediar
div.s $f12, $f3, $f2   # divido la suma que ya esta convertida en flotante con la cant numeros(lo ya almacenado)
li $v0, 2                              
syscall

jr $ra
