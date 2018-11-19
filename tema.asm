%include "io.inc"
section .data
    base db "Baza incorecta", 0
    char db "0123456789abcdef"
    nums dd 4
    nums_array dd 612, 1330, 7, 12988
    base_array dd 16, 1, 2, 14
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    
loop1:
    mov ebx, dword [ base_array+4*ecx]
    cmp ebx,16
    jg eticheta
    cmp ebx,2
    jl eticheta
    
    mov eax, dword [ nums_array+4*ecx]
loop2:
    div ebx
    push edx
    xor edx, edx
    cmp eax,0
    jg loop2    
    
    cmp esp, ebp
    jne print
rev:
    NEWLINE
    inc ecx
    cmp ecx, [nums]
    jl loop1
    
    
    xor eax, eax
    ret
    
print:
    pop edx    
    PRINT_CHAR [char+edx]
    cmp ebp, esp
    jne print
    xor edx,edx
    jmp rev
    
    
    
eticheta:
    PRINT_STRING base
    inc ecx
    NEWLINE
    cmp ecx, [nums]
    jl loop1
    ret
    
    