// Citire matrice si afisare
// DE CONTINUAT:  
//             -fisiere

.data
       n:                    .space 4
       lineIndex:             .long 0
       columnIndex:          .long 0
       left:                  .space 4
       right:                 .space 4
       matrix:               .space 1600
       nrMuchii:             .space 4
       index:                .long 0
       
       msj0:                 .asciz "Introduceti numarul de noduri: "
       msj1:                 .asciz "Introduceti numarul de muchii: "
       msj2:                 .asciz "Introduceti pe rand perechile de noduri pentru care avem muchii: "
       msj3:                 .asciz "Matricea :\n"
       fn:                   .asciz "%d"
       fout:                 .asciz "%d "
       newLine:             .asciz "\n"
       
.text
.global main
main:
      // Afisare mesaj numar noduri
      movl $4, %eax
      movl $1, %ebx
      movl $msj0, %ecx
      movl $32, %edx
      int $0x80
      
      
      //Citire numar de noduri
      pushl $n
      push $fn
      call scanf
      popl %ebx
      popl %ebx
      
      //Afisare mesaj numar muchii
      movl $4, %eax
      movl $1, %ebx
      movl $msj1, %ecx
      movl $32, %edx
      int $0x80
      
      //Citire numar de noduri
      pushl $nrMuchii
      push $fn
      call scanf
      popl %ebx
      popl %ebx
      
      
      //Mesaj pentru introducerea perechilor de noduri
      movl $4, %eax
      movl $1, %ebx
      movl $msj2, %ecx
      movl $66, %edx
      int $0x80

      movl $0, index
      
for_muchii:
      movl index, %ecx
      cmp nrMuchii, %ecx
      je etafisare
      
                  
             // Citire pereche de noduri
          
             pushl $left
             push $fn
             call scanf
             popl %ebx
             popl %ebx
             
             pushl $right
             push $fn
             call scanf
             popl %ebx
             popl %ebx
             
             //Mutare in matrice
             
             movl left, %eax
             movl $0, %edx
             mull n
             addl right, %eax
             
             lea matrix, %edi
             movl $1, (%edi, %eax, 4)

      
      incl index
      jmp for_muchii



etafisare:


      movl $4, %eax
      movl $1, %ebx
      movl $msj3, %ecx
      movl $12, %edx
      int $0x80
      
      
      movl $0, lineIndex
      
      forAfisLine:
           movl lineIndex, %ecx
           cmp n, %ecx
           je etexit
           
           movl $0, columnIndex
           forAfisColumn:
                  movl columnIndex, %ecx
                  cmp %ecx, n
                  je cont
                  
                                   
                  movl lineIndex, %eax
                  movl $0, %edx
                  mull n
                  addl columnIndex, %eax
                  
                  
                  lea matrix, %edi
                  movl (%edi, %eax, 4), %ebx
                  
                  
                  pushl %ebx
                  push $fout
                  call printf
                  popl %ebx
                  popl %ebx
                  
                  
                 
                  pushl $0
                  call fflush
                  popl %ebx           
                  
                  
                  incl columnIndex
                  jmp forAfisColumn
                  
           cont:
           
              movl $4, %eax
              movl $1, %ebx
              movl $newLine, %ecx
              movl $2, %edx
              int $0x80          
           
              incl lineIndex
              jmp forAfisLine
              


etexit:

    movl $1, %eax
    movl $0, %ebx
    int $0x80
