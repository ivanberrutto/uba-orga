# Dado un vector array que contiene n n´umeros enteros ordenados de menor a mayor y
# un target que es un valor entero, se pide devolver el ´indice de array adonde se encuentra
# target, usando b´usqueda binaria
.text:
la a0, input_array # array donde voy a guardar
la a1, target # array que voy a copiar
la a2, array_length
jal ra, busquedabinaria
# Imprime el resultado.
mv a0, a0
li a7, 1
ecall

# Frena el programa.
li a7, 10
ecall

busquedabinaria:
    #addi a2, a2, -1
    li t0, 0 # piso
    addi a2 , a2 , -1 # a2 es el techo
    ciclo:
        bgt t0 , a2 , finalmalo # si el piso es menor igual al techo, no encontre nada
        add t2 , t0 , a2 # sumo el piso con el techo
        addi t1 , zero, 2 # preparo para dividir por dos
        div t1 , t2 , t1 # divido la suma del piso del techo por dos, esta es la pos
        addi t3, zero , 4 # preparo a que valor del array referirme por cuatro
        mul t3, t1 , t3 # consigo que valor tengo que referirme
        add t4, zero, a0 # guardo donde arranca el array
        add a0, a0 , t3
        lw t5 , 0(a0) # consigo el valor guardado en a0
        bgt t5 , a1 , esmayor # si el numero en la posicion es mayor estricto al target
        blt t5 , a1 , esmenor # si el numero en la posicion es mayor estricto al target
        # si llegue aca, es porque es ese valor
        mv a0, t1 #t1 era la pos
        ret
    finalmalo:
        addi a0, zero , -1 # pongo algo que diga que no encontre nada
        ret
    esmayor:
        add a2 , zero , t1  # pongo el techo en el medio 
        add a0, zero, t4 # a0 vuelve al elemento 0
        j ciclo
    esmenor:
        add t0 , zero , t1 # pongo el piso en el medio
        add a0 , zero , t4 # a0 vuelve al elemento 0
        j ciclo

.data:
.equ array_length, 10
.equ target, 13
input_array: .word 1, 3, 5, 7, 9, 11, 13, 15, 17, 19