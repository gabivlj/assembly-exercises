
default rel 

section .data
  _separators: db ' ', '-', '.', ',', 0

section .text
global _count_words

;; checks if the passed character to rdi is included in the array of _separators
_is_included:
  push r14
  push r15
  xor r14, r14
  mov r9, _separators
  xor r15, r15
  @looping:
    mov al, [r9+r15]
    cmp rax,  rdi
    je  @included
    inc r15
    mov rax, 0
    cmp al, byte[r9+r15]
    jne @looping

;; if loop finishes, it is not included
  xor rax, rax
  pop r15
  pop r14
  ret
  
  @included:
    pop r15
    pop r14
    mov rax, 1
    ret

_count_words:  
  ;; rdi => char* (string)
  ;; Initialize separators (Just in case)
  mov r9, _separators
  mov [r9],   byte ' '
  mov [r9+1], byte '-'
  mov [r9+2], byte '.'
  mov [r9+3], byte ','
  mov [r9+4], byte 0  
  xor r10, r10 
  push r12 
  push r13
  ;; previous_character_was_separator = true
  mov r12, 1  
  xor r13, r13;; count  
  @loop:    
    xor rax, rax
    ;; get current character
    mov al, byte[rdi+r10]
    ;; push rdi because we are gonna pass another rdi to the function
    push rdi
    ;; pass to the function the current character
    mov rdi, rax
    call _is_included
    pop rdi
    ;; the function puts rax to 1 if the character is a separator
    cmp rax, 1
    je @dont_increment
    ;; If previous character was a separator and current character is not, increment
    cmp r12, 1
    jne @dont_increment
    inc r13
  @dont_increment:
    ;; update previous_character_was_a_separator
    mov r12, rax    
    ;; move index
    inc r10
    ;; check if it is end of string
    mov rax, 0
    cmp al, byte[rdi+r10]
    jne @loop

  @end:
    mov rax, r13
    pop r13
    pop r12
    ret    
