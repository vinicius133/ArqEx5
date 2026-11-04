.data
    matriz: .word 1, 2, 3, 4, 5, 6, 7, 8, 9

.text
.globl main
main:
    la   $t0, matriz

    lw   $t1, 0($t0)
    lw   $t2, 16($t0)
    lw   $t3, 32($t0)

    addu $t4, $t1, $t2
    addu $t4, $t4, $t3

    lw   $t1, 8($t0)
    lw   $t2, 16($t0)
    lw   $t3, 24($t0)

    addu $t5, $t1, $t2
    addu $t5, $t5, $t3

    li   $v0, 1
    move $a0, $t4
    syscall

    li   $v0, 11
    li   $a0, 32
    syscall

    li   $v0, 1
    move $a0, $t5
    syscall



    li   $v0, 10
    syscall