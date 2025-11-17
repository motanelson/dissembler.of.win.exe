.section .bss
    .align 4           # Alinhamento de 4 bytes
variavel_16k:
    .space 16384       # Reserva 16KB no segmento BSS

.section .text
    .globl _start

_start:
    # Acesso à variável
    la a0, variavel_16k    # Endereço base
    
    # Exemplo: inicializar a memória com zeros
    li t0, 0              # Valor zero
    li t1, 4096           # Contador (16384 bytes / 4 bytes por palavra)
    mv t2, a0             # Ponteiro atual
    
loop_inicializacao:
    sw t0, 0(t2)          # Armazena zero
    addi t2, t2, 4        # Próxima palavra
    addi t1, t1, -1       # Decrementa contador
    bnez t1, loop_inicializacao
    
    # Fim do programa
    li a7, 93
    li a0, 0
    ecall
