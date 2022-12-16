.data
   n: .long 5
   a: .long 1,2,3,4,5
   s: .long 0
.text

.global _start

_start:

  mov $a, %esi
  mov $0, %ecx

etloop:
  cmp n, %ecx
  jge etexit

   movl (%esi, %ecx,4), %ebx
  add %ebx,s
  jmp etloop
  
  

etexit:
  mov $1, %eax
  mov $0, %ebx
  int $0x80
