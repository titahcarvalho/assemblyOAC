.data
    prompt: .asciiz "\nDigite o primeiro n�mero: "
    prompt2: .asciiz "\nDigite o segundo n�mero: "
    resultado: .asciiz "\nResultado: "

.text
    main:
        
        li $v0, 4
        la $a0, prompt		# solicitar o primeiro n�mero
        syscall

        li $v0, 5
        syscall
        addi $s0, $v0, 0

        
        li $v0, 4
        la $a0, prompt2
        syscall

        li $v0, 5
        syscall
        addi $s1, $v0, 0

       
        add $s2, $s0, $s1	 #adi��o

        li $v0, 4
        la $a0, resultado
        syscall

        li $v0, 1
        addi $a0, $s2,0
        syscall

        
        mul $s3, $s0, $s1	#multiplica
        
        li $v0, 4
        la $a0, resultado
        syscall

        li $v0, 1
        addi $a0, $s3, 0
        syscall

       
        sub $s4, $s0, $s1	 #subtra��o

       
        li $v0, 4
        la $a0, resultado
        syscall

        li $v0, 1
        addi $a0, $s4,0
        syscall

        div $s5, $s0, $s1	#divis�o
        
        li $v0, 4
        la $a0, resultado	# vai exibir o resultado da divis�o
        syscall

        li $v0, 1
        addi $a0, $s5, 0
        syscall

        li $v0, 10  # Saida do programa
        syscall


