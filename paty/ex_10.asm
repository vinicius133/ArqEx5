.data
vetor: .space 20

.text
.globl main

main:
    # Inicializar endereco do vetor e contador
    la $t0, vetor
    li $t1, 0

leitura:
    # Ler um numero inteiro
    li $v0, 5
    syscall

    # Armazenar o numero no vetor
    sw $v0, 0($t0)

    # Avancar para a proxima posicao
    addi $t0, $t0, 4
    addi $t1, $t1, 1

    # Verificar se ja leu os cinco numeros
    blt $t1, 5, leitura

    # Passar o endereco do vetor como argumento
    la $a0, vetor

    # Chamar o procedimento maximo
    jal maximo

    # Imprimir o valor retornado em $v0
    move $a0, $v0
    li $v0, 1
    syscall

    # Encerrar o programa
    li $v0, 10
    syscall


# --------------------------------
# PROCEDIMENTO: maximo
# Recebe: endereco do vetor em $a0
# Retorna: maior valor em $v0
# --------------------------------

maximo:
    # Inicializar o maior com o primeiro elemento
    lw $t0, 0($a0)

    # Comecar pelo segundo elemento
    li $t1, 1

comparar:
    # Verificar se ja percorreu os cinco elementos
    bge $t1, 5, retornar

    # Calcular o endereco do elemento atual
    sll $t2, $t1, 2
    add $t3, $a0, $t2

    # Carregar o elemento
    lw $t4, 0($t3)

    # Comparar com o maior valor atual
    ble $t4, $t0, proximo

    # Se for maior, atualizar o maior
    move $t0, $t4

proximo:
    # Avancar para o proximo indice
    addi $t1, $t1, 1
    j comparar

retornar:
    # Colocar o maior valor em $v0
    move $v0, $t0

    # Retornar ao programa principal
    jr $ra
