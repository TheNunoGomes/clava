	.file	"imageBlur.c"
	.text
	.p2align 4
	.globl	imageBlur
	.type	imageBlur, @function
imageBlur:
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
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movl	(%rdi), %r12d
	movl	4(%rdi), %r13d
	movl	%r12d, %esi
	movl	%r13d, %edi
	call	fSetArray@PLT
	pxor	%xmm0, %xmm0
	movl	%r12d, %esi
	movl	%r13d, %edi
	movq	%rax, 16(%rsp)
	call	fSetArray@PLT
	movl	$5, %esi
	movl	$1, %edi
	movq	%rax, %rbp
	call	iMallocHandle@PLT
	movdqa	.LC1(%rip), %xmm0
	movq	%rax, 56(%rsp)
	movl	$1, 24(%rax)
	movups	%xmm0, 8(%rax)
	leal	-2(%r12), %eax
	movl	%eax, 28(%rsp)
	cmpl	$4, %r13d
	jle	.L3
	cmpl	$2, 28(%rsp)
	jle	.L3
	leal	-2(%r13), %eax
	leal	-5(%r12), %esi
	movl	(%rbx), %r15d
	pxor	%xmm5, %xmm5
	movl	%eax, 12(%rsp)
	movl	0(%rbp), %eax
	movl	$2, %r9d
	pxor	%xmm2, %xmm2
	movl	%esi, 32(%rsp)
	movss	.LC3(%rip), %xmm4
	movl	%eax, 4(%rsp)
	leal	-4(%r12), %eax
	movaps	.LC2(%rip), %xmm3
	movl	%eax, %esi
	movl	%eax, 24(%rsp)
	andl	$-4, %eax
	movl	%eax, (%rsp)
	addl	$2, %eax
	shrl	$2, %esi
	movl	%eax, 8(%rsp)
	salq	$4, %rsi
	.p2align 4,,10
	.p2align 3
