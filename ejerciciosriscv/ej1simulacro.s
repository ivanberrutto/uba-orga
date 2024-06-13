# Dado un vector array que contiene n n?umeros enteros ordenados de menor a mayor y
# un target que es un valor entero, se pide devolver el ?indice de array adonde se encuentra
# target, usando b?usqueda binaria
.text:
lw a0, dato # array donde voy a guardar
lw t0 , mascara1
jal ra, ejercicio1
# Imprime el resultado.
mv a0, a0
li a7, 1
ecall
# Frena el programa.
li a7, 10
ecall

ejercicio1:
    and a0, a0 , t0
    li t0 , 5
    li t2 , 0 # respuesta final
    ciclo:
    addi t0 , t0 , -1
    beq t0 , x0 , fin
    andi t1 , a0 , 0xFF
    andi t1, t1 , 0x1
    beq t1 , zero , espar
    addi t2 , t2 , 1
    srli a0, a0 , 8
    j ciclo
    
    
    espar:
        srli a0, a0 , 8
        j ciclo
    
    
    fin:
        add a0 , x0 , t2
        ret

.data:
.data
mascara1: .word 0x0101F101
dato: .word 0x37A2F011