.data
    x:  .space 4
    y:  .space 4
    z:  .space 4
    min: .space 4
    fint: .asciz "%d %d %d"
    fout: .asciz "Cel mai mic numar este: %d\n"
    txt: .asciz "Introduceti numerele:\n"
.text
.global main
main:
   movl $4, %eax
   movl $1, %ebx
   movl $txt, %ecx
   movl $28, %edx
   int $0x80
   
   pusha
   pushl $x
   pushl $y
   pushl $z
   push $fint
   call scanf
   popl %ebx
   popl %ebx
   popl %ebx
   popl %ebx
   popa
   
   movl x, %eax
   movl y, %ebx
   cmp %ebx, %eax
   jge etcomp2
   
   movl z, %ebx
   cmp %ebx, %eax
   jg etm
   movl %eax, min
   jmp etprint
   
etm:
   movl %ebx, min
   jmp etprint
   
etcomp2:
   movl z, %eax
   cmp %eax, %ebx
   jle etm
   movl %eax, min
   
etprint:


     pusha
     push min
     push $fout
     call printf
     pop %ebx
     pop %ebx
     popa

     push $0
     call fflush
     pop %ebx

etexit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
