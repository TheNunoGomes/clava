	.file	"imageResize.c"
	.text
	.p2align 4
	.globl	imageResize
	.type	imageResize, @function
imageResize:
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
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movl	(%rdi), %r14d
	movl	4(%rdi), %r13d
	leal	1(%r14), %edx
	movl	%r13d, %edi
	movl	%r14d, 84(%rsp)
	movl	%edx, %eax
	shrl	$31, %eax
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %esi
	movl	%eax, %r15d
	movl	%eax, 36(%rsp)
	call	fSetArray@PLT
	pxor	%xmm0, %xmm0
	movl	%r15d, %esi
	movq	%rax, %rbp
	leal	1(%r13), %eax
	movl	%eax, %edi
	shrl	$31, %edi
	addl	%eax, %edi
	sarl	%edi
	call	fSetArray@PLT
	movl	$5, %esi
	movl	$1, %edi
	movq	%rax, 24(%rsp)
	call	iMallocHandle@PLT
	movdqa	.LC1(%rip), %xmm0
	movq	%rax, 104(%rsp)
	movl	$1, 24(%rax)
	movups	%xmm0, 8(%rax)
	leal	-2(%r13), %eax
	movl	%eax, 20(%rsp)
	cmpl	$2, %eax
	jle	.L3
	leal	-2(%r14), %r12d
	cmpl	$2, %r12d
	jle	.L10
	movl	(%rbx), %eax
	movss	.LC5(%rip), %xmm3
	movl	$2, %r11d
	pxor	%xmm9, %xmm9
	movss	.LC6(%rip), %xmm8
	movss	.LC7(%rip), %xmm7
	pxor	%xmm4, %xmm4
	movl	%eax, 16(%rsp)
	movl	0(%rbp), %eax
	movaps	.LC2(%rip), %xmm2
	movaps	.LC3(%rip), %xmm6
	movl	%eax, 8(%rsp)
	movl	84(%rsp), %eax
	movaps	.LC4(%rip), %xmm5
	subl	$5, %eax
	cmpq	%rbp, %rbx
	setne	%cl
	cmpl	$7, %eax
	seta	%dl
	andl	%edx, %ecx
	movl	%eax, %edx
	shrl	%eax
	shrl	$3, %edx
	movb	%cl, 12(%rsp)
	addq	%rax, %rax
	movl	%edx, %r10d
	sall	$2, %edx
	movq	%rax, 88(%rsp)
	leaq	8(%rbx), %rax
	leal	1(%rdx), %ecx
	movl	%edx, 44(%rsp)
	salq	$4, %r10
	leal	(%rcx,%rcx), %r13d
	movl	%ecx, 52(%rsp)
	leal	1(%r13), %esi
	leal	-2(%r13), %ecx
	movq	%rax, 96(%rsp)
	movl	%ecx, 40(%rsp)
	leal	-1(%r13), %ecx
	leal	2(%r13), %r14d
	movl	%esi, 48(%rsp)
	leal	2(%rdx), %esi
	addl	$3, %edx
	leal	4(%r13), %r15d
	movl	%ecx, 32(%rsp)
	leal	3(%r13), %ecx
	movl	%edx, 80(%rsp)
	leal	7(%r13), %edx
	movl	%ecx, 56(%rsp)
	leal	5(%r13), %ecx
	movl	%esi, 60(%rsp)
	leal	6(%r13), %esi
	movl	%edx, 72(%rsp)
	leal	8(%r13), %edx
	movl	%ecx, 64(%rsp)
	movl	%esi, 68(%rsp)
	movl	%edx, 76(%rsp)
	.p2align 4,,10
	.p2align 3
