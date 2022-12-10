// Cadru corect de apel al unei proceduri folosind stiva si schimband de fiecare data esp si ebp pentru a avea valori fixe. 
//EX:
   Astfel, un cadru corect de apel pentru schema din subsectiunea 2.1 este urmatorul:
.data
.text
proc1:
pushl %ebp
movl %esp, %ebp
; codul din corpul procedurii
popl %ebp
ret
.global main
main:
call proc1
mov $1, %eax
xor %ebx, %ebx
int $0x80
