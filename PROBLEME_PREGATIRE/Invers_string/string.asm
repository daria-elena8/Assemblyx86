//Inversul unui string

.data
    s:     .space 400
    n:     .long 4
    t:     .space 400
    txt1:  .asciz "Introduceti sirul:  "
    txt444: .asciz "abc\n"
    txt2:  .asciz "Inversul sirului este %s\n"
    index: .space 4
    c:     .space 4


.text
.global main
main:

 //   movl $4, %eax
 //   movl $1, %ebx
//    movl $txt1, %ecx
//    movl $20, %edx
//    int $0x80
    

    
    
//    push $s
//    call gets
//    pop %ebx
    
    
    lea txt444, %esi 
    
 //   push $n
 //   call scanf
 //   pop %ebx
    
    
    movl $t, %edi
    
    movl n, %eax
    sub $1, %eax
    movl %eax, index

etfor:
   movl index, %ecx
   cmp $1, %ecx
   je etprint
   
   movl (%esi, %ecx, 1), %eax
   movl %eax, c
   movl n, %edx
   
   movl index, %ecx
   sub %ecx, %edx
   
   movl c, %eax
   movl %eax, (%edi, %edx, 1)
   
   movl index, %ecx
   inc %ecx
   movl %ecx, index
   jmp etfor
   
   
etprint:

   pusha
   push t
   push $txt2
   call printf
   pop %ebx
   pop %ebx
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
