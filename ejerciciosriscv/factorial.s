.text:
lw a0, n
jal ra, fact
# Imprime el resultado.
mv a0, a0
li a7, 1
ecall

# Frena el programa.
li a7, 10
ecall

fact: 
beq a0 x0 fin
addi sp sp -16
sw a0 0(sp)
sw ra 4(sp)
addi a0 a0 -1
jal ra fact
lw a1 0(sp)
mul a0 a0 a1
lw ra 4(sp)
addi sp sp 16
jr ra 

fin:
addi a0 x0 1
jr ra

.data:
n: .word 3



