	.file	"ifMtimes.c"
	.text
	.p2align 4
	.globl	ifMtimes
	.type	ifMtimes, @function
ifMtimes:
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movl	4(%rdi), %r15d
	movl	(%rsi), %r13d
	movl	(%rdi), %ebp
	movl	%r13d, %esi
	movl	%r15d, %edi
	movl	%r15d, 48(%rsp)
	call	fMallocHandle@PLT
	movq	%rax, 40(%rsp)
	testl	%r15d, %r15d
	jle	.L1
	testl	%r13d, %r13d
	jle	.L1
	movl	(%rax), %eax
	xorl	%r15d, %r15d
	pxor	%xmm3, %xmm3
	movl	%eax, 52(%rsp)
	leal	-1(%rbp), %eax
	movl	%eax, 24(%rsp)
	movl	%ebp, %eax
	shrl	$2, %eax
	salq	$4, %rax
	movq	%rax, 32(%rsp)
	movl	%ebp, %eax
	andl	$-4, %eax
	movl	%eax, 28(%rsp)
	leaq	8(%r12), %rax
	movq	%rax, 56(%rsp)
	leal	-1(%r13), %eax
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L4:
	movl	52(%rsp), %eax
	movq	40(%rsp), %rdi
	xorl	%r11d, %r11d
	movq	56(%rsp), %r13
	imull	%r15d, %eax
	cltq
	leaq	(%rdi,%rax,4), %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L11:
	movl	%r11d, %r14d
	movaps	%xmm3, %xmm2
	testl	%ebp, %ebp
	jle	.L10
	movl	(%rbx), %r8d
	movl	(%r12), %edi
	imull	%r15d, %r8d
	cmpl	$2, 24(%rsp)
	jbe	.L12
	movq	32(%rsp), %rsi
	movslq	%r8d, %rdx
	movslq	%edi, %rax
	movaps	%xmm3, %xmm2
	leaq	8(%rbx,%rdx,4), %rdx
	movq	%rax, %r10
	leaq	0(,%rax,4), %rcx
	leaq	(%rdx,%rsi), %r9
	leaq	(%rax,%rax,2), %rsi
	salq	$4, %r10
	movq	%r13, %rax
	salq	$2, %rsi
	.p2align 4,,10
	.p2align 3
.L6:
	movss	(%rax,%rcx), %xmm1
	movss	(%rax,%rsi), %xmm4
	addq	$16, %rdx
	movss	(%rax,%rcx,2), %xmm5
	movss	(%rax), %xmm0
	addq	%r10, %rax
	movdqu	-16(%rdx), %xmm6
	unpcklps	%xmm1, %xmm0
	unpcklps	%xmm4, %xmm5
	movlhps	%xmm5, %xmm0
	cvtdq2ps	%xmm6, %xmm1
	mulps	%xmm1, %xmm0
	addss	%xmm0, %xmm2
	movaps	%xmm0, %xmm1
	shufps	$85, %xmm0, %xmm1
	addss	%xmm1, %xmm2
	movaps	%xmm0, %xmm1
	unpckhps	%xmm0, %xmm1
	shufps	$255, %xmm0, %xmm0
	addss	%xmm1, %xmm2
	addss	%xmm0, %xmm2
	cmpq	%r9, %rdx
	jne	.L6
	movl	28(%rsp), %eax
	cmpl	%ebp, %eax
	je	.L10
.L5:
	movl	%edi, %ecx
	leal	(%r8,%rax), %edx
	pxor	%xmm0, %xmm0
	imull	%eax, %ecx
	movslq	%edx, %rdx
	cvtsi2ssl	8(%rbx,%rdx,4), %xmm0
	leal	(%rcx,%r14), %edx
	movslq	%edx, %rdx
	mulss	8(%r12,%rdx,4), %xmm0
	leal	1(%rax), %edx
	addss	%xmm0, %xmm2
	cmpl	%edx, %ebp
	jle	.L10
	addl	%r8d, %edx
	addl	%edi, %ecx
	pxor	%xmm0, %xmm0
	addl	$2, %eax
	movslq	%edx, %rdx
	cvtsi2ssl	8(%rbx,%rdx,4), %xmm0
	leal	(%r14,%rcx), %edx
	movslq	%edx, %rdx
	mulss	8(%r12,%rdx,4), %xmm0
	addss	%xmm0, %xmm2
	cmpl	%eax, %ebp
	jle	.L10
	addl	%ecx, %edi
	addl	%r8d, %eax
	pxor	%xmm0, %xmm0
	addl	%edi, %r14d
	cltq
	movslq	%r14d, %r14
	cvtsi2ssl	8(%rbx,%rax,4), %xmm0
	mulss	8(%r12,%r14,4), %xmm0
	addss	%xmm0, %xmm2
.L10:
	movq	8(%rsp), %rax
	addq	$4, %r13
	movss	%xmm2, 8(%rax,%r11,4)
	leaq	1(%r11), %rax
	cmpq	16(%rsp), %r11
	je	.L8
	movq	%rax, %r11
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L8:
	addl	$1, %r15d
	cmpl	%r15d, 48(%rsp)
	jne	.L4
.L1:
	movq	40(%rsp), %rax
	addq	$72, %rsp
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
.L12:
	.cfi_restore_state
	movaps	%xmm3, %xmm2
	xorl	%eax, %eax
	jmp	.L5
	.cfi_endproc
.LFE39:
	.size	ifMtimes, .-ifMtimes
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
