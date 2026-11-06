
.data
texto: .asciiz "Arquitetura de Computadores"

.text
.globl main

main:
    # Inicializar os registradores
    la $t0, texto       # Endereço inicial da string
    li $t2, 0           # Contador de vogais = 0

percorrer:
    # Carregar um caractere da memória
    lbu $t1, 0($t0)

    # Verificar se chegou ao final da string
    beq $t1, $zero, fim

    # Verificar vogal A ou a
    li $t3, 65          # Código ASCII de A
    beq $t1, $t3, vogal
    li $t3, 97          # Código ASCII de a
    beq $t1, $t3, vogal

    # Verificar vogal E ou e
    li $t3, 69
    beq $t1, $t3, vogal
    li $t3, 101
    beq $t1, $t3, vogal

    # Verificar vogal I ou i
    li $t3, 73
    beq $t1, $t3, vogal
    li $t3, 105
    beq $t1, $t3, vogal

    # Verificar vogal O ou o
    li $t3, 79
    beq $t1, $t3, vogal
    li $t3, 111
    beq $t1, $t3, vogal

    # Verificar vogal U ou u
    li $t3, 85
    beq $t1, $t3, vogal
    li $t3, 117
    beq $t1, $t3, vogal

    # Se não for vogal, avança
    j proximo

vogal:
    addi $t2, $t2, 1   # Contador = contador + 1

proximo:
    addi $t0, $t0, 1   # Avança um byte na memória
    j percorrer

fim:
    # Imprimir a quantidade de vogais
    move $a0, $t2
    li $v0, 1
    syscall

    # Encerrar o programa
    li $v0, 10
    syscall
