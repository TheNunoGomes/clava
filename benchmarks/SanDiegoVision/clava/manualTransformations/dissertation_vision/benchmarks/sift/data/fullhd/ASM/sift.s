	.file	"sift.c"
	.text
	.p2align 4
	.globl	sift
	.type	sift, @function
sift:
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
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movl	(%rdi), %eax
	cmpl	%eax, 4(%rdi)
	cmovle	4(%rdi), %eax
	cvtsi2ssl	%eax, %xmm0
	call	log2f@PLT
	movss	.LC1(%rip), %xmm2
	movss	.LC0(%rip), %xmm4
	movaps	%xmm0, %xmm1
	andps	%xmm2, %xmm1
	ucomiss	%xmm1, %xmm4
	jbe	.L2
	cvttss2sil	%xmm0, %eax
	pxor	%xmm1, %xmm1
	movss	.LC2(%rip), %xmm4
	movaps	%xmm0, %xmm3
	andnps	%xmm3, %xmm2
	cvtsi2ssl	%eax, %xmm1
	movaps	%xmm1, %xmm7
	cmpnless	%xmm0, %xmm7
	movaps	%xmm7, %xmm0
	andps	%xmm4, %xmm0
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L2:
	cvttss2sil	%xmm0, %ebx
	movl	$4, %r9d
	movq	%rbp, %rdi
	movss	.LC3(%rip), %xmm1
	movl	$-1, %r8d
	movl	$-1, %ecx
	movl	$3, %edx
	movss	.LC4(%rip), %xmm0
	leal	-3(%rbx), %r14d
	movl	%r14d, %esi
	movl	%r14d, 172(%rsp)
	call	gaussianss@PLT
	movl	$6, %edx
	movl	%r14d, %esi
	movq	%rax, %rdi
	movq	%rax, 160(%rsp)
	call	diffss@PLT
	movq	%rax, 64(%rsp)
	movq	%rax, %rdi
	testl	%r14d, %r14d
	jle	.L3
	leal	(%rbx,%rbx,2), %eax
	movq	%rdi, 72(%rsp)
	leal	-18(%rax,%rax), %eax
	movl	$0, 28(%rsp)
	movl	%eax, 56(%rsp)
	movl	$5, 60(%rsp)
	movl	$1, 168(%rsp)
.L21:
	movq	72(%rsp), %rax
	movl	$5, %edi
	movq	(%rax), %rax
	movl	4(%rax), %ebx
	movl	(%rax), %eax
	movl	%eax, %r13d
	movl	%eax, %r15d
	movl	%eax, 16(%rsp)
	imull	%ebx, %r13d
	movl	%r13d, %esi
	call	fMallocHandle@PLT
	movl	%r13d, %esi
	movl	$5, %edi
	movq	%rax, %rbp
	call	fMallocHandle@PLT
	leal	-1(%rbx), %r11d
	xorl	%r8d, %r8d
	leal	-1(%r15), %r9d
	addq	$3, %r11
	testl	%r15d, %r15d
	movl	28(%rsp), %r14d
	movq	%rax, %r12
	movss	.LC5(%rip), %xmm2
	jle	.L5
	movl	%r13d, (%rsp)
	movq	64(%rsp), %r15
	movl	60(%rsp), %r13d
.L4:
	movslq	%r14d, %rax
	xorl	%edi, %edi
	leaq	(%r15,%rax,8), %r10
	.p2align 4,,10
	.p2align 3
.L10:
	testl	%ebx, %ebx
	jle	.L9
	movq	(%r10), %rax
	movslq	%r8d, %rcx
	movslq	(%rax), %rsi
	leaq	(%rax,%rdi,4), %rdx
	leaq	8(,%rcx,4), %rax
	addq	%r11, %rcx
	salq	$2, %rcx
	salq	$2, %rsi
	.p2align 4,,10
	.p2align 3
.L6:
	movss	8(%rdx), %xmm0
	movss	%xmm0, 0(%rbp,%rax)
	movss	8(%rdx), %xmm0
	addq	%rsi, %rdx
	xorps	%xmm2, %xmm0
	movss	%xmm0, (%r12,%rax)
	addq	$4, %rax
	cmpq	%rax, %rcx
	jne	.L6
	addl	%ebx, %r8d
