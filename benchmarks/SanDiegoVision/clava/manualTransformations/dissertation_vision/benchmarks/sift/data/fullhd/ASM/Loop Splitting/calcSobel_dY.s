	.file	"calcSobel_dY.c"
	.text
	.p2align 4
	.globl	calcSobel_dY
	.type	calcSobel_dY, @function
calcSobel_dY:
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
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movl	(%rdi), %r13d
	movl	4(%rdi), %r14d
	movl	%r13d, %esi
	movl	%r14d, %edi
	call	fSetArray@PLT
	pxor	%xmm0, %xmm0
	movl	%r13d, %esi
	movl	%r14d, %edi
	movq	%rax, %r12
	call	fSetArray@PLT
	movl	$3, %esi
	movl	$1, %edi
	movq	%rax, %rbp
	call	iMallocHandle@PLT
	movl	$1, %edi
	movl	$3, %esi
	movq	%rax, %r15
	movq	%rax, 40(%rsp)
	call	iMallocHandle@PLT
	movq	$1, 8(%r15)
	movabsq	$8589934593, %rdi
	movl	$-1, 16(%r15)
	movq	%rax, 56(%rsp)
	movq	%rdi, 8(%rax)
	movl	$1, 16(%rax)
	leal	-1(%r13), %eax
	movl	%eax, 20(%rsp)
	cmpl	$2, %r14d
	jle	.L3
	cmpl	$1, 20(%rsp)
	jle	.L3
	leal	-1(%r14), %eax
	leal	-3(%r13), %edi
	pxor	%xmm8, %xmm8
	movl	(%rbx), %r15d
	movl	%eax, 8(%rsp)
	movq	40(%rsp), %rax
	pxor	%xmm7, %xmm7
	cmpl	$2, %edi
	pxor	%xmm6, %xmm6
	seta	%dl
	cmpq	%rbp, %rbx
	movl	%edi, 68(%rsp)
	cvtsi2ssl	8(%rax), %xmm8
	pxor	%xmm10, %xmm10
	movss	.LC2(%rip), %xmm9
	movaps	.LC1(%rip), %xmm2
	cvtsi2ssl	12(%rax), %xmm7
	movq	%r12, 72(%rsp)
	movl	$1, %r14d
	pxor	%xmm1, %xmm1
	cvtsi2ssl	16(%rax), %xmm6
	movl	0(%rbp), %eax
	movaps	%xmm10, %xmm12
	movaps	%xmm9, %xmm11
	movl	%eax, 12(%rsp)
	setne	%al
	movaps	%xmm8, %xmm5
	andl	%eax, %edx
	leal	-2(%r13), %eax
	movaps	%xmm7, %xmm4
	shufps	$0, %xmm5, %xmm5
	movl	%eax, %r13d
	movl	%eax, 16(%rsp)
	andl	$-4, %eax
	movaps	%xmm6, %xmm3
	leal	1(%rax), %esi
	movl	%eax, 28(%rsp)
	shrl	$2, %r13d
	shufps	$0, %xmm4, %xmm4
	movl	%esi, 64(%rsp)
	leal	2(%rax), %esi
	addl	$3, %eax
	salq	$4, %r13
	movl	%eax, 32(%rsp)
	movl	%edi, %eax
	movl	%esi, %r12d
	shufps	$0, %xmm3, %xmm3
	movb	%dl, 24(%rsp)
	movq	%rax, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L8:
	movl	%r14d, %edx
	addl	$1, %r14d
	movl	%edx, %esi
	leal	-1(%rdx), %ecx
	imull	%r15d, %esi
	imull	%r15d, %ecx
	imull	12(%rsp), %edx
	cmpb	$0, 24(%rsp)
	leal	(%r15,%rsi), %edi
	je	.L33
	movslq	%ecx, %rax
	leaq	12(%rbx,%rax,4), %r11
	movslq	%esi, %rax
	leaq	12(%rbx,%rax,4), %r10
	movslq	%edi, %rax
	leaq	12(%rbx,%rax,4), %r9
	movslq	%edx, %rax
	leaq	12(%rbp,%rax,4), %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	movups	(%r11,%rax), %xmm0
	movups	(%r10,%rax), %xmm13
	mulps	%xmm5, %xmm0
	mulps	%xmm4, %xmm13
	addps	%xmm1, %xmm0
	addps	%xmm13, %xmm0
	movups	(%r9,%rax), %xmm13
	mulps	%xmm3, %xmm13
	addps	%xmm13, %xmm0
	mulps	%xmm2, %xmm0
	movups	%xmm0, (%r8,%rax)
	addq	$16, %rax
	cmpq	%r13, %rax
	jne	.L4
	movl	28(%rsp), %r10d
	cmpl	%r10d, 16(%rsp)
	je	.L7
	movl	64(%rsp), %r11d
	movl	20(%rsp), %r10d
	leal	(%rcx,%r11), %eax
	leal	(%rdi,%r11), %r8d
	cltq
	movslq	%r8d, %r8
	movss	8(%rbx,%rax,4), %xmm13
	leal	(%rsi,%r11), %eax
	cltq
	mulss	%xmm8, %xmm13
	movss	8(%rbx,%rax,4), %xmm0
	leal	(%rdx,%r11), %eax
	cltq
	mulss	%xmm7, %xmm0
	addss	%xmm12, %xmm13
	addss	%xmm0, %xmm13
	movss	8(%rbx,%r8,4), %xmm0
	mulss	%xmm6, %xmm0
	addss	%xmm13, %xmm0
	mulss	%xmm11, %xmm0
	movss	%xmm0, 8(%rbp,%rax,4)
	cmpl	%r12d, %r10d
	jle	.L7
	leal	(%rcx,%r12), %eax
	leal	(%rdi,%r12), %r8d
	movl	32(%rsp), %r9d
	cltq
	movslq	%r8d, %r8
	movss	8(%rbx,%rax,4), %xmm13
	leal	(%rsi,%r12), %eax
	cltq
	mulss	%xmm8, %xmm13
	movss	8(%rbx,%rax,4), %xmm0
	leal	(%rdx,%r12), %eax
	cltq
	mulss	%xmm7, %xmm0
	addss	%xmm12, %xmm13
	addss	%xmm0, %xmm13
	movss	8(%rbx,%r8,4), %xmm0
	mulss	%xmm6, %xmm0
	addss	%xmm13, %xmm0
	mulss	%xmm11, %xmm0
	movss	%xmm0, 8(%rbp,%rax,4)
	cmpl	%r9d, %r10d
	jle	.L7
	leal	(%rcx,%r9), %eax
	cltq
	movss	8(%rbx,%rax,4), %xmm13
	leal	(%rsi,%r9), %eax
	cltq
	mulss	%xmm8, %xmm13
	movss	8(%rbx,%rax,4), %xmm0
	leal	(%rdx,%r9), %eax
	leal	(%rdi,%r9), %edx
	movslq	%edx, %rdx
	cltq
	mulss	%xmm7, %xmm0
	addss	%xmm12, %xmm13
	addss	%xmm0, %xmm13
	movss	8(%rbx,%rdx,4), %xmm0
	mulss	%xmm6, %xmm0
	addss	%xmm13, %xmm0
	mulss	%xmm11, %xmm0
	movss	%xmm0, 8(%rbp,%rax,4)
