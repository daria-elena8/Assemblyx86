.data
   x:     .space 4
   y:     .space 4
   fscan: .asciz "%d %d"
   fprint: .asciz "Suma numerelor este %d"

.text

.global main


main:
   
    push $x
    push $y
    push $fscan
    call scanf
    pop %ebx
    pop %ebx
    pop %ebx
    

    mov y, %eax
    add x, %eax

    
    push %eax
    push $fprint
    call printf
    pop %ebx
    pop %ebx

    push $0
    call fflush
    pop %ebx


etexit:
   mov $1, %eax
   mov $0, %ebx
   int $0x80
