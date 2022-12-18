//Suma a doua numere cu proceduri
.data
       a:                 .space 4
       b:                 .space 4
       
       str:                .asciz "%d"



.text

proc: 
     pushl %ebp
     movl %esp, %ebp
     
     movl 8(%ebp), %eax
     movl 12(%ebp), %edx
     addl %edx, %eax
     
     popl %ebp
     ret


.global main
main:

                         //Citire numere
      pushl $a
      pushl $str
      call scanf
      popl %ebx
      popl %ebx

      pushl $b
      pushl $str
      call scanf
      popl %ebx
      popl %ebx

                        //Apel procedura
      pushl b
      pushl a
      call proc
      popl %ebx
      popl %ebx

                        //Afisare
      pushl %eax
      pushl $str
      call printf
      popl %ebx
      popl %ebx
      
      pushl $0
      call fflush
      popl %ebx





etexit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
