
default rel 

section .data
  _separators: db 0, 0, 0, 0, 0

section .text
global _count_words

_is_included:
  xor r14, r14
  mov r9, _separators
  mov [r9],   byte ' '
  mov [r9+1], byte '-'
  mov [r9+2], byte '.'
  mov [r9+3], byte ','
  mov [r9+4], byte 0  
  xor r15, r15
  @looping:
    mov al, [r9+r15]
    cmp rax,  rdi
    je  @included
    inc r15
    mov rax, 0
    cmp al, byte[r9+r15]
    je  @not_included
    jmp @looping

  @not_included:
    xor rax, rax
    ret
  @included:
    mov rax, 1
    ret

_count_words:  
  ;; rdi => char* (string)
  xor r10, r10 ;; idx
  mov r12, 1 ;; last character
  xor r13, r13;; count  
  @loop:
    xor rax, rax
    mov al, byte[rdi+r10]
    push rdi
    mov rdi, rax
    call _is_included
    pop rdi
    cmp rax, 1
    je @dont_increment
    cmp r12, 1
    jne @dont_increment
    inc r13
  @dont_increment:
    mov r12, rax    
    inc r10
    mov rax, 0
    cmp al, byte[rdi+r10]
    jne @loop

  @end:
    mov rax, r13
    ret    
