.data
  x: .long 15
  y: .long 21


.text

.global main

main:
  
  mov x, %eax
  mov y, %edx
  mov %edx, x
  mov %eax, y
  

etexit:
  mov $1, %eax
  mov $0, %ebx
  int $0x80