.L7:
	movl	16(%rsp), %edx
	movl	8(%rsp), %r8d
	imull	%r11d, %edx
	imull	%r11d, %r8d
	cmpb	$0, 12(%rsp)
	je	.L30
	movslq	%edx, %rax
	leaq	8(,%rax,4), %rax
	leaq	(%rbx,%rax), %rdi
	leaq	8(%rbx,%rax), %rsi
	leaq	16(%rbx,%rax), %rcx
	movslq	%r8d, %rax
	leaq	8(%rbp,%rax,4), %r9
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	movups	16(%rdi,%rax,2), %xmm13
	movups	(%rdi,%rax,2), %xmm10
	movups	(%rsi,%rax,2), %xmm1
	movups	16(%rsi,%rax,2), %xmm15
	movaps	%xmm10, %xmm0
	shufps	$221, %xmm13, %xmm10
	mulps	%xmm2, %xmm10
	shufps	$136, %xmm13, %xmm0
	addps	%xmm4, %xmm0
	movups	16(%rcx,%rax,2), %xmm13
	addps	%xmm10, %xmm0
	movaps	%xmm1, %xmm10
	shufps	$221, %xmm15, %xmm1
	shufps	$136, %xmm15, %xmm10
	mulps	%xmm6, %xmm10
	mulps	%xmm2, %xmm1
	addps	%xmm10, %xmm0
	addps	%xmm1, %xmm0
	movups	(%rcx,%rax,2), %xmm1
	shufps	$136, %xmm13, %xmm1
	addps	%xmm1, %xmm0
	mulps	%xmm5, %xmm0
	movups	%xmm0, (%r9,%rax)
	addq	$16, %rax
	cmpq	%r10, %rax
	jne	.L4
	movl	40(%rsp), %eax
	addl	%edx, %eax
	cltq
	movss	8(%rbx,%rax,4), %xmm0
	movl	32(%rsp), %eax
	addl	%edx, %eax
	addss	%xmm9, %xmm0
	cltq
	movss	8(%rbx,%rax,4), %xmm1
	leal	(%rdx,%r13), %eax
	cltq
	mulss	%xmm3, %xmm1
	leaq	(%rbx,%rax,4), %rdi
	movl	48(%rsp), %eax
	addl	%edx, %eax
	cltq
	leaq	(%rbx,%rax,4), %rsi
	leal	(%rdx,%r14), %eax
	addss	%xmm0, %xmm1
	movss	8(%rdi), %xmm0
	cltq
	leaq	(%rbx,%rax,4), %rcx
	movl	44(%rsp), %eax
	mulss	%xmm8, %xmm0
	addl	%r8d, %eax
	cltq
	addss	%xmm0, %xmm1
	movss	8(%rsi), %xmm0
	mulss	%xmm3, %xmm0
	addss	%xmm1, %xmm0
	addss	8(%rcx), %xmm0
	mulss	%xmm7, %xmm0
	movss	%xmm0, 8(%rbp,%rax,4)
	cmpl	%r14d, %r12d
	jle	.L5
	movss	8(%rsi), %xmm1
	movss	8(%rdi), %xmm0
	leal	(%rdx,%r15), %esi
	movl	56(%rsp), %eax
	movslq	%esi, %rsi
	movl	52(%rsp), %edi
	mulss	%xmm3, %xmm1
	addss	%xmm9, %xmm0
	leaq	(%rbx,%rsi,4), %rsi
	addl	%edx, %eax
	addl	%r8d, %edi
	cltq
	movslq	%edi, %rdi
	addss	%xmm0, %xmm1
	movss	8(%rcx), %xmm0
	mulss	%xmm8, %xmm0
	addss	%xmm0, %xmm1
	movss	8(%rbx,%rax,4), %xmm0
	mulss	%xmm3, %xmm0
	addss	%xmm1, %xmm0
	addss	8(%rsi), %xmm0
	mulss	%xmm7, %xmm0
	movss	%xmm0, 8(%rbp,%rdi,4)
	cmpl	%r15d, %r12d
	jle	.L5
	movss	8(%rbx,%rax,4), %xmm1
	movss	8(%rcx), %xmm0
	movl	64(%rsp), %eax
	movl	68(%rsp), %r9d
	mulss	%xmm3, %xmm1
	addss	%xmm9, %xmm0
	addl	%edx, %eax
	leal	(%rdx,%r9), %ecx
	cltq
	movslq	%ecx, %rcx
	leaq	(%rbx,%rcx,4), %rdi
	movl	60(%rsp), %ecx
	addss	%xmm0, %xmm1
	movss	8(%rsi), %xmm0
	addl	%r8d, %ecx
	movslq	%ecx, %rcx
	mulss	%xmm8, %xmm0
	addss	%xmm0, %xmm1
	movss	8(%rbx,%rax,4), %xmm0
	mulss	%xmm3, %xmm0
	addss	%xmm1, %xmm0
	addss	8(%rdi), %xmm0
	mulss	%xmm7, %xmm0
	movss	%xmm0, 8(%rbp,%rcx,4)
	cmpl	%r9d, %r12d
	jle	.L5
	movss	8(%rbx,%rax,4), %xmm1
	movss	8(%rsi), %xmm0
	movl	72(%rsp), %eax
	mulss	%xmm3, %xmm1
	addss	%xmm9, %xmm0
	addl	%edx, %eax
	addl	76(%rsp), %edx
	cltq
	movslq	%edx, %rdx
	addss	%xmm0, %xmm1
	movss	8(%rdi), %xmm0
	mulss	%xmm8, %xmm0
	addss	%xmm0, %xmm1
	movss	8(%rbx,%rax,4), %xmm0
	movl	80(%rsp), %eax
	mulss	%xmm3, %xmm0
	addl	%r8d, %eax
	cltq
	addss	%xmm1, %xmm0
	addss	8(%rbx,%rdx,4), %xmm0
	mulss	%xmm7, %xmm0
	movss	%xmm0, 8(%rbp,%rax,4)
