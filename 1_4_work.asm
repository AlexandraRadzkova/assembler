.386
.model flat,stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword
.data
k DWORD 5
l DWORD 7
n DWORD 6
m DWORD 1
a DWORD 0
b DWORD 0
res DWORD 0

;a = k + l
;b = n + m
;if (a % 2 == b % 2)

.code
main proc
	mov eax, a
	add eax, k
	add eax, l
	mov a, eax
	
	mov eax, b
	add eax, n
	add eax, m
	mov b, eax
	
	mov eax, a
	mov ebx, 2
	mov edx, 0
	div ebx
	mov ecx, edx
	mov eax, b
	mov ebx, 2
	mov edx, 0
	div ebx
	cmp ecx, edx
	jne EndOfIf
	mov res, 1

EndOfIf:

	invoke ExitProcess,0
main endp
end main