.data
  a: .asciz " x mai mare ca y\n"
  b: .asciz " x egal cu y\n"
  c: .asciz "x mai mic decat y\n"
  x: .long 5
  y: .long 5


.text

.globl _start

_start:

  mov x, %eax
  mov y, %ebx
  cmp %ebx, %eax
  jl etlower
  je etequal
  jg etgreater  
  
etlower:
   mov $4, %eax
   mov $1, %ebx
   mov $c, %ecx
   mov $19, %edx
   int $0x80
   jmp etexit


etequal:
   mov $4, %eax
   mov $1, %ebx
   mov $b, %ecx
   mov $14, %edx
   int $0x80
   jmp etexit


etgreater:
   mov $4, %eax
   mov $1, %ebx
   mov $a, %ecx
   mov $18, %edx
   int $0x80
   jmp etexit


etexit:
   mov $1, %eax
   mov $0, %ebx
   int $0x80


