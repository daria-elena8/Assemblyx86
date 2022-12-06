.data
  str1: .asciz "acesta este un text\n"
  txt: .space 100
  n: .long 20

.text


.globl _start


_start:

  pushl $txt
  call scanf
  popl %ebx
  mov $0, %ecx
  
etfor:
   cmp n, %ecx
   je etexit
   
   
   
   
   
etexit:

  mov $1, %eax
  mov $0, %ebx
  int $0x80
  
  


