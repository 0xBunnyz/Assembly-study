section .data
    your_name db 'Qual o seu nome? ', 0x0
    namelen equ $-your_name

    your_age db 'Qual sua idade? ', 0x0
    agelen equ $-your_age

    your_sex db 'Qual seu sexo? ', 0x0
    sexlen equ $-your_sex

    your_profission db 'Qual sua profissao? ', 0x0
    profissionlen equ $-your_profission

section .text
    global _start

_start:
    ; Código para ler e imprimir o nome
    mov eax, 0x4 ; Chamada de sistema para escrever na tela = 'write'
    mov ebx, 0x1 ; O descritor de arquivo 1 é a saída padrão = 'stdout'
    mov ecx, your_name ; Armazena o endereço da variável your_name
    mov edx, namelen ; Armazena o tamanho da variável your_name
    int 0x80 ; Interrupção para mostrar a mensagem na tela

    mov eax, 0x3 ; Chamada de sistema para leitura = 'read'
    mov ebx, 0x0 ; O descritor de arquivo 0 é a entrada padrão = 'stdin'
    mov ecx, your_name ; Armazena o endereço da variável your_name
    mov edx, namelen ; Armazena o tamanho máximo da variável your_name em edx
    int 0x80 ; Interrupção para ler o nome

    mov eax, 0x4 ; O código 4 indica a syscall para mostrar um texto na tela = 'write'
    mov ebx, 0x1 ; O descritor de arquivo 1 é a saída padrão = 'stdout'
    mov ecx, your_name ; Armazena o endereço da variável your_name em ecx
    mov edx, namelen ; Armazena o tamanho da variável your_name
    int 0x80 ; Chama a interrupção do sistema para imprimir o nome

    ; ------------------------------------------------------------------
    ; Código para ler e imprimir a idade
    mov eax, 0x4 ; Chamada de sistema para escrever na tela
    mov ebx, 0x1 ; O descritor de arquivo 1 é a saída padrão = 'stdout'
    mov ecx, your_age ; Armazena o endereço da variável your_age
    mov edx, agelen ; Armazena o tamanho da variável your_age
    int 0x80 ; Interrupção para mostrar a mensagem na tela

    mov eax, 0x3 ; Chamada de sistema para leitura = 'read'
    mov ebx, 0x0 ; O descritor de arquivo 0 é a entrada padrão = 'stdin'
    mov ecx, your_age ; Armazena o endereço da variável your_age
    mov edx, agelen ; Armazena o tamanho máximo da variável your_age em edx
    int 0x80 ; Interrupção para ler a idade

    mov eax, 0x4 ; O código 4 indica a syscall para mostrar um texto na tela = 'write'
    mov ebx, 0x1 ; O descritor de arquivo 1 é a saída padrão = 'stdout'
    mov ecx, your_age ; Armazena o endereço da variável your_age em ecx
    mov edx, agelen ; Armazena o tamanho da variável your_age
    int 0x80
	
	; -------------------------------------------------------------------
	; Codigo para sair do programa
	mov eax, 0x1 ; O codigo 1 indica a syscall para terminar o programa = 'exit'
	xor ebx, ebx ; Codigo de retorno 0 = 'sucesso'
	int 0x80 ; Chama a interrupção do sistema para sair do programa