.L9:
	leaq	1(%rdi), %rax
	cmpq	%rdi, %r9
	je	.L7
	movq	%rax, %rdi
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L7:
	addl	$1, %r14d
	cmpl	%r14d, %r13d
	jne	.L4
	movl	(%rsp), %r13d
.L5:
	movl	16(%rsp), %r14d
	movl	%ebx, %edx
	movl	$6, %esi
	movq	%rbp, %rdi
	movss	.LC6(%rip), %xmm0
	movl	%r14d, %ecx
	call	siftlocalmax@PLT
	movl	%r14d, %ecx
	movl	%ebx, %edx
	movl	$6, %esi
	movss	.LC6(%rip), %xmm0
	movq	%r12, %rdi
	movq	%rax, %r15
	movl	%r14d, 16(%rsp)
	movq	%rax, 80(%rsp)
	call	siftlocalmax@PLT
	movq	%r15, %rdi
	movq	%rax, %rsi
	movq	%rax, 88(%rsp)
	call	fHorzcat@PLT
	movq	%rax, %rdi
	movq	%rax, 96(%rsp)
	call	ifDeepCopy@PLT
	xorl	%edx, %edx
	movl	4(%rax), %edi
	movl	(%rax), %esi
	movq	%rax, %r15
	movq	%rax, 104(%rsp)
	call	iSetArray@PLT
	movl	4(%r15), %edi
	movl	(%r15), %esi
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	call	iSetArray@PLT
	movl	4(%r15), %edi
	movl	(%r15), %esi
	xorl	%edx, %edx
	movq	%rax, %r14
	call	iSetArray@PLT
	movl	4(%r15), %esi
	movq	%r15, %rdi
	movq	%rax, 48(%rsp)
	movq	%rax, %r10
	movl	%esi, 8(%rsp)
	testl	%esi, %esi
	jle	.L11
	movl	(%r15), %eax
	testl	%eax, %eax
	jle	.L11
	movslq	%eax, %rdx
	pxor	%xmm6, %xmm6
	movq	%rbp, 112(%rsp)
	xorl	%r15d, %r15d
	leaq	0(,%rdx,4), %rsi
	movsd	.LC10(%rip), %xmm7
	movsd	.LC7(%rip), %xmm5
	movq	%r12, 120(%rsp)
	movq	%rsi, (%rsp)
	movq	32(%rsp), %rbp
	leal	-1(%rax), %r11d
	movq	%r10, %r12
	cvtsi2sdl	16(%rsp), %xmm6
	movsd	.LC8(%rip), %xmm4
	movapd	%xmm7, %xmm8
	movsd	.LC9(%rip), %xmm3
	.p2align 4,,10
	.p2align 3
.L13:
	movl	(%r12), %eax
	xorl	%ecx, %ecx
	imull	%r15d, %eax
	cltq
	leaq	(%r12,%rax,4), %r10
	movl	(%r14), %eax
	imull	%r15d, %eax
	cltq
	leaq	(%r14,%rax,4), %r9
	movl	0(%rbp), %eax
	imull	%r15d, %eax
	cltq
	leaq	0(%rbp,%rax,4), %r8
	.p2align 4,,10
	.p2align 3
.L16:
	movl	8(%rdi,%rcx,4), %eax
	pxor	%xmm0, %xmm0
	cltd
	idivl	%r13d
	cvtsi2sdl	%eax, %xmm0
	movl	%edx, %esi
	addsd	%xmm5, %xmm0
	movapd	%xmm0, %xmm1
	movapd	%xmm0, %xmm9
	andpd	%xmm3, %xmm1
	ucomisd	%xmm1, %xmm4
	jbe	.L14
	cvttsd2siq	%xmm0, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	cmpnlesd	%xmm1, %xmm0
	andpd	%xmm7, %xmm0
	addsd	%xmm1, %xmm0
	movapd	%xmm3, %xmm1
	andnpd	%xmm9, %xmm1
	orpd	%xmm1, %xmm0
