.data
    x:  .space 4
    d:  .long 2
    msj1: .asciz "Numarul %d nu este prim.\n"
    msj2: .asciz "Numarul %d este prim.\n"
    fint: .asciz "%d"
    txt: .asciz "Introduceti numarul pentru verificare:\n"
    lim: .space 4

.text
.global main
main:
     movl $4, %eax
     movl $1, %ebx
     movl $txt, %ecx
     movl $39, %edx
     int $0x80
     
     pusha
     push $x
     push $fint
     call scanf
     popl %ebx
     popl %ebx
     popa
    
    movl d, %ecx
    movl x, %eax
    movl $2, %ebx
    movl $0, %edx
    div %ebx
   movl %eax, lim
etfor:
   movl d, %ecx
   cmp lim, %ecx
   jg etprint1
   
   movl x, %eax
   movl d, %ebx
   movl $0, %edx
   div %ebx
   cmp $0, %edx
   je etprint2
   
   movl d, %ecx
   inc %ecx
   movl %ecx, d
   jmp etfor
   
   
 etprint1:
    pusha
    pushl x
    push $msj2
    call printf
    popl %ebx
    popl %ebx
    popa
    
    pusha
    push $0
    call fflush
    pop %ebx
    popa
    jmp etexit
    
 etprint2:
    pusha
    pushl x
    push $msj1
    call printf
    popl %ebx
    popl %ebx
    popa
    
    pusha
    push $0
    call fflush
    pop %ebx
    popa
   

etexit:
   movl $1, %eax
   movl $0, %ebx
   int $0x80
