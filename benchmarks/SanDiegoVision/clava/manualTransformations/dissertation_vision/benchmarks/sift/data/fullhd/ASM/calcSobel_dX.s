	.file	"calcSobel_dX.c"
	.text
	.p2align 4
	.globl	calcSobel_dX
	.type	calcSobel_dX, @function
calcSobel_dX:
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
	movl	(%rdi), %r14d
	movl	4(%rdi), %r15d
	movl	%r14d, %esi
	movl	%r15d, %edi
	call	fSetArray@PLT
	pxor	%xmm0, %xmm0
	movl	%r14d, %esi
	movl	%r15d, %edi
	movq	%rax, 16(%rsp)
	call	fSetArray@PLT
	movl	$3, %esi
	movl	$1, %edi
	movq	%rax, %r13
	call	fMallocHandle@PLT
	movl	$3, %esi
	movl	$1, %edi
	movq	%rax, %rbp
	call	fMallocHandle@PLT
	movl	$0x3f800000, 16(%rbp)
	movq	%rax, %r12
	movabsq	$4611686019492741120, %rax
	movq	%rax, 8(%rbp)
	leal	-1(%r14), %eax
	movq	$1065353216, 8(%r12)
	movl	$0xbf800000, 16(%r12)
	movl	%eax, 28(%rsp)
	cmpl	$2, %r15d
	jle	.L3
	cmpl	$1, 28(%rsp)
	jle	.L3
	leal	-1(%r15), %eax
	cmpq	%r13, %rbx
	leal	-3(%r14), %edi
	movl	0(%r13), %r15d
	movl	%eax, 12(%rsp)
	movl	(%rbx), %eax
	pxor	%xmm5, %xmm5
	movl	$1, %r11d
	movl	%edi, 68(%rsp)
	pxor	%xmm2, %xmm2
	movaps	%xmm5, %xmm7
	movss	.LC4(%rip), %xmm4
	movl	%eax, 36(%rsp)
	setne	%al
	cmpq	%r12, %r13
	movaps	.LC3(%rip), %xmm3
	setne	%dl
	movq	%rdi, 48(%rsp)
	movaps	%xmm4, %xmm6
	andl	%edx, %eax
	cmpl	$2, %edi
	leaq	4(%rbx), %rdi
	movq	%rbp, 72(%rsp)
	seta	%dl
	movq	%rdi, 56(%rsp)
	andl	%edx, %eax
	movl	%r15d, 32(%rsp)
	movb	%al, 40(%rsp)
	leal	-2(%r14), %eax
	movl	%eax, %r10d
	movl	%eax, 24(%rsp)
	andl	$-4, %eax
	movl	%eax, %r14d
	leal	1(%rax), %eax
	shrl	$2, %r10d
	leal	4(%r14), %ecx
	movl	%eax, 44(%rsp)
	leal	3(%r14), %esi
	salq	$4, %r10
	movl	%ecx, 64(%rsp)
	leal	2(%r14), %eax
	movl	%esi, %r15d
	movl	%eax, %ebp
	.p2align 4,,10
	.p2align 3
