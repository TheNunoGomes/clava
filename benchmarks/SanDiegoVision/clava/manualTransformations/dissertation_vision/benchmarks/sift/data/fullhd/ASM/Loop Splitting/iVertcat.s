	.file	"iVertcat.c"
	.text
	.p2align 4
	.globl	iVertcat
	.type	iVertcat, @function
iVertcat:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	(%rdi), %r14d
	movl	4(%rsi), %ebp
	movl	4(%rdi), %ebx
	movl	%r14d, %esi
	leal	(%rbx,%rbp), %edi
	call	iMallocHandle@PLT
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	testl	%r14d, %r14d
	jle	.L1
	.p2align 4,,10
	.p2align 3
.L2:
	testl	%ebx, %ebx
	jle	.L8
	movslq	(%r12), %r11
	movslq	(%rax), %r10
	leaq	(%r12,%r8), %rsi
	leaq	(%rax,%r8), %rcx
	xorl	%edx, %edx
	salq	$2, %r11
	salq	$2, %r10
	.p2align 4,,10
	.p2align 3
.L4:
	movl	8(%rsi), %edi
	addl	$1, %edx
	addq	%r11, %rsi
	movl	%edi, 8(%rcx)
	addq	%r10, %rcx
	cmpl	%edx, %ebx
	jne	.L4
.L8:
	testl	%ebp, %ebp
	jle	.L5
	movslq	(%rax), %r10
	movslq	0(%r13), %r11
	leaq	0(%r13,%r8), %rsi
	movq	%r10, %rdx
	salq	$2, %r11
	imull	%ebx, %edx
	salq	$2, %r10
	addl	%r9d, %edx
	movslq	%edx, %rdx
	leaq	(%rax,%rdx,4), %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L6:
	movl	8(%rsi), %edi
	addl	$1, %edx
	addq	%r11, %rsi
	movl	%edi, 8(%rcx)
	addq	%r10, %rcx
	cmpl	%edx, %ebp
	jne	.L6
.L5:
	addl	$1, %r9d
	addq	$4, %r8
	cmpl	%r9d, %r14d
	jne	.L2
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
	.size	iVertcat, .-iVertcat
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