.L7:
	cmpl	8(%rsp), %r14d
	jne	.L8
	movq	72(%rsp), %r12
	movl	68(%rsp), %esi
	pxor	%xmm5, %xmm5
	pxor	%xmm2, %xmm2
	movaps	.LC3(%rip), %xmm3
	movss	.LC4(%rip), %xmm4
	movl	$1, %r11d
	movaps	%xmm5, %xmm7
	movl	(%r12), %eax
	cmpl	$2, %esi
	seta	%dl
	cmpq	%rbp, %r12
	movaps	%xmm4, %xmm6
	movl	%eax, 24(%rsp)
	setne	%al
	andl	%eax, %edx
	movl	16(%rsp), %eax
	movb	%dl, 28(%rsp)
	movl	%eax, %r10d
	andl	$-4, %eax
	movl	%eax, %ebx
	leal	1(%rax), %r15d
	leal	2(%rax), %r13d
	shrl	$2, %r10d
	leal	3(%rax), %r14d
	leal	4(%rax), %eax
	salq	$4, %r10
	movl	%eax, 64(%rsp)
	movl	%esi, %eax
	movq	%rax, 32(%rsp)
	leaq	4(%rbp), %rax
	movq	%rax, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L17:
	movl	12(%rsp), %edx
	movl	24(%rsp), %ecx
	imull	%r11d, %edx
	imull	%r11d, %ecx
	cmpb	$0, 28(%rsp)
	je	.L34
	movslq	%edx, %rax
	leaq	8(,%rax,4), %rax
	leaq	0(%rbp,%rax), %r9
	leaq	4(%rbp,%rax), %r8
	leaq	8(%rbp,%rax), %rdi
	movslq	%ecx, %rax
	leaq	12(%r12,%rax,4), %rsi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L13:
	movups	(%r8,%rax), %xmm0
	movups	(%r9,%rax), %xmm1
	addps	%xmm0, %xmm0
	addps	%xmm2, %xmm1
	addps	%xmm1, %xmm0
	movups	(%rdi,%rax), %xmm1
	addps	%xmm1, %xmm0
	mulps	%xmm3, %xmm0
	movups	%xmm0, (%rsi,%rax)
	addq	$16, %rax
	cmpq	%r10, %rax
	jne	.L13
	cmpl	16(%rsp), %ebx
	je	.L16
	leal	(%rdx,%rbx), %eax
	movl	20(%rsp), %r9d
	cltq
	movss	8(%rbp,%rax,4), %xmm1
	leal	(%rdx,%r15), %eax
	cltq
	leaq	0(%rbp,%rax,4), %rdi
	addss	%xmm7, %xmm1
	movss	8(%rdi), %xmm0
	leal	(%rdx,%r13), %eax
	cltq
	addss	%xmm0, %xmm0
	leaq	0(%rbp,%rax,4), %rsi
	leal	(%rcx,%r15), %eax
	cltq
	addss	%xmm1, %xmm0
	addss	8(%rsi), %xmm0
	mulss	%xmm6, %xmm0
	movss	%xmm0, 8(%r12,%rax,4)
	cmpl	%r13d, %r9d
	jle	.L16
	movss	8(%rdi), %xmm1
	movss	8(%rsi), %xmm0
	leal	(%rdx,%r14), %eax
	cltq
	addss	%xmm7, %xmm1
	addss	%xmm0, %xmm0
	leaq	0(%rbp,%rax,4), %rdi
	leal	(%rcx,%r13), %eax
	cltq
	addss	%xmm1, %xmm0
	addss	8(%rdi), %xmm0
	mulss	%xmm6, %xmm0
	movss	%xmm0, 8(%r12,%rax,4)
	cmpl	%r14d, %r9d
	jle	.L16
	movss	8(%rsi), %xmm1
	movss	8(%rdi), %xmm0
	leal	(%rcx,%r14), %eax
	addl	64(%rsp), %edx
	cltq
	addss	%xmm7, %xmm1
	addss	%xmm0, %xmm0
	movslq	%edx, %rdx
	addss	%xmm1, %xmm0
	addss	8(%rbp,%rdx,4), %xmm0
	mulss	%xmm6, %xmm0
	movss	%xmm0, 8(%r12,%rax,4)
