section .text
    global _str_length

_str_length:
    xor rax, rax
    
    @_str_length_loop:
        cmp byte[rdi + rax], 0
        jz  ._str_length_end
        inc rax
        jmp @_str_length_loop

    ._str_length_end:
        ret

section .data
    _stop db '\x00'