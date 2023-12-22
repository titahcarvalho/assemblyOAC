.data
	input_inicial: .space 50
	input_limpo: .space 50
	isPali: .asciiz "eh um palíndromo"
	notPali: .asciiz "nao eh um palíndromo"

.text

main:
    la $a0, input_inicial   # solicita a entrada
    li $a1, 50
    li $v0, 8
    syscall

limpar_string: # o código não funcionava corretamente por causa de possíveis '\n' ou '\0', por isso foi necessário fazer essa função
    la $t1, input_limpo
    loop:
        lb $t7, ($a0)
        beq $t7, 0, checkNull   # verifica se é um caractere nulo
        beq $t7, 10, checkPali   # inicia o processo de verificação de palíndromo
        bgt $t7, 47, adiciona_final
        j pula

    adiciona_final:
        sb $t7, ($t1)
        addi $a0, $a0, 1
        addi $t1, $t1, 1
        j loop
       
    pula:
        addi $a0, $a0, 1
        j loop

    checkNull:
        j pula  


checkPali: #2 ponteiros, um que anda da esquerda p/ direita, e outro que ainda da esquerda p/ direita 
    la $t4, input_limpo # se são !=, já retorna falso
    sb $zero, ($a0)
    addi $t1, $t1, -1
    loop3:
        lb $t3, ($t4)
        lb $t2, ($t1)
        beq $t3, $t2, next
        j notPali_saida
        next: jal testLocation
              addi $t4, $t4, 1
              addi $t1, $t1, -1
              j loop3
        j notPali_saida
    testLocation:
        beq $t4, $t1, pali_saida
        addi $t1, $t1, -1
        beq $t4, $t1, pali_saida
        addi $t1, $t1, 1
        jr $ra

pali_saida: #print
    la $a0, isPali
    li $v0, 4
    syscall
    j saida

notPali_saida: #print
    la $a0, notPali
    li $v0, 4
    syscall
    j saida

saida:
    li $v0, 10
    syscall
