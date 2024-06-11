# Dado un vector array que contiene n n?umeros enteros ordenados de menor a mayor y
# un target que es un valor entero, se pide devolver el ?indice de array adonde se encuentra
# target, usando b?usqueda binaria
.text:
la a0, n # array donde voy a guardar
jal ra, fibonacci
# Imprime el resultado.
mv a0, a0
li a7, 1
ecall

# Frena el programa.
li a7, 10
ecall

fibonacci: 
    addi t0 x0 1 
    beq a0 x0 fin
    beq a0 t0 fin
    addi sp sp -16
    sw a0 0(sp)
    sw ra 4(sp)
    addi a0 a0 -1
    
    jal ra fibonacci #fibonacci(n-1)
    
    sw a0 8(sp)
    lw a0 0(sp)
    addi a0 a0 -2
    
    jal ra fibonacci #fib(n-2)
    
    lw ra 4(sp)
    lw a1 8(sp)
    add a0 a1 a0
    addi sp sp 16
    j fin
    
    fin: jr ra
.data:
.equ n, 3