.L8:
	movl	36(%rsp), %edx
	movl	32(%rsp), %ecx
	imull	%r11d, %edx
	imull	%r11d, %ecx
	cmpb	$0, 40(%rsp)
	je	.L33
	movslq	%edx, %rax
	movss	8(%r12), %xmm10
	movss	12(%r12), %xmm9
	leaq	8(,%rax,4), %rax
	movss	16(%r12), %xmm8
	leaq	(%rbx,%rax), %r9
	leaq	4(%rbx,%rax), %r8
	shufps	$0, %xmm10, %xmm10
	shufps	$0, %xmm9, %xmm9
	leaq	8(%rbx,%rax), %rdi
	movslq	%ecx, %rax
	shufps	$0, %xmm8, %xmm8
	leaq	12(%r13,%rax,4), %rsi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	movups	(%r9,%rax), %xmm0
	movups	(%r8,%rax), %xmm1
	mulps	%xmm10, %xmm0
	mulps	%xmm9, %xmm1
	addps	%xmm2, %xmm0
	addps	%xmm1, %xmm0
	movups	(%rdi,%rax), %xmm1
	mulps	%xmm8, %xmm1
	addps	%xmm1, %xmm0
	mulps	%xmm3, %xmm0
	movups	%xmm0, (%rsi,%rax)
	addq	$16, %rax
	cmpq	%r10, %rax
	jne	.L4
	cmpl	%r14d, 24(%rsp)
	je	.L7
	movl	44(%rsp), %r8d
	leal	(%rdx,%r14), %eax
	movl	28(%rsp), %r9d
	cltq
	movss	8(%rbx,%rax,4), %xmm1
	leal	(%rdx,%r8), %eax
	mulss	8(%r12), %xmm1
	cltq
	leaq	(%rbx,%rax,4), %rdi
	leal	(%rdx,%rbp), %eax
	movss	8(%rdi), %xmm0
	mulss	12(%r12), %xmm0
	cltq
	leaq	(%rbx,%rax,4), %rsi
	leal	(%rcx,%r8), %eax
	addss	%xmm7, %xmm1
	cltq
	addss	%xmm0, %xmm1
	movss	8(%rsi), %xmm0
	mulss	16(%r12), %xmm0
	addss	%xmm1, %xmm0
	mulss	%xmm6, %xmm0
	movss	%xmm0, 8(%r13,%rax,4)
	cmpl	%ebp, %r9d
	jle	.L7
	movss	8(%rdi), %xmm1
	mulss	8(%r12), %xmm1
	leal	(%rdx,%r15), %eax
	movss	8(%rsi), %xmm0
	mulss	12(%r12), %xmm0
	cltq
	leaq	(%rbx,%rax,4), %rdi
	leal	(%rcx,%rbp), %eax
	cltq
	addss	%xmm7, %xmm1
	addss	%xmm0, %xmm1
	movss	8(%rdi), %xmm0
	mulss	16(%r12), %xmm0
	addss	%xmm1, %xmm0
	mulss	%xmm6, %xmm0
	movss	%xmm0, 8(%r13,%rax,4)
	cmpl	%r15d, %r9d
	jle	.L7
	movss	8(%rsi), %xmm1
	mulss	8(%r12), %xmm1
	leal	(%rcx,%r15), %eax
	movss	8(%rdi), %xmm0
	mulss	12(%r12), %xmm0
	cltq
	addl	64(%rsp), %edx
	movslq	%edx, %rdx
	addss	%xmm7, %xmm1
	addss	%xmm0, %xmm1
	movss	8(%rbx,%rdx,4), %xmm0
	mulss	16(%r12), %xmm0
	addss	%xmm1, %xmm0
	mulss	%xmm6, %xmm0
	movss	%xmm0, 8(%r13,%rax,4)
