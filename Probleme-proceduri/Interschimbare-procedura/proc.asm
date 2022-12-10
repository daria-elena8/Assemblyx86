// Interschimbare prin proceduri

.data
    x:           .space 4
    y:           .space 4
    msj1:        .asciz "Introduceti numerele:\n"
    msj2:        .asciz "Numerele inversate sunt:\n"
    fi:   .asciz "%d %d"
    fp:  .asciz "%d , %d\n"

.text
proc1:
    pusha
    push $x
    push $y
    push $fi
    call scanf
    popl %ebx
    popl %ebx
    popl %ebx
    popa
    ret
    

proc2:
   
   pushl x
   pushl y
   pushl $fp
   call printf
   popl %ebx
   popl %ebx
   popl %ebx
   popa
   
   pusha
   pushl $0
   call fflush
   popl %ebx
   ret
  
.global main

   
main:
   movl $4, %eax
   movl $1, %ebx
   movl $msj1, %ecx
   movl $22, %edx
   int $0x80

   call proc1
   movl x, %eax
   movl y, %ebx
   movl %ebx, x
   movl %eax, y
   
   movl $4, %eax
   movl $1, %ebx
   movl $msj2, %ecx
   movl $25, %edx
   int $0x80
   
   call proc2
   

etexit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
