.data
	pergunta: .asciiz "Digite uma palavra: "
	palavra: .space 50
	ehpalidromo: .asciiz "Essa palavra é um palíndromo!"
	naopalidromo: .asciiz "Essa palavra não é um palindromo!"
.text	
	#impressão da pergunta
	li $v0, 4
	la $a0, pergunta
	syscall
	
	#leitura da palavra
	li $v0,8
	la $a0, palavra
	la $a1, 50
	syscall
	
	la $t0, palavra
	
	tamanho:
	lb $t1, 0($t0)
	beqz $t1, ok
	addi $t0, $t0, 1
	j tamanho
	
	ok:
		beq $t0, $zero, fim
		subi $t0, $t0, 1
		sb $zero 0($t0)
	fim:
		li $v0, 10		
		syscall
		 	 
	
	la $t0, palavra
	la $t1, palavra
	addi $t2, $t0, 0		#inverte a frase
	
	final:
		lb $t3, 0($t1)
		beqz $t3, saia
		addi $t1, $t1, 1 #soma 1 
		j final
		
	saia: 
		subi $t1, $t1, 1 #seria o j--
		
	troca:
		lb $t3, 0($t1)
		sb $t3, 0($t2)
		addi $t1, $t1, -1
		addi $t2, $t2, 1
		blt $t2, $t0, troca
			
					
		la $a0, palavra		#faz a comparação 
		la $a1, palavra
		jal strcmp		#A execução continua a partir do primeiro comando dentro da função strcmp
			
		strcmp:
			addi $v0, $zero, 0
		comparar:
			lb $t1, 0($a0)
			lb $t2, 0($a1)
			beqz $t1, finalpalavra
			beq $t1, $t2, proxima
			sub $v0, $t1, $t2
			j finalpalavra
			
			proxima:
			addi $a0, $a0, 1
			addi $a1, $a1, 1
			j comparar
			
			finalpalavra:
			jr $ra
			
			beq $v0, $zero, ehpalidromo
			li $v0, 4
			la $a0, naopalidromo
			syscall
			j fim		#ta la no inicio esse fim
			
			#ehpalidromo: 
				#li $v0, 4
				#la $a0, ehpalidromo
				#syscall
				#j fim
			
			#palidromo = palindromo 
			
			
			