.L7:
	addl	$1, %r11d
	cmpl	12(%rsp), %r11d
	jne	.L8
	movq	16(%rsp), %rax
	movl	68(%rsp), %esi
	pxor	%xmm5, %xmm5
	pxor	%xmm2, %xmm2
	movq	72(%rsp), %rbp
	movl	32(%rsp), %r15d
	movaps	%xmm5, %xmm7
	movq	%r12, 56(%rsp)
	movl	(%rax), %ebx
	movss	.LC6(%rip), %xmm4
	movl	$1, %r14d
	cmpq	%rbp, %rax
	movaps	.LC5(%rip), %xmm3
	movl	%ebx, 32(%rsp)
	movq	%rax, %rbx
	setne	%al
	movaps	%xmm4, %xmm6
	cmpq	%r13, %rbx
	setne	%dl
	andl	%edx, %eax
	cmpl	$2, %esi
	seta	%dl
	andl	%edx, %eax
	movb	%al, 36(%rsp)
	movl	24(%rsp), %eax
	movl	%eax, %ebx
	andl	$-4, %eax
	leal	1(%rax), %edi
	movl	%eax, 40(%rsp)
	shrl	$2, %ebx
	movl	%edi, 44(%rsp)
	leal	2(%rax), %edi
	addl	$3, %eax
	salq	$4, %rbx
	movl	%eax, 64(%rsp)
	movl	%esi, %eax
	movl	%edi, %r12d
	movq	%rax, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L17:
	movl	%r14d, %edx
	addl	$1, %r14d
	movl	%edx, %esi
	leal	-1(%rdx), %ecx
	imull	%r15d, %esi
	imull	%r15d, %ecx
	imull	32(%rsp), %edx
	cmpb	$0, 36(%rsp)
	leal	(%r15,%rsi), %edi
	je	.L34
	movslq	%ecx, %rax
	movq	16(%rsp), %r8
	movss	8(%rbp), %xmm10
	leaq	12(%r13,%rax,4), %r11
	movslq	%esi, %rax
	movss	12(%rbp), %xmm9
	movss	16(%rbp), %xmm8
	leaq	12(%r13,%rax,4), %r10
	movslq	%edi, %rax
	shufps	$0, %xmm10, %xmm10
	leaq	12(%r13,%rax,4), %r9
	movslq	%edx, %rax
	shufps	$0, %xmm9, %xmm9
	shufps	$0, %xmm8, %xmm8
	leaq	12(%r8,%rax,4), %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L13:
	movups	(%r11,%rax), %xmm0
	movups	(%r10,%rax), %xmm1
	mulps	%xmm10, %xmm0
	mulps	%xmm9, %xmm1
	addps	%xmm2, %xmm0
	addps	%xmm1, %xmm0
	movups	(%r9,%rax), %xmm1
	mulps	%xmm8, %xmm1
	addps	%xmm1, %xmm0
	mulps	%xmm3, %xmm0
	movups	%xmm0, (%r8,%rax)
	addq	$16, %rax
	cmpq	%rbx, %rax
	jne	.L13
	movl	24(%rsp), %r10d
	cmpl	%r10d, 40(%rsp)
	je	.L16
	movl	44(%rsp), %r11d
	movq	16(%rsp), %r10
	movl	28(%rsp), %r9d
	leal	(%rcx,%r11), %eax
	leal	(%rdi,%r11), %r8d
	cltq
	movslq	%r8d, %r8
	movss	8(%r13,%rax,4), %xmm1
	mulss	8(%rbp), %xmm1
	leal	(%rsi,%r11), %eax
	cltq
	movss	8(%r13,%rax,4), %xmm0
	mulss	12(%rbp), %xmm0
	leal	(%rdx,%r11), %eax
	cltq
	addss	%xmm7, %xmm1
	addss	%xmm0, %xmm1
	movss	8(%r13,%r8,4), %xmm0
	mulss	16(%rbp), %xmm0
	addss	%xmm1, %xmm0
	mulss	%xmm6, %xmm0
	movss	%xmm0, 8(%r10,%rax,4)
	cmpl	%r12d, %r9d
	jle	.L16
	leal	(%rcx,%r12), %eax
	leal	(%rdi,%r12), %r8d
	cltq
	movslq	%r8d, %r8
	movss	8(%r13,%rax,4), %xmm1
	mulss	8(%rbp), %xmm1
	leal	(%rsi,%r12), %eax
	cltq
	movss	8(%r13,%rax,4), %xmm0
	mulss	12(%rbp), %xmm0
	leal	(%rdx,%r12), %eax
	cltq
	addss	%xmm7, %xmm1
	addss	%xmm0, %xmm1
	movss	8(%r13,%r8,4), %xmm0
	mulss	16(%rbp), %xmm0
	addss	%xmm1, %xmm0
	mulss	%xmm6, %xmm0
	movss	%xmm0, 8(%r10,%rax,4)
	movl	%r9d, %eax
	movl	64(%rsp), %r9d
	cmpl	%r9d, %eax
	jle	.L16
	leal	(%rcx,%r9), %eax
	cltq
	movss	8(%r13,%rax,4), %xmm1
	mulss	8(%rbp), %xmm1
	leal	(%rsi,%r9), %eax
	cltq
	movss	8(%r13,%rax,4), %xmm0
	mulss	12(%rbp), %xmm0
	leal	(%rdx,%r9), %eax
	leal	(%rdi,%r9), %edx
	movslq	%edx, %rdx
	cltq
	addss	%xmm7, %xmm1
	addss	%xmm0, %xmm1
	movss	8(%r13,%rdx,4), %xmm0
	mulss	16(%rbp), %xmm0
	addss	%xmm1, %xmm0
	mulss	%xmm6, %xmm0
	movss	%xmm0, 8(%r10,%rax,4)
