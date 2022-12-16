.data
    n: .long 5
    v: .long 7, 6, 3, 8, 2, 6
    ap: .space 4
    max: .space 4
    
.text

.globl _start

_start:
   lea v, %esi
   mov $0, %ecx
   mov $0, %eax
   mov %eax, max
 
   
et_for:
   cmp n, %ecx
   je etexit
   
   mov (%esi, %ecx, 4), %ebx
   cmp %ebx, max
   jl etmov
   je etadd
   etcontinue:
     inc %ecx
     jmp et_for
   
etmov:
  mov %ebx, max
  mov $0, %eax
  mov %eax, ap
  jmp etcontinue

  
   
etadd: 
  add ap, %eax
  add $1, %eax
  mov %eax, ap
  jmp etcontinue

etexit: 
   mov $1, %eax
   mov $0, %ebx
   int $0x80
