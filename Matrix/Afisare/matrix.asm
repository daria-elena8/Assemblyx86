//Afisare matrice
.data
     lineIndex:          .space 4
     columnIndex:       .space 4
     matrix:            .long 1, 2, 3, 4, 5
                       .long 10, 20, 30, 40, 50
                       .long 50, 40, 30, 20, 10
     
     lines:             .long 3
     columns:          .long 5
     fout:             .asciz "%d "
     newLine:         .asciz "\n"

.text
.global main
main:

     
     movl $0, lineIndex
     lea matrix, %edi
     for_lines:
            movl lineIndex, %ecx
            cmp lines, %ecx
            je etexit
            
            movl $0, columnIndex
            for_columns:
                     movl columnIndex, %ecx
                     cmp columns, %ecx
                     je etcont
                     
                     movl lineIndex, %eax
                     mull columns
                     addl columnIndex, %eax
                     
                     movl (%edi, %eax, 4), %ebx
                     
                     pushl %ebx
                     pushl $fout
                     call printf
                     popl %ebx
                     popl %ebx
                     
                     pushl $0
                     call fflush
                     popl %ebx                     
                                        
                     addl $1, columnIndex
                     jmp for_columns
                     
            etcont:
            
            movl $4, %eax
            movl $1, %ebx
            movl $newLine , %ecx
            movl $2, %edx
            int $0x80
            
            
            addl $1, lineIndex
            jmp for_lines
            


etexit:
     mov $1, %eax
     mov $0, %ebx
     int $0x80
