; Este programa solicita a idade do usuário e informa se ele é maior ou menor de 18 anos.
; Para compilar e executar o programa no Linux, use os seguintes comandos:
; nasm -f elf64 -o programa.o programa.asm
; ld -s -o programa programa.o
; ./programa

LF equ 0xA ; Line Feed
NULL equ 0xD ; Final string
SYS_CALL equ 0x80 ; Interrupção de sistema

; EAX recebe esses valores
SYS_READ equ 0x3  ; Código de operação de leitura
SYS_WRITE equ 0x4 ; Código de operação de escrita
SYS_EXIT equ 0x1  ; Código de chamada para finalizar o programa

; EBX recebe esses valores
RET_EXIT equ 0x0 ; Código de retorno de uma função: return 0 sem erro;
STD_IN equ 0x0   ; Valor de entrada padrão do arquivo descritor
STD_OUT equ 0x1  ; Valor de saída padrão do arquivo descritor

section .data
    age dd 0 ; Inicializa a variável "age" com 0
    idade db 'Qual sua idade? ', LF, NULL
    idadelen equ $-idade
    
    menordizoito db 'Menor que 18 anos, não pode entrar na festa!', LF, NULL
    menorlen equ $-menordizoito
    
    maiordizoito db 'Maior que 18 anos, pode entrar na festa!', LF, NULL
    maiorlen equ $-maiordizoito

section .bss
    ; Não é necessário criar uma variável na seção .bss para armazenar
    ; a entrada do usuário, pode ser usado um registrador adicional.
    ; input resb 1

section .text
global _start

_start:
    ; Escreve a mensagem perguntando a idade do usuário na tela.
    mov eax, SYS_WRITE ; Código de operação de escrita
    mov ebx, STD_OUT ; Descritor de arquivo para saída padrão
    mov ecx, idade ; Endereço da mensagem "Qual sua idade?"
    mov edx, idadelen ; Tamanho da mensagem
    int SYS_CALL ; Interrupção de sistema para escrever a mensagem na tela
    
    ; Lê a idade digitada pelo usuário.
    mov eax, SYS_READ ; Código de operação de leitura
    mov ebx, STD_IN ; Descritor de arquivo para entrada padrão
    mov ecx, age ; Endereço da variável "age" para armazenar a entrada do usuário.
    mov edx, 4 ; Tamanho máximo da entrada do usuário em bytes (um DWORD).
    int SYS_CALL ; Interrupção de sistema para ler a idade do usuário
    
    ; Converte a idade do usuário para um número inteiro (DWORD).
    mov eax, DWORD[age]
    
    ; Compara a idade do usuário com 18 anos.
    cmp eax, 18
    jge maior_dezoito ; Pula para a mensagem de "maior de
	
	; Se a idade do usuário for menor que 18 anos,
	mov ecx, menordizoito
	mov edx, menorlen
	jmp final
	
	
maior_dezoito:
	mov ecx, maiordizoito
	mov edx, maiorlen
	

final:
	mov eax, SYS_WRITE
	mov ebx, STD_OUT
	int SYS_CALL
	
	mov eax, SYS_EXIT
	xor ebx, ebx
	int SYS_CALL