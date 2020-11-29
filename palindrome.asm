section .text
    global _palindrome

_palindrome:
    xor     rax, rax    ;; clear whole rax register =>  (max iterations)
    xor     rbx, rbx    ;; clear whole rbx register =>  (index)
    mov     eax, rsi    ;; Dividend =>  move string length to eax 32-bit register
    mov     ecx, 2      ;; Divisor =>   divide the string length by 2 in 32-bit integer division
    div     ecx         ;; divide and store Quotioent in eax

    @_palindrome_loop:
        cmp byte[rdi + rbx], byte[rdi + rsi - rbx - 1]
        jne .palindrome_end
        inc rbx
        cmp rbx, rax
        je ._palindrome_end
        jmp @_palindrome_loop

    .palindrome_end:
    ret