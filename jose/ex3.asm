.data
    vetor: .word 35, 12, 48, 7, 23, 19

.text
.globl main

main:
    la $s0, vetor
    li $s1, 6
    li $t0, 0

loop_externo:
    subu $t8, $s1, 1
    bge $t0, $t8, imprime_vetor

    move $t2, $t0
    addiu $t1, $t0, 1

loop_interno:
    bge $t1, $s1, troca

    sll $t3, $t1, 2
    addu $t3, $s0, $t3
    lw $t4, 0($t3)

    sll $t5, $t2, 2
    addu $t5, $s0, $t5
    lw $t6, 0($t5)

    bge $t4, $t6, proximo_interno
    move $t2, $t1

proximo_interno:
    addiu $t1, $t1, 1
    j loop_interno

troca:
    sll $t3, $t0, 2
    addu $t3, $s0, $t3
    lw $t4, 0($t3)

    sll $t5, $t2, 2
    addu $t5, $s0, $t5
    lw $t6, 0($t5)

    sw $t6, 0($t3)
    sw $t4, 0($t5)

    addiu $t0, $t0, 1
    j loop_externo

imprime_vetor:
    li $t0, 0

loop_impressao:
    bge $t0, $s1, fim

    sll $t3, $t0, 2
    addu $t3, $s0, $t3
    lw $a0, 0($t3)

    li $v0, 1
    syscall

    li $v0, 11
    li $a0, 32
    syscall

    addiu $t0, $t0, 1
    j loop_impressao

fim:
    li $v0, 10
    syscall