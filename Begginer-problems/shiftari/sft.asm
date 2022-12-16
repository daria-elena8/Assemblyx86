.data
   x: .long 15
   y: .long 256
   a: .long 6
   b: .long 1
.text

.global _start

_start:

  mov x, %eax
  mov y, %ebx
  shl $1, %eax
  shl $1, %eax
  shl $1, %eax
  shl $1, %eax
  shl $1, %eax
  
  shr $1, %eax
  shr $2, %eax
  shr $1, %eax
  
  sal $1, %eax
  sal $1, %eax
  sal $1, %eax
  sal $2, %eax
  
  sar $1, %eax
  sar $1, %eax
  sar $1, %eax
  
  sal $1, %eax
  
  sar $2, %eax
  
  shl $1, %eax
  shl $1, %eax
  
  shr $1, %eax

  
  
  mov x, %eax
  mov y, %ebx
  sal $1, %eax
  
  mov a, %eax
  mov b, %ebx
  shr $2, %eax
  
  mov a, %eax
  mov b, %ebx
  sar $1, %eax
 
etexit:
  mov $1, %eax
  mov $0, %ebx
  int $0x80
