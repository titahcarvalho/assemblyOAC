.data 
	#omitir
.text 
	.main:
	li $a0, 1 #valor para f
	li $a1, 4 #valor para a
	li $a2, 5 #valor para b
	jal soma
	jal sub
	jal func 
	li $v0, 10		#resolvido, havia colocado no lugar errado
	syscall
	
	soma:
	add $t0, $a1, $a2 #soma a + b
	addi $v0, $t0, 0		#ao inves de usar move, passou o valor de $t0 para $v0
	jr $ra
	#li $v0, 10
	#syscall
	
	sub:
	sub $t1, $a1,$a2 #subtrai a - b
	subi $v1, $t1, 0 
	jr $ra
	#li $v0, 10		#esta com loop infinito
	#syscall
	
	func:
	beq $a0, 1, soma 
	bne $a0, 1, sub 
	
	

	
