.data

  formatprnt: .asciz "%d este primul numar, iar %d este cel de-al doilea numar\n"

.text


.global main

main:

  push $0
  push $1
  push $formatprnt
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
