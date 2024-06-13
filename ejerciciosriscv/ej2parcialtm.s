# ej 2 parcial mañana
.text:
lw a0 , n
jal ra , ejercicio2
# Imprime el resultado.
mv a0, a0
li a7, 1
ecall
# Frena el programa.
li a7, 10
ecall
ejercicio2:
    beq a0 , x0 , fin
    addi t0 , x0 , 1
    beq a0 , t0 , fin
    addi sp, sp , -16
    sw a0 , 0(sp)
    sw ra , 4(sp)
    addi a0, a0 ,-1
    jal ra ejercicio2 
    lw a1 , 0(sp)
    lw ra , 4(sp)
    #
    addi t1, x0 , 2
    mul a1 , a0 , t1
    addi a1, a1 , 1
    mv a0 , a1
    #
    addi sp, sp , 16
    jr ra
    fin:
        jr ra
.data:
n: .word 0x4