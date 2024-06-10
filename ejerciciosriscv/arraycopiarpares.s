# Sean dos vectores s y q tal que las direcciones de inicio vienen en a0 y a1 respectivamente,
# adem´as se cuenta con a2 que contiene el tama˜no de s y q. Se pide copiar los elementos
# pares de q a s y si no 0.

.text:
la a0, input_array1
la a1, input_array2
la a2, array_length
jal ra, copiarpares
# Imprime el resultado.
mv a0, a0
li a7, 1
ecall

# Frena el programa.
li a7, 10
ecall

copiarpares:
    addi a2, a2, -1
    
    ciclo:
        bge zero , a2 , fin
        lw t0, 0(a1)    # De-referencia la dir,
		addi   a0, a0, 4   # Actualiza la dir. de memoria
		addi   a1, a1, 4   # Actualiza la dir. de memoria
		addi  a2, a2, -1    # decrementa el tamanio

        addi t1 , zero , 1 #preparo la mascara 0x1
        and t1, t0 , t1
        beq t1, zero, espar
        sw zero, 0(a0)
		j ciclo           # Vuelve a comenzar el ciclo
    fin:
        ret
    espar:
        sw t0, 0(a0)
        j ciclo

.data:
.equ array_length, 4 
input_array2: .word 0x12345678  0x11111111  0x8  0x1
input_array1: .word 0x00000000  0x00000000  0x00000000  0x00000000  