.data
    vetor: .word 10, -5, 8, -12, 0, -3, 15, -1, 7, -9

.text
.globl main

main:
    la $t0, vetor
    li $t1, 0
    li $t2, 10
    li $t3, 0

loop:
    beq $t1, $t2, fim
    lw $t4, 0($t0)
    bge $t4, $zero, proximo
    addiu $t3, $t3, 1

proximo:
    addiu $t0, $t0, 4
    addiu $t1, $t1, 1
    j loop

fim:
    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall