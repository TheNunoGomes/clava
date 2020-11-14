	.file	"fHorzcat.c"
	.text
	.p2align 4
	.globl	fHorzcat
	.type	fHorzcat, @function
fHorzcat:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movl	4(%rdi), %r15d
	movl	(%rdi), %ebx
	movl	(%rsi), %r13d
	movl	%r15d, %edi
	movl	%r15d, 4(%rsp)
	leal	(%rbx,%r13), %esi
	call	fMallocHandle@PLT
	testl	%r15d, %r15d
	jle	.L1
	leal	-1(%rbx), %ecx
	movl	%ebx, %r11d
	movl	%r13d, %r15d
	movl	%r13d, %r10d
	cmpl	$3, %ecx
	movq	%rcx, 32(%rsp)
	seta	%sil
	cmpq	%rax, %rbp
	setne	%dl
	shrl	$2, %r11d
	andl	%edx, %esi
	salq	$4, %r11
	leal	-1(%r13), %edx
	movb	%sil, 11(%rsp)
	movl	%ebx, %esi
	movl	%edx, %ecx
	andl	$-4, %esi
	movq	%rcx, 40(%rsp)
	leal	1(%rsi), %edi
	movl	%esi, 12(%rsp)
	addl	$2, %esi
	cmpq	%rax, %r12
	movl	%edi, 20(%rsp)
	setne	%dil
	cmpl	$3, %edx
	movl	%esi, 28(%rsp)
	seta	%sil
	andl	$-4, %r15d
	shrl	$2, %r10d
	andl	%esi, %edi
	leal	1(%r15), %esi
	salq	$4, %r10
	movb	%dil, 10(%rsp)
	movl	%esi, 16(%rsp)
	leal	2(%r15), %esi
	movl	%esi, 24(%rsp)
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L3:
	xorl	%ecx, %ecx
	testl	%ebx, %ebx
	jle	.L16
	movl	0(%rbp), %edi
	movl	(%rax), %ecx
	imull	%esi, %edi
	imull	%esi, %ecx
	cmpb	$0, 11(%rsp)
	je	.L4
	movslq	%edi, %rdx
	leaq	8(%rbp,%rdx,4), %r9
	movslq	%ecx, %rdx
	leaq	8(%rax,%rdx,4), %r8
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L5:
	movups	(%r9,%rdx), %xmm1
	movups	%xmm1, (%r8,%rdx)
	addq	$16, %rdx
	cmpq	%r11, %rdx
	jne	.L5
	movl	12(%rsp), %r14d
	cmpl	%r14d, %ebx
	je	.L8
	leal	(%rdi,%r14), %edx
	movslq	%edx, %rdx
	movss	8(%rbp,%rdx,4), %xmm0
	leal	(%rcx,%r14), %edx
	movl	20(%rsp), %r14d
	movslq	%edx, %rdx
	movss	%xmm0, 8(%rax,%rdx,4)
	cmpl	%r14d, %ebx
	jle	.L8
	leal	(%rdi,%r14), %edx
	movslq	%edx, %rdx
	movss	8(%rbp,%rdx,4), %xmm0
	leal	(%rcx,%r14), %edx
	movslq	%edx, %rdx
	movss	%xmm0, 8(%rax,%rdx,4)
	movl	28(%rsp), %edx
	cmpl	%edx, %ebx
	jle	.L8
	addl	%edx, %edi
	addl	%edx, %ecx
	movslq	%edi, %rdi
	movslq	%ecx, %rcx
	movss	8(%rbp,%rdi,4), %xmm0
	movss	%xmm0, 8(%rax,%rcx,4)
.L8:
	movl	%ebx, %ecx
.L16:
	testl	%r13d, %r13d
	jle	.L9
	movl	(%r12), %edi
	movl	(%rax), %r14d
	imull	%esi, %edi
	imull	%esi, %r14d
	cmpb	$0, 10(%rsp)
	je	.L10
	movslq	%edi, %rdx
	movslq	%ecx, %r8
	leaq	8(%r12,%rdx,4), %r9
	movslq	%r14d, %rdx
	leaq	2(%rdx,%r8), %rdx
	leaq	(%rax,%rdx,4), %r8
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L11:
	movups	(%r9,%rdx), %xmm2
	movups	%xmm2, (%r8,%rdx)
	addq	$16, %rdx
	cmpq	%r10, %rdx
	jne	.L11
	addl	%r15d, %ecx
	cmpl	%r15d, %r13d
	je	.L9
	leal	(%rdi,%r15), %edx
	movl	16(%rsp), %r9d
	movslq	%edx, %rdx
	movss	8(%r12,%rdx,4), %xmm0
	leal	(%r14,%rcx), %edx
	movslq	%edx, %rdx
	movss	%xmm0, 8(%rax,%rdx,4)
	leal	1(%rcx), %edx
	cmpl	%r13d, %r9d
	jge	.L9
	leal	(%rdi,%r9), %r8d
	addl	%r14d, %edx
	addl	$2, %ecx
	movslq	%r8d, %r8
	movslq	%edx, %rdx
	movss	8(%r12,%r8,4), %xmm0
	movss	%xmm0, 8(%rax,%rdx,4)
	movl	24(%rsp), %edx
	cmpl	%edx, %r13d
	jle	.L9
	addl	%edx, %edi
	addl	%r14d, %ecx
	movslq	%edi, %rdi
	movslq	%ecx, %rcx
	movss	8(%r12,%rdi,4), %xmm0
	movss	%xmm0, 8(%rax,%rcx,4)
.L9:
	addl	$1, %esi
	cmpl	%esi, 4(%rsp)
	jne	.L3
.L1:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	.p2align 4,,10
	.p2align 3
.L4:
	.cfi_restore_state
	movslq	%edi, %rdi
	movslq	%ecx, %rcx
	movq	32(%rsp), %r9
	xorl	%edx, %edx
	leaq	0(%rbp,%rdi,4), %rdi
	leaq	(%rax,%rcx,4), %r8
	.p2align 4,,10
	.p2align 3
.L7:
	movss	8(%rdi,%rdx,4), %xmm0
	movq	%rdx, %rcx
	movss	%xmm0, 8(%r8,%rdx,4)
	addq	$1, %rdx
	cmpq	%r9, %rcx
	jne	.L7
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L10:
	addl	%r14d, %ecx
	movslq	%edi, %rdi
	movq	40(%rsp), %r9
	xorl	%edx, %edx
	movslq	%ecx, %rcx
	leaq	(%r12,%rdi,4), %rdi
	leaq	(%rax,%rcx,4), %r8
	.p2align 4,,10
	.p2align 3
.L13:
	movss	8(%rdi,%rdx,4), %xmm0
	movq	%rdx, %rcx
	movss	%xmm0, 8(%r8,%rdx,4)
	addq	$1, %rdx
	cmpq	%rcx, %r9
	jne	.L13
	jmp	.L9
	.cfi_endproc
.LFE39:
	.size	fHorzcat, .-fHorzcat
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
