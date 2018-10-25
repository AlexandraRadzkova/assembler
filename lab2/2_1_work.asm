.386
.model flat,stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword
.data
n DWORD 5
a DWORD 1
i DWORD 0
sum DWORD 0

;n = 5
;a = 1
;sum = 0
;for (let i=0; i< n; ++i) { 
;  sum += a
;console.log(a)
;  a *= 5
;}

;console.log(sum)
.code
main proc
    mov eax, i
    mov edx, sum
    mov ecx, 5
BeginWhile: 
    cmp eax, n
    jnl EndWhile
    add edx, a
    
    mov ebx, a
    imul ebx, ecx
    mov a, ebx
    inc eax
    jmp BeginWhile
EndWhile:
        
    invoke ExitProcess,0
main endp
end main

;1+5+25+125+625=781