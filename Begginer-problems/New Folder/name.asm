.data
  x: .long 5
  y: .long 3
  prod: .space 4
.text
.globl _start
_start:
   mov x, %eax
   mov y, %ebx
   mul %ebx
   mov %eax, prod
   
etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
