//Try2 pentru functie nr perfect
.data
   x:       .long 7
   str:     .asciz "Numarul %d %s perfect\n"
   c1:     .asciz "este"
   c2:     .asciz "nu este"
   i:      .long 2
   sup:    .space 4
   s:      .long 0



.text

perf:
   push %ebp
   movl %esp, %ebp
   
   movl 12(%ebp), %eax
   movl $0, %edx
   movl $2, %ebx
   div %ebx
   movl %eax, sup
   
   movl i, %ecx

   etfor:
         movl i, %ecx
         cmp sup, %ecx
         je etretur
         
         movl 12(%ebp), %eax
         movl $0, %edx
         movl i, %ebx
         divl %ebx
         
         movl $0, %ebx
         cmp %ebx, %edx
         jne etcont
         
         movl 16(%ebp), %eax
         movl i, %ebx
         addl %ebx, %eax
         movl %eax, s
         
         etcont:
              movl i, %eax
              inc %eax
              movl %eax, i
              jmp etfor
   
   etretur:
       pop %ebp
       ret




.global main
main:
   
   pusha
   pushl s
   pushl x
   call perf
   popl %ebx
   popl %ebx
   popa
   
   movl x, %eax
   cmp s, %eax
   jne etprint
   
    pushl $c2
    pushl x
    pushl $str
    call printf
    popl %ebx
    popl %ebx
    popl %ebx
   
    pusha
    push $0
    call fflush
    popl %ebx
    jmp etexit
    popa
    jmp etexit
    
    
etprint:
    pushl $c1
    pushl x
    pushl $str
    call printf
    popl %ebx
    popl %ebx
    popl %ebx
    
    push $0
    call fflush
    popl %ebx
   


etexit:

    movl $1, %eax
    movl $0, %ebx
    int $0x80
