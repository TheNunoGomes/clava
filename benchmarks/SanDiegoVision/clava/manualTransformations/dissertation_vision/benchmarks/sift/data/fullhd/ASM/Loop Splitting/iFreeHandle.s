	.file	"iFreeHandle.c"
	.text
	.p2align 4
	.globl	iFreeHandle
	.type	iFreeHandle, @function
iFreeHandle:
.LFB39:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L1
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L1:
	ret
	.cfi_endproc
.LFE39:
	.size	iFreeHandle, .-iFreeHandle
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
