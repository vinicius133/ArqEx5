.data
    vetor: .word 12, 25, 8, 17, 30, 14, 9, 21

.text
.globl main

main:
    la $t0, vetor
    li $t1, 0
    li $t2, 8
    li $t3, 0

loop:
    beq $t1, $t2, fim
    lw $t4, 0($t0)
    addu $t3, $t3, $t4
    addiu $t0, $t0, 4
    addiu $t1, $t1, 1
    j loop

fim:
    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall