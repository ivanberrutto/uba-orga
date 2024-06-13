# ej 1 parcial mañana
.text:
lw s0 , entrada
jal ra , ejercicio1
# Imprime el resultado.
mv a0, a0
li a7, 1
ecall
# Frena el programa.
li a7, 10
ecall
#s0 : 0x90 , 0x1a , 0x00 , 0x02
ejercicio1:
    li a0, 0
    srli t0, s0 , 24
    add a0, a0, t0
    srli t0 , s0 , 16
    andi t0 , t0 , 0x000000FF
    add a0, a0 , t0
    srli t0 , s0 , 8
    andi t0 , t0 , 0x000000FF
    add a0, a0 , t0
    mv t0 , s0
    andi t0 , t0 , 0x000000FF
    add a0, a0 , t0
    ret

.data:
entrada: .byte 0x90 , 0x1A , 0x00 , 0x02