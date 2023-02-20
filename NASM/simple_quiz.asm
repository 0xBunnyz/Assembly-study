section .data
your_name db 'Qual o seu nome? ', 0x0
namelen db 64

your_age db 'Qual sua idade? ', 0x0
agelen db 4

your_sex db 'Qual seu sexo? ', 0x0
sexlen db 10

your_profission db 'Qual sua profissao? ', 0x0
profissionlen db 64

section .text
    global _start

_start:
    ; Codigo para ler e imprimir o nome
    mov eax, 0x4 ; Chamada de sistema para escrever na tela = 'write'
    mov ecx, your_name ; Armazena o endereço da variavel your_name
    mov ebx, 17 ; Armazena o tamanho da variavel your_name
    int 0x80 ; Interrupção para mostrar a mensagem na tela

    mov eax, 0x3 ; Chamada de sistema para leitura = 'read'
    mov ebx, 0x0 ;  O descritor de arquivo 0 é a entrada padrão = 'stdin'
    mov ecx, 64 ; Armazena o tamanho maximo da variavel your_name em ecx
    int 0x80 ; Interrupção para ler o nome

    mov eax, 0x4 ; O codigo 4 indica a syscall para mostrar um texto na tela = 'write'
    mov ebx, 0x1 ; O descritor de arquivo 1 é a saída padrão = 'stdout'
    mov ecx, your_name ; Armazena o endereço do your_name em ecx
    int 0x80 ; Chama a interrupção do sistema para imprimir o nome

    ; ------------------------------------------------------------------
    ; Codigo para ler e imprimir a idade
    mov eax, 0x4 ; Chamada de sistema para escrever na tela
    mov ecx, your_age ; Armazena o endereço da variavel your_age
    mov ebx, 16 ; Armazena o tamanho da variavel your_age
    int 0x80 ; Interrupção para mostrar a mensagem na tela

    mov eax, 0x3 ; Chamada de sistema para leitura = 'read'
    mov ebx, 0x0 ;  O descritor de arquivo 0 é a entrada padrão = 'stdin'
    mov ecx, 64 ; Armazena o tamanho maximo da variavel your_age em ecx
    int 0x80 ; Interrupção para ler o nome

    mov eax, 0x4 ; O codigo 4 indica a syscall para mostrar um texto na tela = 'write'
    mov ebx, 0x1 ; O descritor de arquivo 1 é a saida padrão = 'stdout'
    mov ecx, your_age ; Armazena o endereço do your_age
    int 0x80 ; Chama a interrupção do sistema para imprimir a idade

    ; -------------------------------------------------------------------
    ;  Codigo para ler e imprimir a sexo
    mov eax, 0x4 ; O codigo 4 indica a syscall para mostrar um texto na tela = 'write'
    mov ecx, your_sex ; Armazena o endereço da variavel your_sex
    mov ebx, 15 ; Armazena o tamanho da variavel your_sex
    int 0x80 ; Chama a interrupção do sistema para imprimir a idade

    mov eax, 0x3 ; Chamada de sistema para leitura = 'read'
    mov ebx, 0x0 ; O descritor de arquivo 0 é a entrada padrão = 'stdin'
    mov ecx, 10 ; Armazena o tamanho maximo da variavel your_sex em ecx
    int 0x80 ; Chama a interrupção do sistema para imprimir a idade

    mov eax, 0x4 ; O codigo 4 indica a syscall para mostrar um texto na tela = 'write'
    mov ebx, 0x1 ; O descritor de arquivo 1 é a saida padrão = 'stdout'
    mov ecx, your_sex ; Armazena o endereço do your_sex
    int 0x80 ; Chama a interrupção do sistema para imprimir o sexo

    ; -------------------------------------------------------------------
    ; Codigo para ler e imprimir a profissão
    mov eax, 0x4 ; O codigo 4 indica a syscall para mostrar um texto na tela = 'write'
    mov ecx, your_profission ; Armazena o endereço da variavel your_profission
    mov ebx, 20 ; Armazena o tamanho da variavel your_profission
    int 0x80 ; Chama a interrupção do sistema para imprimir a idade

    mov eax, 0x3 ; Chamada de sistema para leitura = 'read'
    mov ebx, 0x0 ; O descritor de arquivo 0 é a entrada padrão = 'stdin'
    mov ecx, 64 ; Armazena o tamanho maximo da variavel your_age em ecx
    int 0x80 ; Chama a interrupção do sistema para imprimir a idade

    mov eax, 0x4 ; O codigo 4 indica a syscall para mostrar um texto na tela = 'write'
    mov ebx, 0x1 ; O descritor de arquivo 1 é a saída padrão = 'stdout'
    mov ecx your_profission ; Armazena o endereço do your_profission em ecx
    int 0x80 ; Chama a interrupção do sistema para imprimir a profissão

    ;----------------------------------------------------------------------
    ; Codigo para sair do programa
    mov eax, 0x1 ; O código 1 indica a chamada do sistema para encerrar o programa
    xor ebx, ebx ; Define o código de saída como zero, como se fosse o return 0 do C
    int 0x80 ; Chama a interrupção do sistema para encerrar o programa