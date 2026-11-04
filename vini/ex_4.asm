.data
    vetor: .word 15, 8, 42, 19, 7, 42, 31, 12
    digite: .asciiz "Digite um numero inteiro: "

.text
.globl main
main:
    li $v0, 4
    la $a0, digite
    syscall

    li $v0, 5
    syscall
    move $t4, $v0

    la $t0, vetor
    li $t1, 0

loop:
    beq $t1, 8, nao_encontrado

    lw $t3, 0($t0)
    beq $t3, $t4, encontrado

    addiu $t0, $t0, 4
    addiu $t1, $t1, 1
    j loop
encontrado:
    li $v0, 1
    move $a0, $t1
    syscall
    j fim

nao_encontrado:
    li $v0, 1
    li $a0, -1
    syscall

fim:
    li $v0, 10
    syscall