.L16:
	cmpl	12(%rsp), %r14d
	jne	.L17
	movq	56(%rsp), %r12
.L3:
	movq	%r13, %rdi
	call	fFreeHandle@PLT
	movq	%rbp, %rdi
	call	fFreeHandle@PLT
	movq	%r12, %rdi
	call	fFreeHandle@PLT
	movq	16(%rsp), %rax
	addq	$88, %rsp
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
.L33:
	.cfi_restore_state
	movslq	%edx, %rdx
	movq	56(%rsp), %rdi
	movslq	%ecx, %rcx
	leaq	(%rbx,%rdx,4), %rax
	addq	48(%rsp), %rdx
	leaq	0(%r13,%rcx,4), %rcx
	leaq	(%rdi,%rdx,4), %rdx
	.p2align 4,,10
	.p2align 3
.L6:
	movss	8(%rax), %xmm1
	mulss	8(%r12), %xmm1
	addq	$4, %rax
	addq	$4, %rcx
	movss	8(%rax), %xmm0
	mulss	12(%r12), %xmm0
	addss	%xmm5, %xmm1
	addss	%xmm0, %xmm1
	movss	12(%rax), %xmm0
	mulss	16(%r12), %xmm0
	addss	%xmm1, %xmm0
	mulss	%xmm4, %xmm0
	movss	%xmm0, 8(%rcx)
	cmpq	%rdx, %rax
	jne	.L6
	jmp	.L7
.L34:
	movq	16(%rsp), %rax
	movslq	%ecx, %rcx
	movslq	%esi, %rsi
	movslq	%edi, %rdi
	movslq	%edx, %rdx
	movq	48(%rsp), %r9
	leaq	0(%r13,%rcx,4), %rcx
	leaq	0(%r13,%rsi,4), %rsi
	leaq	(%rax,%rdx,4), %r8
	leaq	0(%r13,%rdi,4), %rdi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L15:
	movss	8(%rbp), %xmm1
	mulss	12(%rcx,%rax,4), %xmm1
	movq	%rax, %rdx
	movss	12(%rbp), %xmm0
	mulss	12(%rsi,%rax,4), %xmm0
	addss	%xmm5, %xmm1
	addss	%xmm0, %xmm1
	movss	16(%rbp), %xmm0
	mulss	12(%rdi,%rax,4), %xmm0
	addss	%xmm1, %xmm0
	mulss	%xmm4, %xmm0
	movss	%xmm0, 12(%r8,%rax,4)
	addq	$1, %rax
	cmpq	%r9, %rdx
	jne	.L15
	jmp	.L16
	.cfi_endproc
.LFE39:
	.size	calcSobel_dX, .-calcSobel_dX
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	1056964608
	.long	1056964608
	.long	1056964608
	.long	1056964608
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC4:
	.long	1056964608
	.section	.rodata.cst16
	.align 16
.LC5:
	.long	1048576000
	.long	1048576000
	.long	1048576000
	.long	1048576000
	.section	.rodata.cst4
	.align 4
.LC6:
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
