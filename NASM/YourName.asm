section .data
msg db 'Qual o seu nome? ', 0x0
nome db 64

section .text
    global _start

_start:
    ; existe um padrão de código em assembly
    ; mov eax, syscall que desejamos
    ; mov ecx, endereço de alguma variavel
    ; mov edx, tamanho de uma variavel 
    ; int 0x80 interrupção do sistema para fazer a operação

    mov eax, 4 ; O codigo 4 indica a syscall para mostrar um texto na tela
    mov ecx, msg ; Armazena o endereço de msg em ecx
    mov edx, 17 ; Armazena o tamanho da msg em edx
    int 0x80 ; Chama a interrupção do sistema para imprimir a messagem

    ; Lê o nome da pessoa 
    mov eax, 3 ; O codigo 3 indica a chamada do sistema para leitura
    mov ebx, 0 ; O descritor de arquivo 0 é a entrada padrão
    mov ecx, 64 ; Armazena o tamanho maximo do nome em ecx
    int 0x80 ; Chama a interrupção do sistema para ler o nome 

    ; Imprime o nome
    mov eax, 4 ; O codigo 4 indica a syscall para mostrar um texto na tela
    mov ebx, 1 ; O descritor de arquivo 1 é a saída padrão
    mov ecx, nome ; Armazena o endereço do nome em ecx
    int 0x80 ; Chama a interrupção do sistema para imprimir o nome

    ; Encerra o programa
    mov eax, 1 ; O código 1 indica a chamada do sistema para encerrar o programa
    xor ebx, ebx ; Define o código de saída como zero
    int 0x80 ; Chama a interrupção do sistema para encerrar o programa

