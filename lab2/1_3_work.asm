.386 
.model flat,stdcall 
.stack 4096 

ExitProcess proto, dwExitCode:dword 
.data 
x DWORD 3
y DWORD 4 
z DWORD 5

.code 
main proc 
	mov eax, x 
	cmp eax, y 
	jnl CompareYZ 
	mov ebx, y
	mov y, eax 
	mov x, ebx 
CompareYZ:

	mov eax, y 
	cmp eax, z
	jnl CompareXY
	mov ebx, z 
	mov z, eax
	mov y, ebx 
CompareXY:

	mov eax, x 
	cmp eax, y
	jnl EndOfIF
	mov ebx, y
	mov y, eax 
	mov x, ebx 
EndOfIF: 

	invoke ExitProcess,0 
main endp 
end main