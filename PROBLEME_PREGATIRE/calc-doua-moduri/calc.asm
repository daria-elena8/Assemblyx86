.data
   x: .long 64
   y: .long 2
   z: .long 16

.text
.global main
main:
   
   movl x, %eax
   movl z, %edx
   divl %edx
   movl %eax, %edx
   movl y, %eax
   movl z, %ebx
   mull %ebx
   add %edx, %eax




etexit:
  mov $1, %eax
  mov $0, %ebx
  int $0x80
