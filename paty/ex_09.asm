
.data
vetor: .byte 10, 20, 10, 30, 10, 40, 20, 50, 10, 60

.text
.globl main

main:
    # Ler o valor informado pelo usuario
    li $v0, 5
    syscall
    move $s0, $v0       # Valor que queremos procurar

    # Inicializar os registradores
    la $t0, vetor       # Endereco inicial do vetor
    li $t1, 0           # Contador de ocorrencias
    li $t2, 0           # Indice do vetor

percorrer:
    # Verificar se ja percorreu os 10 elementos
    bge $t2, 10, fim

    # Carregar elemento do vetor
    lbu $t3, 0($t0)

    # Comparar elemento com o valor informado
    beq $t3, $s0, encontrado

proximo:
    # Avancar para o proximo elemento
    addi $t0, $t0, 1
    addi $t2, $t2, 1
    j percorrer

encontrado:
    # Incrementar contador de ocorrencias
    addi $t1, $t1, 1
    j proximo

fim:
    # Imprimir quantidade de ocorrencias
    move $a0, $t1
    li $v0, 1
    syscall

    # Encerrar programa
    li $v0, 10
    syscall