.L5:
	addl	$1, %r11d
	cmpl	20(%rsp), %r11d
	jne	.L7
.L10:
	movl	84(%rsp), %eax
	testl	%eax, %eax
	jle	.L3
	movq	24(%rsp), %rcx
	cmpl	$6, %eax
	movss	.LC5(%rip), %xmm5
	movl	$2, 8(%rsp)
	pxor	%xmm8, %xmm8
	movss	.LC6(%rip), %xmm7
	movl	0(%rbp), %r14d
	movl	$0, 32(%rsp)
	movl	(%rcx), %edx
	movaps	.LC2(%rip), %xmm1
	movaps	%xmm8, %xmm11
	movaps	%xmm5, %xmm6
	movss	.LC7(%rip), %xmm9
	movaps	.LC3(%rip), %xmm4
	movaps	%xmm7, %xmm10
	movl	%edx, 40(%rsp)
	setg	%dl
	cmpq	%rcx, %rbp
	movaps	.LC4(%rip), %xmm3
	setne	%al
	andl	%eax, %edx
	movb	%dl, 44(%rsp)
	movl	36(%rsp), %edx
	movl	%edx, %eax
	andl	$-4, %edx
	shrl	$2, %eax
	movl	%edx, %r15d
	salq	$4, %rax
	movq	%rax, %r13
	leal	1(%rdx), %eax
	movl	%eax, 48(%rsp)
	leal	2(%rdx), %eax
	movl	%eax, 52(%rsp)
	.p2align 4,,10
	.p2align 3
