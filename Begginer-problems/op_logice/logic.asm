.data
  x: .long 3
  y: .long 15
  a: .space 4
  b: .long 1 
  
.text

.global _start

_start:

  mov x, %eax
  mov y, %ebx
  or %ebx, %eax
  
  mov a, %eax
  mov b, %ebx
  or %ebx, %eax
  
  mov x, %eax
  mov y, %ebx
  and %eax, %ebx
  
  mov y, %ebx
  not %ebx
  
  mov x, %eax
  mov y, %ebx
  xor %ebx, %eax



etexit:
  mov $1, %eax
  mov $0, %ebx
  int $0x80
