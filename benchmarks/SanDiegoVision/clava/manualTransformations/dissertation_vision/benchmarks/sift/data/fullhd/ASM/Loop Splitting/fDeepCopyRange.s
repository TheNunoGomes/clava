	.file	"fDeepCopyRange.c"
	.text
	.p2align 4
	.globl	fDeepCopyRange
	.type	fDeepCopyRange, @function
fDeepCopyRange:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%ecx, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leal	(%rdx,%rsi), %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leal	(%r8,%rcx), %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%r8d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	movl	%edx, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebx
	movl	%r8d, %esi
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movl	%ecx, 28(%rsp)
	movl	%r14d, 4(%rsp)
	call	fMallocHandle@PLT
	cmpl	%r14d, %ebx
	jge	.L1
	movl	%r15d, %ecx
	cmpl	%r13d, %r15d
	jge	.L1
	leal	-1(%r12), %edx
	movl	%r12d, %r11d
	movl	0(%rbp), %esi
	movl	%r12d, %r9d
	cmpl	$3, %edx
	seta	%r14b
	cmpq	%rbp, %rax
	movl	%esi, 16(%rsp)
	setne	%dl
	andl	$-4, %r11d
	shrl	$2, %r9d
	xorl	%r10d, %r10d
	andl	%edx, %r14d
	movl	%ecx, %edx
	leal	(%r15,%r11), %edi
	salq	$4, %r9
	notl	%edx
	leal	2(%rdi), %esi
	movl	%edi, 20(%rsp)
	leal	1(%rdi), %r15d
	addl	%r13d, %edx
	movl	%esi, 24(%rsp)
	leaq	4(,%rdx,4), %r8
	movslq	%ecx, %rdx
	leaq	2(%rdx), %rdi
	movq	%rdi, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L3:
	movl	16(%rsp), %ecx
	imull	%ebx, %ecx
	testb	%r14b, %r14b
	je	.L16
	movslq	%ecx, %rdx
	addq	8(%rsp), %rdx
	leaq	0(%rbp,%rdx,4), %rdi
	movslq	%r10d, %rdx
	leaq	8(%rax,%rdx,4), %rsi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L4:
	movups	(%rdi,%rdx), %xmm1
	movups	%xmm1, (%rsi,%rdx)
	addq	$16, %rdx
	cmpq	%r9, %rdx
	jne	.L4
	leal	(%r10,%r11), %edx
	cmpl	%r11d, %r12d
	je	.L7
	movl	20(%rsp), %esi
	movslq	%edx, %rdx
	leaq	(%rax,%rdx,4), %rdx
	addl	%ecx, %esi
	movslq	%esi, %rsi
	movss	8(%rbp,%rsi,4), %xmm0
	movss	%xmm0, 8(%rdx)
	cmpl	%r15d, %r13d
	jle	.L7
	leal	(%rcx,%r15), %esi
	movl	24(%rsp), %edi
	movslq	%esi, %rsi
	movss	8(%rbp,%rsi,4), %xmm0
	movss	%xmm0, 12(%rdx)
	cmpl	%edi, %r13d
	jle	.L7
	addl	%edi, %ecx
	movslq	%ecx, %rcx
	movss	8(%rbp,%rcx,4), %xmm0
	movss	%xmm0, 16(%rdx)
.L7:
	addl	%r12d, %r10d
	addl	$1, %ebx
	cmpl	%ebx, 4(%rsp)
	jne	.L3
.L1:
	addq	$40, %rsp
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
.L16:
	.cfi_restore_state
	addl	28(%rsp), %ecx
	movslq	%r10d, %rdx
	movslq	%ecx, %rcx
	leaq	0(%rbp,%rcx,4), %rsi
	leaq	(%rax,%rdx,4), %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L6:
	movss	8(%rsi,%rdx), %xmm0
	movss	%xmm0, 8(%rcx,%rdx)
	addq	$4, %rdx
	cmpq	%r8, %rdx
	jne	.L6
	jmp	.L7
	.cfi_endproc
.LFE39:
	.size	fDeepCopyRange, .-fDeepCopyRange
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
