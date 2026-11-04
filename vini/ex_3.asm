.data
    vetor: .word 10, 20, 30, 40, 50, 60

.text
.globl main

main:
    la   $t0, vetor
    la   $t1, vetor
    addi $t1, $t1, 20
    li   $t2, 3

inverter_loop:
    lw   $t3, 0($t0)
    lw   $t4, 0($t1)
    sw   $t4, 0($t0)
    sw   $t3, 0($t1)
    addi $t0, $t0, 4
    addi $t1, $t1, -4
    addi $t2, $t2, -1
    bnez $t2, inverter_loop

    la   $t0, vetor
    li   $t1, 6

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

    li   $v0, 10
    syscall