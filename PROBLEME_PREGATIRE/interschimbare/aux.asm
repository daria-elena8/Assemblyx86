.data
   x:     .space 4
   y:     .space 4
   fint:  .asciz "%d %d"
   
   
      
.text


.global main


main:

   
   push $x
   push $y
   push $fint
   call scanf
   pop %ebx
   pop %ebx
   pop %ebx
   
   mov x, %eax
   mov y, %edx

   
   push %edx
   push %eax
   push $fint
   call printf
   pop %ebx
   pop %ebx
   pop %ebx

   push $0
   call fflush
   pop %ebx


etexit:
  mov $1, %eax
  mov $0, %ebx
  int $0x80
