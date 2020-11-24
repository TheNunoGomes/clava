	.file	"ffConv2.c"
	.text
	.p2align 4
	.globl	ffConv2
	.type	ffConv2, @function
ffConv2:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pxor	%xmm0, %xmm0
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movl	4(%rdi), %r14d
	movl	(%rdi), %ebx
	movl	4(%rsi), %r13d
	movl	(%rsi), %r15d
	movl	%r14d, %edi
	movl	%ebx, %esi
	movl	%r14d, (%rsp)
	call	fSetArray@PLT
	movq	%rax, %r10
	movl	%r13d, %eax
	shrl	$31, %eax
	addl	%r13d, %eax
	sarl	%eax
	movl	%eax, 28(%rsp)
	movl	%eax, %esi
	movl	%r15d, %eax
	shrl	$31, %eax
	addl	%r15d, %eax
	sarl	%eax
	movl	%eax, 12(%rsp)
	testl	%r14d, %r14d
	jle	.L1
	testl	%ebx, %ebx
	jle	.L1
	testl	%r13d, %r13d
	jle	.L1
	movl	%eax, %edi
	movl	%esi, %eax
	negl	%esi
	subl	%eax, %r14d
	leal	-1(%r13), %eax
	movl	%esi, 8(%rsp)
	movl	%eax, 20(%rsp)
	leal	(%rbx,%r15), %eax
	subl	%edi, %eax
	movl	%r14d, 24(%rsp)
	movl	%eax, 16(%rsp)
.L4:
	movl	12(%rsp), %eax
	movl	%r15d, %edi
	movl	8(%rsp), %r14d
	addl	28(%rsp), %r14d
	subl	%eax, %edi
	negl	%eax
	movl	%eax, 4(%rsp)
	.p2align 4,,10
	.p2align 3
.L13:
	movl	20(%rsp), %r8d
	movl	8(%rsp), %esi
	leal	-1(%rdi), %r11d
	movl	12(%rsp), %r13d
	addl	4(%rsp), %r13d
	.p2align 4,,10
	.p2align 3
.L6:
	testl	%r15d, %r15d
	jle	.L11
	testl	%esi, %esi
	js	.L11
	cmpl	%esi, (%rsp)
	jle	.L11
	movl	4(%rsp), %eax
	.p2align 4,,10
	.p2align 3
.L10:
	testl	%eax, %eax
	js	.L9
	cmpl	%eax, %ebx
	jle	.L9
	movl	(%r10), %edx
	movl	(%r12), %ecx
	imull	%r14d, %edx
	imull	%r8d, %ecx
	addl	%r13d, %edx
	movslq	%edx, %rdx
	leaq	(%r10,%rdx,4), %r9
	movl	%r11d, %edx
	subl	%eax, %edx
	addl	%edx, %ecx
	movl	0(%rbp), %edx
	movslq	%ecx, %rcx
	imull	%esi, %edx
	movss	8(%r12,%rcx,4), %xmm0
	addl	%eax, %edx
	movslq	%edx, %rdx
	mulss	8(%rbp,%rdx,4), %xmm0
	addss	8(%r9), %xmm0
	movss	%xmm0, 8(%r9)
.L9:
	addl	$1, %eax
	cmpl	%edi, %eax
	jne	.L10
.L11:
	subl	$1, %r8d
	addl	$1, %esi
	cmpl	$-1, %r8d
	jne	.L6
	addl	$1, 4(%rsp)
	addl	$1, %edi
	cmpl	16(%rsp), %edi
	jne	.L13
	addl	$1, 8(%rsp)
	movl	8(%rsp), %eax
	cmpl	24(%rsp), %eax
	jne	.L4
.L1:
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	movq	%r10, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	ffConv2, .-ffConv2
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
