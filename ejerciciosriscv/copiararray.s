#Copiar un array en otro

# sea dos arrays s y q tal que las direcciones de inicio vienen en 
# a0 y a1 correspondientemente, tambien un size que indica el tamanio 
# de los vectores que viene en a2
# quiero copiar la informacion de q a s

.text:			#Comienza la sección de código


copiar_arreglos:
				# a0 = int s[], a1 = int q[],   a2 = int largo,
				la a0, input_array1
				la a1, input_array2
				la a2, array_length
				li t0, 0
				addi  a2, a2, -1
				
		ciclo:  # Comienzo de ciclo 
				bge   zero, a2, fin   # Si i >= largo, sale del ciclo
				lw t0, 0(a1)    # De-referencia la dir,
				sw t0, 0(a0)    # guarda el valor en a0
				addi   a0, a0, 4   # Actualiza la dir. de memoria
				addi   a1, a1, 4   # Actualiza la dir. de memoria
				addi  a2, a2, -1    # decrementa el tamanio
				j ciclo           # Vuelve a comenzar el ciclo
		fin:
				ret

.data:
.equ array_length, 4 
input_array2: .word 0x12345678  0x11111111  0x8  0x1
input_array1: .word 0x00000000  0x00000000  0x00000000  0x00000000  