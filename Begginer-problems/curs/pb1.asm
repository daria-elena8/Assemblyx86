.data
  
.text
  
.global _start

_start:

mov $0, %eax
mov $1, %ah
mov $0, %eax
mov $1, %al


etexit:
mov $1, %eax
mov $0, %ebx
int $0x80
