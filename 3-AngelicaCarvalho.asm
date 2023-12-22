.data
	pergunta: .asciiz "Digite uma palavra: "
	palavra: .space 100		#array 
	ehpalindromo: .asciiz "Essa palavra é um palíndromo!"
	naopalindromo: .asciiz "Essa palavra não é um palindromo!"
	buffer: .space 100
.text	
	
main:

	li $v0, 4
	la $a0, pergunta 	#impressão da pergunta
	syscall
	
	
	li $v0,8
	la $a0, palavra		#leitura da palavra escrita pelo usuário, será armazenado no endereço $a0
	la $a1, 100
	syscall
	
	clear: 
	la $t1, buffer
	
	jump:
	addi $a0, $a0, 1
	j rodar
	
	rodar: 
		lb $t5, ($a0)
		beq $t5, 0, nulo
		beq $t5, 10, conferir1
		bgt $t5, 97, addf
		j jump 
		
	addf:
		sb $t5, ($t1)
		addi $a0, $a0,1
		addi $t1, $t1, 1
		j rodar
		
	nulo:
	j jump
	
	
	
	#addi $t0, $a0,0 	#salvar a palavra de $a0 em $t0, ao inves de usar MOve, utiliza o addi 
	
	#sub $t1, $a0, 1		#ponteiro para o último caractere da palavra
	
	
	conferir1: 
		sb $zero, ($a0)
		lb $t2, 0($t0)
		lb $t3, 0($t1)
		bne $t2, $t3, passa
		j negativo
			passa: jal teste
			addi $t4, $t4, 1
			addi $t1, $t1, -1
			j conferir1
		j negativo
		teste:
		beq $t4, $t1, positivo
		addi $t1, $t1, -1
		beq $t4, $t1, positivo
		addi $t1, $t1, 1
		#subi $t1, $t1, 1		#conferindo se o primeiro e ultimo caracter são iguais
		#bgez $t1, conferir
		jr $ra
		
	palindromoSaidas:
	
	positivo:
		li $v0,4
		la $a0, ehpalindromo
		syscall
		j fimprograma
	negativo:
		li $v0, 4
		la $a0, naopalindromo
		syscall
		j fimprograma
		
		fimprograma:
		li $v0, 10
		syscall