//Traducere in assembly
.data
      n1:   .long 5
      n2:   .long 6
      k:    .long 3
      
      
.section .rodata
      fs1:  .asciz "%ld\n"
 //

.text

rest:
    push %ebp
    movl %esp, %ebp
    pushl %ebx
    // ****



proc:
    push %ebp
    movl %esp, %ebp
    
    subl $4, %esp
    
    mov 8(%ebp), %eax
    addl 12(%ebp), %eax
    
    mov %eax, -4(%ebp)
    //push %eax
    
    pushl 16(%ebp)
    pushl -4(%ebp)
    call rest
    //pop %ebx
    //pop %ebx
    addl $8, %esp
    
    //rest intoarce val in %eax
    
    addl $4, %esp
    pop %ebp
    ret
    
.global main
main:


     pushl k
     pushl n2
     pushl n1
     call proc
     addl $12, %esp
     
     //proc ret in %eax
     
     push %eax
     push $fs1
     call printf
     addl $8, %esp
     
    

    
    
    
etexit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
    
    
    
    
    
    