.L9:
	movl	8(%rsp), %eax
	movl	%eax, %edx
	addl	$2, %eax
	movl	%eax, 8(%rsp)
	leal	-2(%rdx), %eax
	movl	%edx, %esi
	leal	-1(%rdx), %ecx
	imull	%r14d, %eax
	addl	$1, %edx
	imull	%r14d, %esi
	imull	%r14d, %ecx
	movl	%eax, 16(%rsp)
	movl	40(%rsp), %eax
	imull	%r14d, %edx
	imull	32(%rsp), %eax
	cmpb	$0, 44(%rsp)
	leal	(%rsi,%r14,2), %r12d
	movl	%eax, 12(%rsp)
	je	.L31
	movslq	16(%rsp), %rax
	movq	24(%rsp), %rdi
	pxor	%xmm2, %xmm2
	leaq	8(%rbp,%rax,4), %rbx
	movslq	%ecx, %rax
	leaq	8(%rbp,%rax,4), %r11
	movslq	%esi, %rax
	leaq	8(%rbp,%rax,4), %r10
	movslq	%edx, %rax
	leaq	8(%rbp,%rax,4), %r9
	movslq	%r12d, %rax
	leaq	8(%rbp,%rax,4), %r8
	movslq	12(%rsp), %rax
	leaq	8(%rdi,%rax,4), %rdi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L13:
	movups	(%r11,%rax), %xmm0
	movups	(%rbx,%rax), %xmm12
	movups	(%r8,%rax), %xmm14
	mulps	%xmm1, %xmm0
	addps	%xmm2, %xmm12
	addps	%xmm12, %xmm0
	movups	(%r10,%rax), %xmm12
	mulps	%xmm4, %xmm12
	addps	%xmm12, %xmm0
	movups	(%r9,%rax), %xmm12
	mulps	%xmm1, %xmm12
	addps	%xmm12, %xmm0
	addps	%xmm14, %xmm0
	mulps	%xmm3, %xmm0
	movups	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpq	%r13, %rax
	jne	.L13
	movl	36(%rsp), %r10d
	cmpl	%r10d, %r15d
	je	.L16
	movl	16(%rsp), %r11d
	leal	(%r15,%r12), %edi
	movl	12(%rsp), %r9d
	movslq	%edi, %rdi
	movq	24(%rsp), %r8
	movl	48(%rsp), %ebx
	leal	(%r11,%r15), %eax
	cltq
	movss	8(%rbp,%rax,4), %xmm0
	leal	(%rcx,%r15), %eax
	cltq
	movss	8(%rbp,%rax,4), %xmm2
	addss	%xmm11, %xmm0
	leal	(%r15,%rsi), %eax
	cltq
	mulss	%xmm6, %xmm2
	addss	%xmm0, %xmm2
	movss	8(%rbp,%rax,4), %xmm0
	leal	(%r15,%rdx), %eax
	cltq
	mulss	%xmm10, %xmm0
	addss	%xmm0, %xmm2
	movss	8(%rbp,%rax,4), %xmm0
	leal	(%r9,%r15), %eax
	cltq
	mulss	%xmm6, %xmm0
	addss	%xmm2, %xmm0
	addss	8(%rbp,%rdi,4), %xmm0
	movss	.LC7(%rip), %xmm2
	mulss	%xmm2, %xmm0
	movss	%xmm0, 8(%r8,%rax,4)
	cmpl	%ebx, %r10d
	jle	.L16
	movl	%r11d, %eax
	leal	(%r12,%rbx), %edi
	addl	%ebx, %eax
	movslq	%edi, %rdi
	cltq
	movss	8(%rbp,%rax,4), %xmm0
	leal	(%rcx,%rbx), %eax
	cltq
	movss	8(%rbp,%rax,4), %xmm12
	addss	%xmm11, %xmm0
	leal	(%rsi,%rbx), %eax
	cltq
	mulss	%xmm6, %xmm12
	addss	%xmm0, %xmm12
	movss	8(%rbp,%rax,4), %xmm0
	leal	(%rdx,%rbx), %eax
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
	cmpl	%edi, %r10d
	jle	.L16
	movl	%r11d, %eax
	addl	%edi, %eax
	cltq
	movss	8(%rbp,%rax,4), %xmm0
	leal	(%rcx,%rdi), %eax
	cltq
	movss	8(%rbp,%rax,4), %xmm12
	addss	%xmm11, %xmm0
	leal	(%rsi,%rdi), %eax
	cltq
	mulss	%xmm6, %xmm12
	addss	%xmm0, %xmm12
	movss	8(%rbp,%rax,4), %xmm0
	leal	(%rdx,%rdi), %eax
	cltq
	leal	(%r12,%rdi), %edx
	mulss	%xmm10, %xmm0
	movslq	%edx, %rdx
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
.L16:
	addl	$1, 32(%rsp)
	movl	8(%rsp), %ecx
	cmpl	%ecx, 20(%rsp)
	jg	.L9
