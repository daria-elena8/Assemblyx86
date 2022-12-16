//Verificare numar perfect cu proceduri
.data
   x:       .long 6
   str:     .asciz "Numarul %d %s perfect\n"
   c1:     .asciz "este"
   c2:     .asciz "nu este"
   i:      .long 2
   sup:    .space 4
   s:      .space 4
   
.text

f1:
     
     pushl %ebp
     movl %esp, %ebp
     
     movl 12(%ebp), %eax
     movl $0, %edx
     movl 8(%ebp), %ebx
     divl %ebx
     cmp $0, %edx
     jne eticheta
     movl 16(%ebp), %eax
     addl 8(%ebp), %eax
     movl %eax, s
     
eticheta:
     popl %ebp
     ret
     
.global main
main:
   movl $0, %eax
   movl %eax, s
   
   movl x, %eax
   movl $2, %ebx
   
   movl $0, %edx
   divl %ebx
   
   movl %eax, sup
    //gasim sup=maximul pana la care merg divizorii\
    
 //  movl $0, %eax
 //  movl $2, %eax
 //  mov %eax, i    
         
   //facem indexul 2 pt cautare div
   
etfor: 
    movl i, %ecx
    movl sup, %ecx
    je etcomp                 
     //daca am trecut prin toti divizorii, trebuie sa vedem daca este perfect
    
    pushl $s
    pushl x
    pushl i
    call f1
    popl %ebx
    popl %ebx
    popl %ebx


    movl i, %eax
    addl $1, %eax
    movl %eax, i

    jmp etfor
    
etcomp:

    movl s, %eax
    cmp x, %eax
    je etprint1
    
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
    
etprint1:
// se pune $ inainte de x ca sa nu dea segmenation fault
    
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