.L14:
	cvttsd2sil	%xmm0, %eax
	pxor	%xmm1, %xmm1
	movl	%eax, 8(%r10,%rcx,4)
	movl	%esi, %eax
	cltd
	idivl	%ebx
	cvtsi2sdl	%eax, %xmm1
	movapd	%xmm1, %xmm0
	addsd	%xmm5, %xmm0
	movapd	%xmm0, %xmm9
	movapd	%xmm0, %xmm10
	andpd	%xmm3, %xmm9
	ucomisd	%xmm9, %xmm4
	jbe	.L15
	cvttsd2siq	%xmm0, %rax
	pxor	%xmm9, %xmm9
	cvtsi2sdq	%rax, %xmm9
	cmpnlesd	%xmm9, %xmm0
	andpd	%xmm8, %xmm0
	addsd	%xmm9, %xmm0
	movapd	%xmm3, %xmm9
	andnpd	%xmm10, %xmm9
	orpd	%xmm9, %xmm0
.L15:
	cvttsd2sil	%xmm0, %eax
	mulsd	%xmm6, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%esi, %xmm0
	movl	%eax, 8(%r9,%rcx,4)
	subsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	movl	%eax, 8(%r8,%rcx,4)
	movq	%rcx, %rax
	addq	$1, %rcx
	cmpq	%rax, %r11
	jne	.L16
	addl	$1, %r15d
	addq	(%rsp), %rdi
	cmpl	%r15d, 8(%rsp)
	jne	.L13
	movq	112(%rsp), %rbp
	movq	120(%rsp), %r12
.L11:
	movq	32(%rsp), %rdi
	movl	$1, %esi
	call	isMinus@PLT
	movl	$1, %esi
	movl	4(%rax), %edx
	imull	(%rax), %edx
	movq	%rax, %rdi
	movq	%rax, 112(%rsp)
	call	iReshape@PLT
	movl	$1, %esi
	movq	%r14, %rdi
	movq	%rax, (%rsp)
	call	isMinus@PLT
	movl	$1, %esi
	movl	4(%rax), %edx
	imull	(%rax), %edx
	movq	%rax, %rdi
	movq	%rax, %r13
	call	iReshape@PLT
	movq	48(%rsp), %rdi
	movl	$-2, %esi
	movq	%rax, 8(%rsp)
	call	isPlus@PLT
	movl	$1, %esi
	movl	4(%rax), %edx
	imull	(%rax), %edx
	movq	%rax, %rdi
	movq	%rax, 120(%rsp)
	call	iReshape@PLT
	movq	(%rsp), %rsi
	movq	8(%rsp), %rdi
	movq	%rax, %r15
	movq	%rax, 128(%rsp)
	call	iVertcat@PLT
	movq	%r15, %rsi
	movq	%rax, %rdi
	movq	%rax, 136(%rsp)
	call	iVertcat@PLT
	movq	%rax, %rdi
	movq	%rax, 144(%rsp)
	call	fiDeepCopy@PLT
	movl	16(%rsp), %esi
	movl	%ebx, %edi
	movq	%rax, %rdx
	movq	%rax, 152(%rsp)
	call	filterBoundaryPoints@PLT
	movq	152(%rsp), %r8
	movq	%rax, %r15
	movq	%r8, %rdi
	call	fFreeHandle@PLT
	pxor	%xmm7, %xmm7
	ucomiss	8(%r15), %xmm7
	jp	.L27
	jne	.L27
	cmpl	$1, 172(%rsp)
	je	.L43
.L20:
	movq	%r15, %rdi
	call	fFreeHandle@PLT
	movq	%r14, %rdi
	call	iFreeHandle@PLT
	movq	32(%rsp), %rdi
	call	iFreeHandle@PLT
	movq	48(%rsp), %rdi
	call	iFreeHandle@PLT
	movq	8(%rsp), %rdi
	call	iFreeHandle@PLT
	movq	(%rsp), %rdi
	call	iFreeHandle@PLT
	movq	128(%rsp), %rdi
	call	iFreeHandle@PLT
	movq	%r13, %rdi
	call	iFreeHandle@PLT
	movq	112(%rsp), %rdi
	call	iFreeHandle@PLT
	movq	120(%rsp), %rdi
	call	iFreeHandle@PLT
	movq	136(%rsp), %rdi
	call	iFreeHandle@PLT
	movq	144(%rsp), %rdi
	call	iFreeHandle@PLT
	movq	104(%rsp), %rdi
	call	iFreeHandle@PLT
	movq	80(%rsp), %rdi
	call	fFreeHandle@PLT
	movq	96(%rsp), %rdi
	call	fFreeHandle@PLT
	movq	%rbp, %rdi
	call	fFreeHandle@PLT
	movq	88(%rsp), %rdi
	call	fFreeHandle@PLT
	movq	%r12, %rdi
	call	fFreeHandle@PLT
	addl	$6, 28(%rsp)
	movl	28(%rsp), %eax
	addq	$48, 72(%rsp)
	addl	$6, 60(%rsp)
	cmpl	56(%rsp), %eax
	jne	.L21
	movq	64(%rsp), %rax
	xorl	%ebp, %ebp
	leaq	40(%rax), %rbx
