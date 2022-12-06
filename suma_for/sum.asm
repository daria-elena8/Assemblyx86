.data
   s: .space 4
   n: .long 4
.text

.globl _start
_start:
 mov $0, %ecx

et_for:
 cmp n, %ecx
 je etexit
 add %ecx, %eax
 mov %eax, s
 inc %ecx
 jmp et_for



etexit:
  mov $1, %eax
  mov $0, %ebx
  int $0x80
