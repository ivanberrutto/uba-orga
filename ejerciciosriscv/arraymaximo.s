# Dado vector de enteros arreglo y su Longitud, escribir un programa que encuentre el
# valor maximo en arreglo.


.text:			#Comienza la sección de código
la a0, input_array1
la a1, array_length
jal ra, maximo_arreglo
# Imprime el resultado.
mv a0, a0
li a7, 1
ecall

# Frena el programa.
li a7, 10
ecall

maximo_arreglo:
				li t0, 0 # valor donde estoy parado
                li t1, 0x80000000 # maximo guardado, empiezo asi porque es el numero mas chico
				addi  a1, a1, -1
				
		ciclo:  # Comienzo de ciclo 
				bge   zero, a1, fin   # Si i >= largo, sale del ciclo
				lw t0, 0(a0)    # De-referencia la dir,
                bgt t0, t1 , guardar # si el valor actual es mayor estricto al maximo, lo guardo
				addi   a0, a0, 4   # Actualiza la dir. de memoria
				addi  a1, a1, -1    # decrementa el tamanio
				j ciclo           # Vuelve a comenzar el ciclo
		fin:
                mv a0, t1 # guardo el resultado en a0 que es el retorno
				ret
        guardar:
            mv t1, t0
            j ciclo

.data:
.equ array_length, 8
input_array1: .word 0x3  0x1  0x4  0x1 0x5 0x9 0x2 0x6