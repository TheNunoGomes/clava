	.file	"iReshape.c"
	.text
	.p2align 4
	.globl	iReshape
	.type	iReshape, @function
iReshape:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	movl	%esi, %edi
	movl	%edx, %esi
	movl	(%rbx), %r12d
	movl	4(%rbx), %ebp
	call	iMallocHandle@PLT
	testl	%r12d, %r12d
	jle	.L1
	testl	%ebp, %ebp
	jle	.L1
	movq	%rbx, %r11
	xorl	%r10d, %r10d
	leaq	4(%rax), %r14
	xorl	%r9d, %r9d
	leal	-1(%rbp), %r13d
	.p2align 4,,10
	.p2align 3
.L3:
	movslq	%r10d, %rcx
	movslq	(%rbx), %rdi
	leaq	(%rax,%rcx,4), %rdx
	addq	%r13, %rcx
	leaq	(%r14,%rcx,4), %r8
	salq	$2, %rdi
	movq	%r11, %rcx
	.p2align 4,,10
	.p2align 3
.L4:
	movl	8(%rcx), %esi
	addq	$4, %rdx
	addq	%rdi, %rcx
	movl	%esi, 4(%rdx)
	cmpq	%r8, %rdx
	jne	.L4
	addl	$1, %r9d
	addl	%ebp, %r10d
	addq	$4, %r11
	cmpl	%r9d, %r12d
	jne	.L3
.L1:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	iReshape, .-iReshape
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