.L6:
	movl	4(%rsp), %r10d
	movl	%r9d, %eax
	imull	%r15d, %eax
	imull	%r9d, %r10d
	cmpl	$2, 32(%rsp)
	jbe	.L31
	movslq	%eax, %rdx
	leaq	8(,%rdx,4), %rdx
	leaq	(%rbx,%rdx), %r13
	leaq	4(%rbx,%rdx), %r12
	leaq	8(%rbx,%rdx), %r11
	leaq	12(%rbx,%rdx), %r8
	leaq	16(%rbx,%rdx), %rdi
	movslq	%r10d, %rdx
	leaq	16(%rbp,%rdx,4), %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L4:
	movdqu	0(%r13,%rdx), %xmm7
	movdqu	(%r12,%rdx), %xmm1
	movdqu	(%r11,%rdx), %xmm6
	cvtdq2ps	%xmm7, %xmm0
	addps	%xmm2, %xmm0
	pslld	$2, %xmm1
	movdqu	(%rdi,%rdx), %xmm7
	cvtdq2ps	%xmm1, %xmm1
	addps	%xmm1, %xmm0
	movdqu	(%r11,%rdx), %xmm1
	pslld	$1, %xmm1
	paddd	%xmm6, %xmm1
	pslld	$1, %xmm1
	cvtdq2ps	%xmm1, %xmm1
	addps	%xmm1, %xmm0
	movdqu	(%r8,%rdx), %xmm1
	pslld	$2, %xmm1
	cvtdq2ps	%xmm1, %xmm1
	addps	%xmm1, %xmm0
	cvtdq2ps	%xmm7, %xmm1
	addps	%xmm1, %xmm0
	mulps	%xmm3, %xmm0
	movups	%xmm0, (%rcx,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %rsi
	jne	.L4
	movl	(%rsp), %ecx
	cmpl	%ecx, 24(%rsp)
	je	.L5
	movl	8(%rsp), %edx
.L9:
	leal	-2(%rax,%rdx), %ecx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	pxor	%xmm7, %xmm7
	pxor	%xmm6, %xmm6
	leal	(%r10,%rdx), %r13d
	movslq	%ecx, %rcx
	cvtsi2ssl	8(%rbx,%rcx,4), %xmm0
	leal	-1(%rax,%rdx), %ecx
	movslq	%r13d, %r13
	movslq	%ecx, %rcx
	movl	8(%rbx,%rcx,4), %r11d
	leal	0(,%r11,4), %ecx
	addss	%xmm5, %xmm0
	cvtsi2ssl	%ecx, %xmm1
	leal	(%rax,%rdx), %ecx
	movslq	%ecx, %rcx
	movl	8(%rbx,%rcx,4), %r8d
	leal	(%r8,%r8,2), %ecx
	addss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	addl	%ecx, %ecx
	cvtsi2ssl	%ecx, %xmm1
	leal	1(%rdx), %ecx
	leal	(%rax,%rcx), %edi
	movslq	%edi, %rdi
	movl	8(%rbx,%rdi,4), %r14d
	addss	%xmm0, %xmm1
	leal	0(,%r14,4), %edi
	cvtsi2ssl	%edi, %xmm7
	leal	2(%rdx), %edi
	leal	(%rax,%rdi), %r12d
	movslq	%r12d, %r12
	movl	8(%rbx,%r12,4), %r12d
	addss	%xmm7, %xmm1
	cvtsi2ssl	%r12d, %xmm6
	addss	%xmm6, %xmm1
	mulss	%xmm4, %xmm1
	movss	%xmm1, 8(%rbp,%r13,4)
	movl	28(%rsp), %r13d
	cmpl	%ecx, %r13d
	jle	.L5
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	addl	%r10d, %ecx
	cvtsi2ssl	%r11d, %xmm1
	leal	0(,%r8,4), %r11d
	movslq	%ecx, %rcx
	cvtsi2ssl	%r11d, %xmm0
	leal	(%r14,%r14,2), %r11d
	addl	%r11d, %r11d
	addss	%xmm5, %xmm1
	addss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%r11d, %xmm0
	leal	0(,%r12,4), %r11d
	addss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%r11d, %xmm1
	leal	3(%rax,%rdx), %r11d
	movslq	%r11d, %r11
	addss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	8(%rbx,%r11,4), %xmm1
	addss	%xmm0, %xmm1
	mulss	%xmm4, %xmm1
	movss	%xmm1, 8(%rbp,%rcx,4)
	cmpl	%edi, %r13d
	jle	.L5
	pxor	%xmm0, %xmm0
	leal	(%r12,%r12,2), %ecx
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%r8d, %xmm0
	addl	%ecx, %ecx
	leal	4(%rax,%rdx), %eax
	cvtsi2ssl	%ecx, %xmm1
	movl	8(%rbx,%r11,4), %ecx
	cltq
	sall	$2, %ecx
	addss	%xmm5, %xmm0
	addss	%xmm7, %xmm0
	addss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	leal	(%r10,%rdi), %ecx
	movslq	%ecx, %rcx
	addss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ssl	8(%rbx,%rax,4), %xmm0
	addss	%xmm1, %xmm0
	mulss	%xmm4, %xmm0
	movss	%xmm0, 8(%rbp,%rcx,4)
.L5:
	addl	$1, %r9d
	cmpl	12(%rsp), %r9d
	jne	.L6
	movq	16(%rsp), %rax
	cmpl	$2, 32(%rsp)
	movl	$2, (%rsp)
	pxor	%xmm8, %xmm8
	seta	%dl
	movaps	.LC2(%rip), %xmm4
	movss	.LC6(%rip), %xmm5
	movaps	%xmm8, %xmm11
	cmpq	%rbp, %rax
	movl	(%rax), %esi
	movss	.LC7(%rip), %xmm7
	setne	%al
	movl	4(%rsp), %r13d
	movaps	%xmm5, %xmm6
	movss	.LC3(%rip), %xmm9
	andl	%eax, %edx
	movl	24(%rsp), %eax
	movl	%esi, 36(%rsp)
	movaps	%xmm7, %xmm10
	movb	%dl, 43(%rsp)
	movaps	.LC4(%rip), %xmm1
	movl	%eax, %r15d
	andl	$-4, %eax
	movaps	.LC5(%rip), %xmm3
	leal	3(%rax), %esi
	movl	%eax, 44(%rsp)
	leal	2(%rax), %r14d
	addl	$4, %eax
	movl	%esi, 48(%rsp)
	shrl	$2, %r15d
	movl	%eax, 52(%rsp)
	salq	$4, %r15
	.p2align 4,,10
	.p2align 3
.L15:
	movl	(%rsp), %esi
	movl	%esi, %eax
	addl	$1, %esi
	leal	-2(%rax), %edx
	movl	%esi, (%rsp)
	movl	%r13d, %esi
	leal	2(%rax), %ecx
	imull	%r13d, %edx
	imull	%eax, %esi
	imull	%r13d, %ecx
	movl	%edx, 8(%rsp)
	leal	-1(%rax), %edx
	imull	36(%rsp), %eax
	leal	0(%r13,%rsi), %r12d
	imull	%r13d, %edx
	cmpb	$0, 43(%rsp)
	movl	%eax, 4(%rsp)
	je	.L32
	movslq	8(%rsp), %rax
	movq	16(%rsp), %rdi
	pxor	%xmm2, %xmm2
	leaq	16(%rbp,%rax,4), %rbx
	movslq	%edx, %rax
	leaq	16(%rbp,%rax,4), %r11
	movslq	%esi, %rax
	leaq	16(%rbp,%rax,4), %r10
	movslq	%r12d, %rax
	leaq	16(%rbp,%rax,4), %r9
	movslq	%ecx, %rax
	leaq	16(%rbp,%rax,4), %r8
	movslq	4(%rsp), %rax
	leaq	16(%rdi,%rax,4), %rdi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L11:
	movups	(%r11,%rax), %xmm0
	movups	(%rbx,%rax), %xmm12
	movups	(%r8,%rax), %xmm13
	mulps	%xmm1, %xmm0
	addps	%xmm2, %xmm12
	addps	%xmm12, %xmm0
	movups	(%r10,%rax), %xmm12
	mulps	%xmm3, %xmm12
	addps	%xmm12, %xmm0
	movups	(%r9,%rax), %xmm12
	mulps	%xmm1, %xmm12
	addps	%xmm12, %xmm0
	addps	%xmm13, %xmm0
	mulps	%xmm4, %xmm0
	movups	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpq	%r15, %rax
	jne	.L11
	movl	24(%rsp), %ebx
	cmpl	%ebx, 44(%rsp)
	je	.L14
	movl	8(%rsp), %r10d
	leal	(%rcx,%r14), %edi
	movl	4(%rsp), %r9d
	movslq	%edi, %rdi
	movq	16(%rsp), %r8
	movl	28(%rsp), %r11d
	leal	(%r10,%r14), %eax
	movl	48(%rsp), %ebx
	cltq
	movss	8(%rbp,%rax,4), %xmm0
	leal	(%rdx,%r14), %eax
	cltq
	movss	8(%rbp,%rax,4), %xmm2
	addss	%xmm11, %xmm0
	leal	(%rsi,%r14), %eax
	cltq
	mulss	%xmm6, %xmm2
	addss	%xmm0, %xmm2
	movss	8(%rbp,%rax,4), %xmm0
	leal	(%r12,%r14), %eax
	cltq
	mulss	%xmm10, %xmm0
	addss	%xmm0, %xmm2
	movss	8(%rbp,%rax,4), %xmm0
	leal	(%r9,%r14), %eax
	cltq
	mulss	%xmm6, %xmm0
	addss	%xmm2, %xmm0
	addss	8(%rbp,%rdi,4), %xmm0
	movss	.LC3(%rip), %xmm2
	mulss	%xmm2, %xmm0
	movss	%xmm0, 8(%r8,%rax,4)
	cmpl	%ebx, %r11d
	jle	.L14
	movl	%r10d, %eax
	leal	(%rcx,%rbx), %edi
	addl	%ebx, %eax
	movslq	%edi, %rdi
	cltq
	movss	8(%rbp,%rax,4), %xmm0
	leal	(%rdx,%rbx), %eax
	cltq
	movss	8(%rbp,%rax,4), %xmm12
	addss	%xmm11, %xmm0
	leal	(%rsi,%rbx), %eax
	cltq
	mulss	%xmm6, %xmm12
	addss	%xmm0, %xmm12
	movss	8(%rbp,%rax,4), %xmm0
	leal	(%r12,%rbx), %eax
	cltq
	mulss	%xmm10, %xmm0
	addss	%xmm0, %xmm12
	movss	8(%rbp,%rax,4), %xmm0
	movl	%r9d, %eax
	addl	%ebx, %eax
	mulss	%xmm6, %xmm0
	cltq
	addss	%xmm12, %xmm0
	addss	8(%rbp,%rdi,4), %xmm0
	movl	52(%rsp), %edi
	mulss	%xmm2, %xmm0
	movss	%xmm0, 8(%r8,%rax,4)
	cmpl	%edi, %r11d
	jle	.L14
	movl	%r10d, %eax
	addl	%edi, %eax
	cltq
	movss	8(%rbp,%rax,4), %xmm0
	leal	(%rdx,%rdi), %eax
	leal	(%rcx,%rdi), %edx
	cltq
	movslq	%edx, %rdx
	movss	8(%rbp,%rax,4), %xmm12
	addss	%xmm11, %xmm0
	leal	(%rsi,%rdi), %eax
	cltq
	mulss	%xmm6, %xmm12
	addss	%xmm0, %xmm12
	movss	8(%rbp,%rax,4), %xmm0
	leal	(%r12,%rdi), %eax
	cltq
	mulss	%xmm10, %xmm0
	addss	%xmm0, %xmm12
	movss	8(%rbp,%rax,4), %xmm0
	movl	%r9d, %eax
	addl	%edi, %eax
	mulss	%xmm6, %xmm0
	cltq
	addss	%xmm12, %xmm0
	addss	8(%rbp,%rdx,4), %xmm0
	mulss	%xmm0, %xmm2
	movss	%xmm2, 8(%r8,%rax,4)
.L14:
	movl	(%rsp), %esi
	cmpl	%esi, 12(%rsp)
	jne	.L15
.L3:
	movq	%rbp, %rdi
	call	fFreeHandle@PLT
	movq	56(%rsp), %rdi
	call	iFreeHandle@PLT
	movq	16(%rsp), %rax
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
.L32:
	.cfi_restore_state
	movslq	8(%rsp), %rax
	movq	16(%rsp), %rbx
	movslq	%edx, %rdx
	movslq	%esi, %rsi
	movslq	%r12d, %r12
	movslq	%ecx, %rcx
	movl	32(%rsp), %edi
	leaq	0(%rbp,%rdx,4), %r9
	leaq	0(%rbp,%rax,4), %r8
	movslq	4(%rsp), %rax
	leaq	0(%rbp,%rsi,4), %rsi
	leaq	0(%rbp,%r12,4), %r10
	leaq	0(%rbp,%rcx,4), %rcx
	leaq	(%rbx,%rax,4), %r11
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L13:
	movss	16(%r9,%rax,4), %xmm2
	movss	16(%r8,%rax,4), %xmm0
	movq	%rax, %rdx
	mulss	%xmm5, %xmm2
	addss	%xmm8, %xmm0
	addss	%xmm0, %xmm2
	movss	16(%rsi,%rax,4), %xmm0
	mulss	%xmm7, %xmm0
	addss	%xmm0, %xmm2
	movss	16(%r10,%rax,4), %xmm0
	mulss	%xmm5, %xmm0
	addss	%xmm2, %xmm0
	addss	16(%rcx,%rax,4), %xmm0
	mulss	%xmm9, %xmm0
	movss	%xmm0, 16(%r11,%rax,4)
	addq	$1, %rax
	cmpq	%rdi, %rdx
	jne	.L13
	jmp	.L14
.L31:
	movl	$2, %edx
	jmp	.L9
	.cfi_endproc
.LFE39:
	.size	imageBlur, .-imageBlur
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	1
	.long	4
	.long	6
	.long	4
	.align 16
.LC2:
	.long	1031798784
	.long	1031798784
	.long	1031798784
	.long	1031798784
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC3:
	.long	1031798784
	.section	.rodata.cst16
	.align 16
.LC4:
	.long	1082130432
	.long	1082130432
	.long	1082130432
	.long	1082130432
	.align 16
.LC5:
	.long	1086324736
	.long	1086324736
	.long	1086324736
	.long	1086324736
	.section	.rodata.cst4
	.align 4
.LC6:
	.long	1082130432
	.align 4
.LC7:
	.long	1086324736
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
