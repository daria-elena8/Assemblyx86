.data
   x: .long 3
   y:  .long 4
   sum: .long 0
   dif:  .long 0
   prod:  .long 0
   cat:  .long 0
   rest:  .long 0

.text

.global _start

_start:
  mov x, %eax
  mov y, %ebx
  add %ebx, %eax
  mov %eax, sum
  
  mov x, %eax
  sub %ebx, %eax
  mov %eax, dif
  
  mov x, %eax
  mul %ebx
  mov %eax, prod
  
  mov x, %eax
  div %ebx
  mov %eax, cat
  mov %edx, rest
  
 etexit:
  mov $1, %eax
  mov $0, %ebx
  int $0x80  
  
