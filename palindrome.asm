section .text
    global _palindrome

_palindrome:
    xor     rcx, rcx    ;; clear whole rax register =>  (i)
    xor     rbx, rbx    ;; clear whole rbx register =>  (j)
    mov     rbx, rsi    ;; store length of array

    @_palindrome_loop:
        mov     dl, byte[rdi + rbx - 1]
        cmp     byte[rdi + rcx], dl
        jne     .is_not_palindrome
        inc     rcx
        dec     rbx
        cmp     rcx, rbx
        jle     @_palindrome_loop
        jmp     .is_palindrome

    .is_palindrome:
        mov     rax, 1
        jmp     .palindrome_end

    .is_not_palindrome:
        mov     rax, 0
        jmp     .palindrome_end

    .palindrome_end:
        ret