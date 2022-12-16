.data
  x: .space 4
  y: .space 4
  formatprnt: .asciz "%d este primul numar, iar %d este cel de-al doilea numar\n"

.text


.global main

main:

  push $x
  push $y
  push $formatprint
  call printf
  popl %ebx
  popl %ebx
  popl %ebx
  
  push $0
  call fflush
  popl %ebx
  
etexit:
  mov $1, %eax
  mov $0, %ebx
  int $0x80
