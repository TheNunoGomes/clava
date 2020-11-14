	.file	"fTranspose.c"
	.text
	.p2align 4
	.globl	fTranspose
	.type	fTranspose, @function
fTranspose:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	4(%rdi), %ebp
	movq	%rdi, %rbx
	movl	(%rdi), %r12d
	movl	%ebp, %esi
	movl	%r12d, %edi
	call	fMallocHandle@PLT
	testl	%r12d, %r12d
	jle	.L1
	testl	%ebp, %ebp
	jle	.L1
	movslq	(%rbx), %rdi
	movq	%rbx, %r8
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	leaq	4(%rax), %rbx
	leal	-1(%rbp), %r11d
	salq	$2, %rdi
	.p2align 4,,10
	.p2align 3
.L3:
	movslq	%r10d, %rcx
	leaq	(%rax,%rcx,4), %rdx
	addq	%r11, %rcx
	leaq	(%rbx,%rcx,4), %rsi
	movq	%r8, %rcx
	.p2align 4,,10
	.p2align 3
.L4:
	movss	8(%rcx), %xmm0
	addq	$4, %rdx
	addq	%rdi, %rcx
	movss	%xmm0, 4(%rdx)
	cmpq	%rsi, %rdx
	jne	.L4
	addl	$1, %r9d
	addl	%ebp, %r10d
	addq	$4, %r8
	cmpl	%r9d, %r12d
	jne	.L3
.L1:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	fTranspose, .-fTranspose
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
