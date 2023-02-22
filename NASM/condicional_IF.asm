segment .data
    ; Tabela de SYSCALL composta por labels para facilitar a programação
    LF equ 0xA ; Line Feed
    NULL equ 0xD ; Final string
    SYS_CALL equ 0x80 ; Envia informação para o sistema operacional

    ; EAX recebe esse valores
    SYS_READ equ 0x3  ; Codigo de operação de leitura
    SYS_WRITE equ 0x4 ; Codigo de operação de escrita
    SYS_EXIT equ 0x1  ; Codigo de chamada para finalizar o programa

    ; EBX recebe esses valores
    RET_EXIT equ 0x0 ; Codigo de retorno de um função: return 0 sem erro;
    STD_IN equ 0x0   ; Valor de entrada padrão do arquivo descritor
    STD_OUT equ 0x1  ; Valor de saida padrão do arquivo descritor
	
section .data
	x dd 50 ; dd = define double word
	y dd 10
	msg db 'X é maior que Y', LF, NULL
	
section .bss