.L3:
	movq	%rbp, %rdi
	call	fFreeHandle@PLT
	movq	104(%rsp), %rdi
	call	iFreeHandle@PLT
	movq	24(%rsp), %rax
	addq	$120, %rsp
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
.L30:
	.cfi_restore_state
	movslq	%edx, %rdx
	movq	96(%rsp), %rsi
	movslq	%r8d, %r8
	leaq	(%rbx,%rdx,4), %rax
	addq	88(%rsp), %rdx
	leaq	0(%rbp,%r8,4), %rcx
	leaq	(%rsi,%rdx,4), %rdx
	.p2align 4,,10
	.p2align 3
.L6:
	movss	12(%rax), %xmm1
	movss	8(%rax), %xmm0
	addq	$8, %rax
	addq	$4, %rcx
	mulss	%xmm3, %xmm1
	addss	%xmm9, %xmm0
	addss	%xmm0, %xmm1
	movss	8(%rax), %xmm0
	mulss	%xmm8, %xmm0
	addss	%xmm0, %xmm1
	movss	12(%rax), %xmm0
	mulss	%xmm3, %xmm0
	addss	%xmm1, %xmm0
	addss	16(%rax), %xmm0
	mulss	%xmm7, %xmm0
	movss	%xmm0, 4(%rcx)
	cmpq	%rdx, %rax
	jne	.L6
	jmp	.L5
.L31:
	movslq	16(%rsp), %rax
	movq	24(%rsp), %rbx
	movslq	%ecx, %rcx
	movslq	%esi, %rsi
	movslq	%edx, %rdx
	movslq	%r12d, %r12
	movl	36(%rsp), %r10d
	leaq	0(%rbp,%rcx,4), %rcx
	leaq	0(%rbp,%rax,4), %rdi
	movslq	12(%rsp), %rax
	leaq	0(%rbp,%rsi,4), %rsi
	leaq	0(%rbp,%rdx,4), %rdx
	leaq	0(%rbp,%r12,4), %r8
	leaq	(%rbx,%rax,4), %r9
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L15:
	movss	8(%rcx,%rax,4), %xmm2
	movss	8(%rdi,%rax,4), %xmm0
	mulss	%xmm5, %xmm2
	addss	%xmm8, %xmm0
	addss	%xmm0, %xmm2
	movss	8(%rsi,%rax,4), %xmm0
	mulss	%xmm7, %xmm0
	addss	%xmm0, %xmm2
	movss	8(%rdx,%rax,4), %xmm0
	mulss	%xmm5, %xmm0
	addss	%xmm2, %xmm0
	addss	8(%r8,%rax,4), %xmm0
	mulss	%xmm9, %xmm0
	movss	%xmm0, 8(%r9,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %r10d
	jg	.L15
	jmp	.L16
	.cfi_endproc
.LFE39:
	.size	imageResize, .-imageResize
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	1
	.long	4
	.long	6
	.long	4
	.align 16
.LC2:
	.long	1082130432
	.long	1082130432
	.long	1082130432
	.long	1082130432
	.align 16
.LC3:
	.long	1086324736
	.long	1086324736
	.long	1086324736
	.long	1086324736
	.align 16
.LC4:
	.long	1031798784
	.long	1031798784
	.long	1031798784
	.long	1031798784
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC5:
	.long	1082130432
	.align 4
.LC6:
	.long	1086324736
	.align 4
.LC7:
	.long	1031798784
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