.L23:
	leaq	-40(%rbx), %r12
.L22:
	movq	(%r12), %rdi
	addq	$8, %r12
	call	fFreeHandle@PLT
	cmpq	%r12, %rbx
	jne	.L22
	addl	$6, %ebp
	addq	$48, %rbx
	cmpl	56(%rsp), %ebp
	jne	.L23
	movq	160(%rsp), %rax
	xorl	%ebp, %ebp
	leaq	48(%rax), %rbx
.L25:
	leaq	-48(%rbx), %r12
	.p2align 4,,10
	.p2align 3
.L24:
	movq	(%r12), %rdi
	addq	$8, %r12
	call	fFreeHandle@PLT
	cmpq	%r12, %rbx
	jne	.L24
	addl	$6, %ebp
	addq	$48, %rbx
	cmpl	56(%rsp), %ebp
	jne	.L25
.L3:
	movq	160(%rsp), %rdi
	call	free@PLT
	movq	64(%rsp), %rdi
	call	free@PLT
	movq	40(%rsp), %rax
	addq	$184, %rsp
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
.L27:
	.cfi_restore_state
	movq	%r15, %rdi
	call	fTranspose@PLT
	movq	%r15, %rdi
	movq	%rax, 152(%rsp)
	call	fFreeHandle@PLT
	subq	$8, %rsp
	.cfi_def_cfa_offset 248
	movl	%ebx, %r8d
	movq	%rbp, %rsi
	pushq	$5
	.cfi_def_cfa_offset 256
	movl	32(%rsp), %r9d
	movl	$10, %ecx
	movl	$-1, %edx
	movq	168(%rsp), %r10
	movss	.LC12(%rip), %xmm0
	movq	%r10, %rdi
	movq	%r10, 32(%rsp)
	call	siftrefinemx@PLT
	movq	32(%rsp), %r10
	movq	%rax, %r15
	movq	%r10, %rdi
	call	fFreeHandle@PLT
	popq	%rax
	.cfi_def_cfa_offset 248
	popq	%rdx
	.cfi_def_cfa_offset 240
	movl	168(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.L19
	movq	40(%rsp), %rdi
	call	fDeepCopy@PLT
	movq	40(%rsp), %rdi
	movq	%rax, %rbx
	call	fFreeHandle@PLT
	movq	%rbx, %rdi
	movq	%r15, %rsi
	call	fHorzcat@PLT
	movq	%rbx, %rdi
	movq	%rax, 40(%rsp)
	call	fFreeHandle@PLT
	jmp	.L20
.L43:
	movq	%r15, %rdi
	call	fDeepCopy@PLT
	movq	%rax, 40(%rsp)
	jmp	.L20
.L19:
	movq	%r15, %rdi
	call	fDeepCopy@PLT
	movl	$0, 168(%rsp)
	movq	%rax, 40(%rsp)
	jmp	.L20
	.cfi_endproc
.LFE39:
	.size	sift, .-sift
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1258291200
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst4
	.align 4
.LC2:
	.long	1065353216
	.align 4
.LC3:
	.long	1073808403
	.align 4
.LC4:
	.long	1056964608
	.section	.rodata.cst16
	.align 16
.LC5:
	.long	2147483648
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst4
	.align 4
.LC6:
	.long	1001308990
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	0
	.long	1071644672
	.align 8
.LC8:
	.long	0
	.long	1127219200
	.section	.rodata.cst16
	.align 16
.LC9:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC10:
	.long	0
	.long	1072693248
	.section	.rodata.cst4
	.align 4
.LC12:
	.long	1004172302
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
