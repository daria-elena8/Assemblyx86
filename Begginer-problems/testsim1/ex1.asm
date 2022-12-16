.data

.text
global _start
_start:

push   ebp
mov    ebp,esp
push   0x565561e6
push   0x565561f2
mov    eax,0x565561c2
add eax,0x9
jmp    eax
mov    eax,DWORD PTR [ebp+0x8]
inc    eax
mov    DWORD PTR [ebp+0x8],eax
pop    eax
pop    eax
pop    ebp
ret

push   0x565561fe
call   0x565561ad <f>
pop    edx
mov    DWORD PTR ds:0x56559008,0x0
jmp    0x5655620a <final>
mov    DWORD PTR ds:0x56559008,0x1
jmp    0x5655620a <final>
mov    DWORD PTR ds:0x56559008,0x2
jmp    0x5655620a <final>
mov    DWORD PTR ds:0x56559008,0x3
jmp    0x5655620a <final>
push   DWORD PTR ds:0x56559008
push   0x5655900c
call   0xf7e1ede0 <printf>
pop    eax
pop    eax
mov    eax,0x1
xor    ebx,ebx
int    0x80
