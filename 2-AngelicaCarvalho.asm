.data 
	vetor: .word 6,9,2,3,8,1,0,7
.text	
	#int k, j, aux;
	#int vetor[8] = {6, 9, 2, 3, 8, 1, 0 , 7};
	li $a0, 1  #k   #testar com 7
	li $a1, 0  #j
	li $a2, 0  #aux
	addi $t0, $zero 0
	addi $t1, $zero 8  #n
	la $s1, vetor
	
	#for (k = 1; k < n; k++) n=numero total de inteiros no vetor(?)
	while1:
		blt $a0, $t1 , saida  #se  k < n less than 
		addi $a0,$a0, 1  #k++
		j while1     
		
		saida:
			li $a1, 0  #j
			#for (j = 0; j < (n - k); j++)
			while2: 
				sub $s2, $t1,$a0
				blt $a1, $s2 , saia  #se  j < (n - k) less than 
				addi $a1,$a1, 1  #j++
				j while2    
			
			saia: 
				#if (vetor[j] > vetor[j + 1])
				la $s1, vetor
				lw $s3, 0($s1)	#vetor [j]
				lw $s4, 4($s1) #vetor [j + 1]
				addi $s3,$s3, 1  #ainda não entendi essa parte 
				sw $s3, 0($s1)
				
				bgt $s3,$s4, troca
				
				j saida
				
				troca:
					#aux = vetor[j];
					#vetor[j] = vetor[j + 1];
					#vetor[j + 1] = aux;
					
					sw $s4, 0($s1)
					sw $s3, 4($s1)
					sw $a2, 8($s3)					
				
				
				
				
				

	