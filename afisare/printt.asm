.data
   formatPrnt: .asciz "%d : %d\n"

.text

.global main


main:
  
  push $0
  push $1
  push $formatPrnt
  call printf
  pop $ebx
  pop $ebx
  pop $ebx
  
etexit:
  mov $1, $eax
  mov $0, %ebx
  int $0x80
