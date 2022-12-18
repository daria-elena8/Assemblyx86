// Try3 pentru verificarea unui numar perfect
.data
       n:               .space 4
       div:             .long 0
       sdiv:            .long 0
       end:             .long 0

       
       fint:            .asciz "%d"
       
       msj:            .asciz "Introduceti un numar: \n"
       str1:            .asciz "Numarul este perfect\n"
       str2:            .asciz "Numarul nu este perfect\n"



.text
                //        .....
                //       end            <-    -12(%ebp)
                //       sdiv           <-     -8(%ebp)
                //       div            <-     -4(%ebp)
                //      %ebpv          <-     0(%ebp)
                //     <adr_ret>         <-     4(%ebp)
                //        n             <-     8(%ebp)


proc:
    
    pushl %ebp
    movl %esp, %ebp
    
    pushl div
    pushl sdiv
    pushl end
    
    
    //Pun jumatatea lui n in end pentru a opri for-ul
    // n= 8(%ebp)
    // end= -12(%ebp)
    
    movl 8(%ebp), %eax
    movl $0, %edx
    movl $2, %ebx
    divl %ebx
    movl %eax, -12(%ebp)
    
    // Incep cautarea divizorilor de la 1
    // Pun $1 in div
    // div= -4(%ebp)
    
    movl $1, %eax
    movl %eax, -4(%ebp) 
    
    
    for_divizori:
            // Verific daca div a ajuns la jumatate (end)
            // div= -4(%ebp)
            // end= -12(%ebp)
            
            movl -4(%ebp), %ecx
            movl -12(%ebp), %edx
            cmp %edx, %ecx
            jg etcont
            
            // Impart n-ul la divizor si apoi verific restul
            // n= 8(%ebp)
            // div= -4(%ebp)
            
            movl 8(%ebp), %eax
            movl $0, %edx
            divl %ecx
            
            cmp $0, %edx
            jne etnudiv
            
            //Adaugam divizorul la suma daca se imparte fara rest
            // div= -4(%ebp)
            // sdiv= -8(%ebp)
            
            movl -8(%ebp), %eax
            movl -4(%ebp), %edx
            addl %edx, %eax
            movl %eax, -8(%ebp)
            
            
            etnudiv:
                  // Trec la urmatorul divizor
                  // div= -4(%ebp)
                  
                  movl -4(%ebp), %eax
                  incl %eax
                  movl %eax, -4(%ebp)
                  jmp for_divizori 
            
            
    etcont: 
         movl -8(%ebp), %eax
         popl %ebx
         popl %ebx
         popl %ebx
         popl %ebp
         ret



.global main
main:
       // Afisare mesaj user-friendly
       
       movl $4, %eax
       movl $1, %ebx
       movl $msj, %ecx
       movl $24, %edx
       int $0x80
       
       
       // Citire numar de la tastatura

       pushl $n
       pushl $fint
       call scanf
       popl %ebx
       popl %ebx

     
       pushl n
       call proc
       popl %ebx

      movl %eax, sdiv
      
      // Afisare suma divizorilor
//       pushl %eax
//       pushl $fint
//       call printf
//       popl %ebx
//       popl %ebx
       

       // Verificare perfect
       movl sdiv, %eax
       cmp n, %eax
       jne etprint
       
       pushl $str1
       call printf
       popl %ebx
       
       pushl $0
       call fflush
       popl %ebx
       
       jmp etexit

etprint:
      
      
       pushl $str2
       call printf
       popl %ebx
       
       pushl $0
       call fflush
       popl %ebx


etexit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80


