.text
.globl main

main:
    # 1. Ler o número inteiro informado pelo usuário (Serviço 5)
    li $v0, 5
    syscall
    move $t0, $v0            # Salva a entrada N em $t0

    # 2. Verificar se N <= 0 (se for <= 0, não é potência de 2)
    blez $t0, nao_potencia

    # 3. Teste lógico bitwise: N AND (N - 1)
    addi $t1, $t0, -1        # $t1 = N - 1
    and  $t2, $t0, $t1        # $t2 = N & (N - 1)

    # 4. Se o resultado for 0, é uma potência de 2
    beq $t2, $zero, e_potencia

nao_potencia:
    li $a0, 0                # Carrega 0 para saída
    j imprimir

e_potencia:
    li $a0, 1                # Carrega 1 para saída

imprimir:
    # Imprimir o resultado (Serviço 1)
    li $v0, 1
    syscall

    # Encerrar o programa (Serviço 10)
    li $v0, 10
    syscall