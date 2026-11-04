.data
    vetor: .word 10, 20, 30, 40, 50, 60

.text
.globl main

#t1 - índice
#t0 - é o endereço base do vetor
#t2 - tem o offset
#t3 tem o elemento atual

main:
    li $t1, 6

    la $t0, vetor
    sll $t2, $t1, 2
    addu $t0, $t0, $t2

    lw $t3, 0($t0)


#degub         
debug_loop:
    lw   $a0, 0($t0)      
    li   $v0, 1           
    syscall

    li   $a0, 32          
    li   $v0, 11          
    syscall
    addi $t0, $t0, 4     
    addi $t1, $t1, -1     
    bnez $t1, debug_loop  
