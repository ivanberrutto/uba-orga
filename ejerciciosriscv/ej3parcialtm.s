# ej 3 parcial mañana
.text:
la a0 , notas
lw a2, largo
jal ra , ejercicio3
# Imprime el resultado.
mv a0, a0
li a7, 1
ecall
# Frena el programa.
li a7, 10
ecall

ejercicio3:
    addi t4, x0, 2
    div t3 , a2 , t4
    addi t2 , x0 , 1
    ciclo:
    addi t1 , x0 , 0XA0
    beq a2 , x0 , fin
    lb t0 , 0(a0)
    addi a0 , a0 , -1
    addi a2, a2 , -1
    bge t0 , t1, aprobar
    j ciclo
    
    aprobar:
        addi t2 , t2 , 1
        j ciclo
    
    fin:
        add t5 , t2, t3
        li t6, 0x80000000 
        and t5 , t5 , t6
        bnez t4, negative
        addi a0, x0, 1
        ret
    negative:
        addi a0, x0 , 0
        ret
    
.data:
largo: .word 0x4
notas: .word 0x00000000  0x00000000  0x00000000  0x00000000