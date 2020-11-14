	.file	"iMallocHandle.c"
	.text
	.p2align 4
	.globl	iMallocHandle
	.type	iMallocHandle, @function
iMallocHandle:
.LFB39:
	.cfi_startproc
	endbr64
	movslq	%edi, %rax
	movslq	%esi, %rdx
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rax, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	imulq	%rdx, %rax
	movq	%rdx, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	leaq	8(,%rax,4), %rdi
	call	malloc@PLT
	movl	%ebp, 4(%rax)
	movl	%ebx, (%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	iMallocHandle, .-iMallocHandle
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