.L16:
	addl	$1, %r11d
	cmpl	8(%rsp), %r11d
	jne	.L17
.L3:
	movq	%rbp, %rdi
	call	fFreeHandle@PLT
	movq	40(%rsp), %rdi
	call	iFreeHandle@PLT
	movq	56(%rsp), %rdi
	call	iFreeHandle@PLT
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
.L33:
	.cfi_restore_state
	movslq	%ecx, %rcx
	movslq	%esi, %rsi
	movslq	%edi, %rdi
	movslq	%edx, %rdx
	movq	48(%rsp), %r9
	leaq	(%rbx,%rcx,4), %rcx
	leaq	(%rbx,%rsi,4), %rsi
	xorl	%eax, %eax
	leaq	(%rbx,%rdi,4), %rdi
	leaq	0(%rbp,%rdx,4), %r8
	.p2align 4,,10
	.p2align 3
.L6:
	movss	12(%rcx,%rax,4), %xmm13
	movss	12(%rsi,%rax,4), %xmm0
	movq	%rax, %rdx
	mulss	%xmm8, %xmm13
	mulss	%xmm7, %xmm0
	addss	%xmm10, %xmm13
	addss	%xmm0, %xmm13
	movss	12(%rdi,%rax,4), %xmm0
	mulss	%xmm6, %xmm0
	addss	%xmm13, %xmm0
	mulss	%xmm9, %xmm0
	movss	%xmm0, 12(%r8,%rax,4)
	addq	$1, %rax
	cmpq	%r9, %rdx
	jne	.L6
	jmp	.L7
.L34:
	movslq	%edx, %rdx
	movq	48(%rsp), %rdi
	movslq	%ecx, %rcx
	leaq	0(%rbp,%rdx,4), %rax
	addq	32(%rsp), %rdx
	leaq	(%r12,%rcx,4), %rcx
	leaq	(%rdi,%rdx,4), %rdx
	.p2align 4,,10
	.p2align 3
.L15:
	movss	8(%rax), %xmm1
	movss	12(%rax), %xmm0
	addq	$4, %rax
	addq	$4, %rcx
	addss	%xmm5, %xmm1
	addss	%xmm0, %xmm0
	addss	%xmm1, %xmm0
	addss	12(%rax), %xmm0
	mulss	%xmm4, %xmm0
	movss	%xmm0, 8(%rcx)
	cmpq	%rdx, %rax
	jne	.L15
	jmp	.L16
	.cfi_endproc
.LFE39:
	.size	calcSobel_dY, .-calcSobel_dY
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	1056964608
	.long	1056964608
	.long	1056964608
	.long	1056964608
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC2:
	.long	1056964608
	.section	.rodata.cst16
	.align 16
.LC3:
	.long	1048576000
	.long	1048576000
	.long	1048576000
	.long	1048576000
	.section	.rodata.cst4
	.align 4
.LC4:
	.long	1048576000
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
