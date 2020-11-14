	.file	"siftrefinemx.c"
	.text
	.p2align 4
	.globl	siftrefinemx
	.type	siftrefinemx, @function
siftrefinemx:
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
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movl	4(%rdi), %ebx
	movl	160(%rsp), %eax
	movl	%edx, 56(%rsp)
	movl	%ecx, 48(%rsp)
	movl	%r8d, 20(%rsp)
	movl	%eax, 36(%rsp)
	movss	%xmm0, 60(%rsp)
	testl	%ebx, %ebx
	je	.L142
	movq	%rsi, %rbp
	movl	%ebx, %edi
	movl	$3, %esi
	movl	%r9d, 8(%rsp)
	call	fMallocHandle@PLT
	movl	8(%rsp), %r10d
	movq	%rax, 40(%rsp)
	movl	20(%rsp), %eax
	imull	%r10d, %eax
	movl	%eax, 52(%rsp)
	testl	%ebx, %ebx
	jle	.L3
	movl	48(%rsp), %eax
	pxor	%xmm11, %xmm11
	movl	$0, 64(%rsp)
	movl	$3, %r12d
	cvtsi2sdl	56(%rsp), %xmm11
	movss	.LC0(%rip), %xmm1
	movss	.LC2(%rip), %xmm14
	movss	.LC1(%rip), %xmm0
	movss	.LC3(%rip), %xmm15
	addl	$1, %eax
	movss	.LC4(%rip), %xmm8
	imull	%eax, %eax
	movl	%eax, 84(%rsp)
	leal	-1(%rbx), %eax
	leaq	6(%rax,%rax,2), %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L58:
	movss	-4(%r13,%r12,4), %xmm2
	movaps	%xmm0, %xmm4
	movaps	%xmm2, %xmm3
	movaps	%xmm2, %xmm5
	andps	%xmm0, %xmm3
	ucomiss	%xmm3, %xmm1
	jbe	.L4
	cvttss2sil	%xmm2, %eax
	pxor	%xmm3, %xmm3
	andnps	%xmm5, %xmm4
	cvtsi2ssl	%eax, %xmm3
	cmpnless	%xmm3, %xmm2
	andps	%xmm14, %xmm2
	addss	%xmm3, %xmm2
	orps	%xmm4, %xmm2
.L4:
	cvttss2sil	%xmm2, %ecx
	testl	%ecx, %ecx
	jle	.L5
	movss	0(%r13,%r12,4), %xmm2
	movaps	%xmm0, %xmm4
	movaps	%xmm2, %xmm3
	movaps	%xmm2, %xmm5
	andps	%xmm0, %xmm3
	ucomiss	%xmm3, %xmm1
	jbe	.L6
	cvttss2sil	%xmm2, %eax
	pxor	%xmm3, %xmm3
	movss	.LC2(%rip), %xmm6
	andnps	%xmm5, %xmm4
	cvtsi2ssl	%eax, %xmm3
	cmpnless	%xmm3, %xmm2
	andps	%xmm6, %xmm2
	addss	%xmm3, %xmm2
	orps	%xmm4, %xmm2
.L6:
	cvttss2sil	%xmm2, %esi
	leal	-1(%r10), %r8d
	testl	%esi, %esi
	jle	.L5
	cmpl	%ecx, %r8d
	jle	.L5
	leal	-1(%r12), %eax
	movaps	%xmm0, %xmm4
	cltq
	movss	8(%r13,%rax,4), %xmm2
	movaps	%xmm2, %xmm3
	movaps	%xmm2, %xmm5
	andps	%xmm0, %xmm3
	ucomiss	%xmm3, %xmm1
	jbe	.L7
	cvttss2sil	%xmm2, %eax
	pxor	%xmm3, %xmm3
	movss	.LC2(%rip), %xmm6
	andnps	%xmm5, %xmm4
	cvtsi2ssl	%eax, %xmm3
	cmpnless	%xmm3, %xmm2
	andps	%xmm6, %xmm2
	addss	%xmm3, %xmm2
	orps	%xmm4, %xmm2
.L7:
	cvtss2sd	%xmm2, %xmm2
	subsd	%xmm11, %xmm2
	movl	20(%rsp), %ebx
	leal	-1(%rbx), %eax
	cvttsd2sil	%xmm2, %edi
	movl	%eax, 32(%rsp)
	testl	%edi, %edi
	jle	.L5
	cmpl	%esi, %eax
	jle	.L5
	movl	36(%rsp), %eax
	subl	$1, %eax
	movl	%eax, 72(%rsp)
	cmpl	%edi, %eax
	jg	.L143
	.p2align 4,,10
	.p2align 3
.L5:
	addq	$3, %r12
	cmpq	8(%rsp), %r12
	jne	.L58
	movl	64(%rsp), %ebx
	movl	$2863311531, %eax
	movl	$3, %edi
	movq	%rbx, %r14
	imulq	%rax, %rbx
	shrq	$33, %rbx
	movl	%ebx, %esi
	call	fMallocHandle@PLT
	movq	%rax, %r12
	cmpl	$2, %r14d
	jle	.L59
	movq	40(%rsp), %rax
	xorl	%edx, %edx
	leaq	8(%rax), %rcx
	movslq	(%r12), %rax
	salq	$2, %rax
	leaq	(%r12,%rax), %rsi
	addq	%rsi, %rax
	.p2align 4,,10
	.p2align 3
.L60:
	movss	(%rcx), %xmm0
	addq	$12, %rcx
	movss	%xmm0, 8(%r12,%rdx,4)
	movss	-8(%rcx), %xmm0
	movss	%xmm0, 8(%rsi,%rdx,4)
	movss	-4(%rcx), %xmm0
	movss	%xmm0, 8(%rax,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %ebx
	jg	.L60
.L59:
	movq	40(%rsp), %rdi
	call	free@PLT
	addq	$104, %rsp
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
	.p2align 4,,10
	.p2align 3
.L143:
	.cfi_restore_state
	movl	52(%rsp), %eax
	movl	%eax, %edx
	imull	%edi, %edx
	leal	(%rdx,%rax), %r15d
	movl	%r15d, 76(%rsp)
	movl	%edx, %r15d
	subl	%eax, %r15d
	movl	%r15d, 80(%rsp)
	cmpl	$1, %ebx
	jne	.L144
	leal	1(%rcx), %r14d
	leal	-1(%rcx), %r15d
	pxor	%xmm13, %xmm13
	movss	%xmm15, 68(%rsp)
	leal	(%rsi,%r14), %eax
	addl	%edx, %eax
	cltq
	movss	8(%rbp,%rax,4), %xmm10
	leal	(%rsi,%r15), %eax
	addl	%edx, %eax
	cltq
	movaps	%xmm10, %xmm3
	movss	8(%rbp,%rax,4), %xmm5
	leal	1(%rsi), %eax
	movl	%eax, 28(%rsp)
	addl	%ecx, %eax
	addl	%edx, %eax
	subss	%xmm5, %xmm3
	cltq
	movss	8(%rbp,%rax,4), %xmm9
	leal	-1(%rsi), %eax
	movl	%eax, 24(%rsp)
	mulss	%xmm15, %xmm3
	addl	%ecx, %eax
	addl	%edx, %eax
	movaps	%xmm9, %xmm4
	cltq
	movss	8(%rbp,%rax,4), %xmm6
	xorl	%eax, %eax
	subss	%xmm6, %xmm4
	movaps	%xmm3, %xmm2
	xorps	%xmm8, %xmm2
	cvtss2sd	%xmm2, %xmm13
	comisd	.LC5(%rip), %xmm13
	mulss	%xmm15, %xmm4
	movaps	%xmm4, %xmm7
	xorps	%xmm8, %xmm7
	ja	.L145
.L31:
	movsd	.LC6(%rip), %xmm12
	comisd	%xmm13, %xmm12
	pxor	%xmm13, %xmm13
	cvtss2sd	%xmm7, %xmm13
	seta	%bl
	xorl	%r11d, %r11d
	cmpl	$1, %ecx
	setg	%r11b
	andl	%ebx, %r11d
	subl	%r11d, %eax
	comisd	%xmm13, %xmm12
	seta	%r11b
	xorl	%ebx, %ebx
	cmpl	$1, %esi
	setg	%bl
	andl	%ebx, %r11d
	movl	%r11d, %ebx
	negl	%ebx
	orl	%eax, %ebx
	je	.L72
	addl	%ecx, %eax
	subl	%r11d, %esi
	pxor	%xmm13, %xmm13
	xorl	%r11d, %r11d
	leal	1(%rax), %r14d
	leal	-1(%rax), %r15d
	leal	(%rsi,%r14), %ecx
	leal	1(%rsi), %ebx
	addl	%edx, %ecx
	movl	%ebx, 28(%rsp)
	movslq	%ecx, %rcx
	movss	8(%rbp,%rcx,4), %xmm10
	leal	(%rsi,%r15), %ecx
	addl	%edx, %ecx
	movslq	%ecx, %rcx
	movaps	%xmm10, %xmm3
	movss	8(%rbp,%rcx,4), %xmm5
	leal	(%rbx,%rax), %ecx
	leal	-1(%rsi), %ebx
	addl	%edx, %ecx
	movl	%ebx, 24(%rsp)
	movslq	%ecx, %rcx
	subss	%xmm5, %xmm3
	movss	8(%rbp,%rcx,4), %xmm9
	leal	(%rbx,%rax), %ecx
	addl	%edx, %ecx
	mulss	%xmm15, %xmm3
	movslq	%ecx, %rcx
	movaps	%xmm9, %xmm4
	movss	8(%rbp,%rcx,4), %xmm6
	subss	%xmm6, %xmm4
	movaps	%xmm3, %xmm2
	mulss	%xmm15, %xmm4
	xorps	%xmm8, %xmm2
	cvtss2sd	%xmm2, %xmm13
	comisd	.LC5(%rip), %xmm13
	movaps	%xmm4, %xmm7
	xorps	%xmm8, %xmm7
	ja	.L146
.L33:
	comisd	%xmm13, %xmm12
	pxor	%xmm13, %xmm13
	cvtss2sd	%xmm7, %xmm13
	seta	%bl
	xorl	%ecx, %ecx
	cmpl	$1, %eax
	setg	%cl
	andl	%ebx, %ecx
	subl	%ecx, %r11d
	comisd	%xmm13, %xmm12
	seta	%cl
	xorl	%ebx, %ebx
	cmpl	$1, %esi
	setg	%bl
	andl	%ebx, %ecx
	movl	%ecx, %ebx
	negl	%ebx
	orl	%r11d, %ebx
	je	.L79
	addl	%r11d, %eax
	subl	%ecx, %esi
	pxor	%xmm13, %xmm13
	xorl	%r11d, %r11d
	leal	1(%rax), %r14d
	leal	-1(%rax), %r15d
	leal	(%r14,%rsi), %ecx
	leal	1(%rsi), %ebx
	addl	%edx, %ecx
	movl	%ebx, 28(%rsp)
	movslq	%ecx, %rcx
	movss	8(%rbp,%rcx,4), %xmm10
	leal	(%r15,%rsi), %ecx
	addl	%edx, %ecx
	movslq	%ecx, %rcx
	movaps	%xmm10, %xmm3
	movss	8(%rbp,%rcx,4), %xmm5
	leal	(%rbx,%rax), %ecx
	leal	-1(%rsi), %ebx
	addl	%edx, %ecx
	movl	%ebx, 24(%rsp)
	movslq	%ecx, %rcx
	subss	%xmm5, %xmm3
	movss	8(%rbp,%rcx,4), %xmm9
	leal	(%rbx,%rax), %ecx
	addl	%edx, %ecx
	mulss	%xmm15, %xmm3
	movslq	%ecx, %rcx
	movaps	%xmm9, %xmm4
	movss	8(%rbp,%rcx,4), %xmm6
	subss	%xmm6, %xmm4
	movaps	%xmm3, %xmm2
	mulss	%xmm15, %xmm4
	xorps	%xmm8, %xmm2
	cvtss2sd	%xmm2, %xmm13
	comisd	.LC5(%rip), %xmm13
	movaps	%xmm4, %xmm7
	xorps	%xmm8, %xmm7
	ja	.L147
.L35:
	comisd	%xmm13, %xmm12
	pxor	%xmm13, %xmm13
	cvtss2sd	%xmm7, %xmm13
	seta	%bl
	xorl	%ecx, %ecx
	cmpl	$1, %eax
	setg	%cl
	andl	%ebx, %ecx
	subl	%ecx, %r11d
	comisd	%xmm13, %xmm12
	seta	%cl
	xorl	%ebx, %ebx
	cmpl	$1, %esi
	setg	%bl
	andl	%ebx, %ecx
	movl	%ecx, %ebx
	negl	%ebx
	orl	%r11d, %ebx
	je	.L79
	addl	%r11d, %eax
	subl	%ecx, %esi
	pxor	%xmm13, %xmm13
	xorl	%r11d, %r11d
	leal	1(%rax), %r14d
	leal	-1(%rax), %r15d
	leal	(%r14,%rsi), %ecx
	leal	1(%rsi), %ebx
	addl	%edx, %ecx
	movl	%ebx, 28(%rsp)
	movslq	%ecx, %rcx
	movss	8(%rbp,%rcx,4), %xmm10
	leal	(%r15,%rsi), %ecx
	addl	%edx, %ecx
	movslq	%ecx, %rcx
	movaps	%xmm10, %xmm3
	movss	8(%rbp,%rcx,4), %xmm5
	leal	(%rbx,%rax), %ecx
	leal	-1(%rsi), %ebx
	addl	%edx, %ecx
	movl	%ebx, 24(%rsp)
	movslq	%ecx, %rcx
	subss	%xmm5, %xmm3
	movss	8(%rbp,%rcx,4), %xmm9
	leal	(%rbx,%rax), %ecx
	addl	%edx, %ecx
	mulss	%xmm15, %xmm3
	movslq	%ecx, %rcx
	movaps	%xmm9, %xmm4
	movss	8(%rbp,%rcx,4), %xmm6
	subss	%xmm6, %xmm4
	movaps	%xmm3, %xmm2
	mulss	%xmm15, %xmm4
	xorps	%xmm8, %xmm2
	cvtss2sd	%xmm2, %xmm13
	comisd	.LC5(%rip), %xmm13
	movaps	%xmm4, %xmm7
	xorps	%xmm8, %xmm7
	jbe	.L37
	movl	52(%rsp), %ebx
	xorl	%r11d, %r11d
	leal	-2(%rbx), %ecx
	cmpl	%eax, %ecx
	setg	%r11b
.L37:
	comisd	%xmm13, %xmm12
	pxor	%xmm13, %xmm13
	cvtss2sd	%xmm7, %xmm13
	seta	%bl
	xorl	%ecx, %ecx
	cmpl	$1, %eax
	setg	%cl
	andl	%ebx, %ecx
	subl	%ecx, %r11d
	xorl	%ecx, %ecx
	comisd	.LC5(%rip), %xmm13
	ja	.L148
.L39:
	comisd	%xmm13, %xmm12
	seta	88(%rsp)
	xorl	%ebx, %ebx
	movzbl	88(%rsp), %r9d
	cmpl	$1, %esi
	setg	%bl
	andl	%r9d, %ebx
	subl	%ebx, %ecx
	movl	%ecx, %ebx
	orl	%r11d, %ebx
	je	.L79
	addl	%r11d, %eax
	addl	%ecx, %esi
	leal	1(%rax), %r14d
	leal	-1(%rax), %r15d
	leal	(%r14,%rsi), %ecx
	leal	1(%rsi), %ebx
	addl	%edx, %ecx
	movl	%ebx, 28(%rsp)
	movslq	%ecx, %rcx
	movss	8(%rbp,%rcx,4), %xmm10
	leal	(%r15,%rsi), %ecx
	addl	%edx, %ecx
	movslq	%ecx, %rcx
	movaps	%xmm10, %xmm3
	movss	8(%rbp,%rcx,4), %xmm5
	leal	(%rbx,%rax), %ecx
	leal	-1(%rsi), %ebx
	addl	%edx, %ecx
	movl	%ebx, 24(%rsp)
	movslq	%ecx, %rcx
	subss	%xmm5, %xmm3
	movss	8(%rbp,%rcx,4), %xmm9
	leal	(%rbx,%rax), %ecx
	addl	%edx, %ecx
	mulss	%xmm15, %xmm3
	movslq	%ecx, %rcx
	movaps	%xmm9, %xmm4
	movss	8(%rbp,%rcx,4), %xmm6
	movl	%eax, %ecx
	subss	%xmm6, %xmm4
	movaps	%xmm3, %xmm2
	mulss	%xmm15, %xmm4
	xorps	%xmm8, %xmm2
	movaps	%xmm4, %xmm7
	xorps	%xmm8, %xmm7
.L30:
	movl	76(%rsp), %ebx
	movl	80(%rsp), %r11d
	mulss	%xmm4, %xmm7
	addl	%esi, %eax
	movss	68(%rsp), %xmm12
	mulss	%xmm3, %xmm2
	addl	%eax, %ebx
	addl	%eax, %r11d
	addl	%edx, %eax
	movslq	%ebx, %rbx
	movslq	%r11d, %r11
	cltq
	movss	8(%rbp,%rbx,4), %xmm13
	subss	8(%rbp,%r11,4), %xmm13
	addss	%xmm7, %xmm2
	mulss	%xmm13, %xmm12
	pxor	%xmm13, %xmm13
	cvtss2sd	8(%rbp,%rax,4), %xmm13
	movaps	%xmm12, %xmm7
	mulss	%xmm12, %xmm7
	subss	%xmm7, %xmm2
	cvtss2sd	%xmm2, %xmm2
	mulsd	.LC7(%rip), %xmm2
	addsd	%xmm13, %xmm2
	cvtsd2ss	%xmm2, %xmm2
	andps	%xmm0, %xmm2
	comiss	60(%rsp), %xmm2
	jbe	.L5
	movl	28(%rsp), %ebx
	movl	24(%rsp), %r9d
	addss	%xmm10, %xmm5
	addss	%xmm9, %xmm6
	pxor	%xmm2, %xmm2
	addsd	%xmm13, %xmm13
	leal	(%rbx,%r14), %r11d
	leal	(%r9,%r15), %eax
	addl	%edx, %r11d
	addl	%edx, %eax
	cvtss2sd	%xmm5, %xmm2
	pxor	%xmm5, %xmm5
	cltq
	movslq	%r11d, %r11
	cvtss2sd	%xmm6, %xmm5
	subsd	%xmm13, %xmm2
	movss	8(%rbp,%r11,4), %xmm6
	addss	8(%rbp,%rax,4), %xmm6
	leal	(%rbx,%r15), %eax
	addl	%edx, %eax
	subsd	%xmm13, %xmm5
	cltq
	cvtsd2ss	%xmm2, %xmm2
	movaps	%xmm2, %xmm7
	subss	8(%rbp,%rax,4), %xmm6
	movl	%r9d, %eax
	addl	%r14d, %eax
	cvtsd2ss	%xmm5, %xmm5
	addss	%xmm5, %xmm7
	mulss	%xmm5, %xmm2
	addl	%edx, %eax
	cltq
	subss	8(%rbp,%rax,4), %xmm6
	movl	84(%rsp), %eax
	mulss	%xmm7, %xmm7
	mulss	.LC8(%rip), %xmm6
	cltd
	idivl	48(%rsp)
	mulss	%xmm6, %xmm6
	subss	%xmm6, %xmm2
	divss	%xmm2, %xmm7
	pxor	%xmm2, %xmm2
	cvtsi2ssl	%eax, %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L5
	pxor	%xmm6, %xmm6
	comiss	%xmm6, %xmm7
	jb	.L5
	movss	.LC10(%rip), %xmm6
	movaps	%xmm3, %xmm2
	andps	%xmm0, %xmm2
	comiss	%xmm2, %xmm6
	jbe	.L5
	movaps	%xmm4, %xmm2
	andps	%xmm0, %xmm2
	comiss	%xmm2, %xmm6
	jbe	.L5
	movaps	%xmm12, %xmm2
	andps	%xmm0, %xmm2
	comiss	%xmm2, %xmm6
	jbe	.L5
	pxor	%xmm2, %xmm2
	pxor	%xmm6, %xmm6
	cvtsi2ssl	%ecx, %xmm2
	subss	%xmm3, %xmm2
	comiss	%xmm6, %xmm2
	movaps	%xmm2, %xmm3
	jb	.L5
	pxor	%xmm2, %xmm2
	cvtsi2ssl	%r8d, %xmm2
	comiss	%xmm3, %xmm2
	jb	.L5
	pxor	%xmm2, %xmm2
	cvtsi2ssl	%esi, %xmm2
	subss	%xmm4, %xmm2
	comiss	%xmm6, %xmm2
	jb	.L5
	pxor	%xmm4, %xmm4
	cvtsi2ssl	32(%rsp), %xmm4
	comiss	%xmm2, %xmm4
	jb	.L5
	pxor	%xmm4, %xmm4
	cvtsi2ssl	%edi, %xmm4
	subss	%xmm12, %xmm4
	comiss	%xmm6, %xmm4
	jb	.L5
	pxor	%xmm5, %xmm5
	cvtsi2ssl	72(%rsp), %xmm5
	comiss	%xmm4, %xmm5
	jb	.L5
	movslq	64(%rsp), %rax
	movq	40(%rsp), %rsi
	movq	%rax, %rdi
	leaq	(%rsi,%rax,4), %rax
	movss	%xmm2, 12(%rax)
	pxor	%xmm2, %xmm2
	addl	$3, %edi
	cvtsi2ssl	56(%rsp), %xmm2
	movl	%edi, 64(%rsp)
	movss	%xmm3, 8(%rax)
	addss	%xmm2, %xmm4
	movss	%xmm4, 16(%rax)
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L142:
	addq	$104, %rsp
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
	jmp	fDeepCopy@PLT
.L145:
	.cfi_restore_state
	movl	52(%rsp), %eax
	subl	$2, %eax
	cmpl	%eax, %ecx
	setl	%al
	movzbl	%al, %eax
	jmp	.L31
.L146:
	movl	52(%rsp), %ebx
	xorl	%r11d, %r11d
	leal	-2(%rbx), %ecx
	cmpl	%eax, %ecx
	setg	%r11b
	jmp	.L33
.L147:
	movl	52(%rsp), %ebx
	xorl	%r11d, %r11d
	leal	-2(%rbx), %ecx
	cmpl	%eax, %ecx
	setg	%r11b
	jmp	.L35
.L148:
	xorl	%ecx, %ecx
	cmpl	$-1, %esi
	setl	%cl
	jmp	.L39
.L144:
	leal	1(%rcx), %eax
	movss	.LC3(%rip), %xmm7
	pxor	%xmm13, %xmm13
	imull	%ebx, %eax
	movss	%xmm7, 68(%rsp)
	movl	%eax, %r14d
	leal	(%rax,%rsi), %eax
	addl	%edx, %eax
	movl	%r14d, %r15d
	cltq
	movss	8(%rbp,%rax,4), %xmm10
	leal	(%rbx,%rbx), %eax
	subl	%eax, %r15d
	movl	%eax, 88(%rsp)
	leal	(%r15,%rsi), %eax
	movaps	%xmm10, %xmm3
	addl	%edx, %eax
	cltq
	movss	8(%rbp,%rax,4), %xmm5
	leal	(%r15,%rbx), %eax
	leal	1(%rsi), %ebx
	leal	(%rbx,%rax), %r9d
	movl	%ebx, 28(%rsp)
	leal	-1(%rsi), %ebx
	addl	%edx, %r9d
	leal	(%rbx,%rax), %r11d
	subss	%xmm5, %xmm3
	movl	%ebx, 24(%rsp)
	addl	%edx, %r11d
	movslq	%r9d, %r9
	xorl	%ebx, %ebx
	movss	8(%rbp,%r9,4), %xmm9
	movslq	%r11d, %r11
	mulss	%xmm7, %xmm3
	movss	8(%rbp,%r11,4), %xmm6
	movaps	%xmm9, %xmm4
	subss	%xmm6, %xmm4
	mulss	%xmm7, %xmm4
	movaps	%xmm3, %xmm2
	xorps	.LC4(%rip), %xmm2
	cvtss2sd	%xmm2, %xmm13
	comisd	.LC5(%rip), %xmm13
	movaps	%xmm4, %xmm7
	xorps	.LC4(%rip), %xmm7
	jbe	.L9
	leal	-2(%r10), %r11d
	xorl	%ebx, %ebx
	cmpl	%r11d, %ecx
	setl	%bl
.L9:
	movsd	.LC6(%rip), %xmm12
	comisd	%xmm13, %xmm12
	pxor	%xmm13, %xmm13
	cvtss2sd	%xmm7, %xmm13
	seta	92(%rsp)
	xorl	%r11d, %r11d
	movzbl	92(%rsp), %r9d
	cmpl	$1, %ecx
	setg	%r11b
	andl	%r9d, %r11d
	subl	%r11d, %ebx
	xorl	%r11d, %r11d
	comisd	.LC5(%rip), %xmm13
	ja	.L149
.L11:
	cmpl	$1, %esi
	setg	92(%rsp)
	xorl	%r9d, %r9d
	comisd	%xmm13, %xmm12
	seta	%r9b
	andl	92(%rsp), %r9d
	subl	%r9d, %r11d
	movl	%ebx, %r9d
	orl	%r11d, %r9d
	je	.L30
	addl	%ebx, %ecx
	movl	20(%rsp), %ebx
	addl	%r11d, %esi
	movss	68(%rsp), %xmm7
	leal	1(%rcx), %eax
	pxor	%xmm13, %xmm13
	imull	%ebx, %eax
	movl	%eax, %r14d
	leal	(%rsi,%rax), %eax
	addl	%edx, %eax
	movl	%r14d, %r15d
	subl	88(%rsp), %r15d
	cltq
	movss	8(%rbp,%rax,4), %xmm10
	leal	(%rsi,%r15), %eax
	addl	%edx, %eax
	cltq
	movaps	%xmm10, %xmm3
	movss	8(%rbp,%rax,4), %xmm5
	leal	(%rbx,%r15), %eax
	leal	1(%rsi), %ebx
	leal	(%rax,%rbx), %r9d
	movl	%ebx, 28(%rsp)
	leal	-1(%rsi), %ebx
	addl	%edx, %r9d
	leal	(%rax,%rbx), %r11d
	subss	%xmm5, %xmm3
	movl	%ebx, 24(%rsp)
	addl	%edx, %r11d
	movslq	%r9d, %r9
	xorl	%ebx, %ebx
	movss	8(%rbp,%r9,4), %xmm9
	movslq	%r11d, %r11
	mulss	%xmm7, %xmm3
	movss	8(%rbp,%r11,4), %xmm6
	movaps	%xmm9, %xmm4
	subss	%xmm6, %xmm4
	mulss	%xmm7, %xmm4
	movaps	%xmm3, %xmm2
	xorps	.LC4(%rip), %xmm2
	cvtss2sd	%xmm2, %xmm13
	comisd	.LC5(%rip), %xmm13
	movaps	%xmm4, %xmm7
	xorps	.LC4(%rip), %xmm7
	jbe	.L14
	leal	-2(%r10), %r11d
	xorl	%ebx, %ebx
	cmpl	%r11d, %ecx
	setl	%bl
.L14:
	cmpl	$1, %ecx
	setg	92(%rsp)
	xorl	%r11d, %r11d
	movzbl	92(%rsp), %r9d
	comisd	%xmm13, %xmm12
	pxor	%xmm13, %xmm13
	cvtss2sd	%xmm7, %xmm13
	seta	%r11b
	andl	%r9d, %r11d
	subl	%r11d, %ebx
	xorl	%r11d, %r11d
	comisd	.LC5(%rip), %xmm13
	ja	.L150
.L16:
	cmpl	$1, %esi
	setg	92(%rsp)
	xorl	%r9d, %r9d
	comisd	%xmm13, %xmm12
	seta	%r9b
	andl	92(%rsp), %r9d
	subl	%r9d, %r11d
	movl	%ebx, %r9d
	orl	%r11d, %r9d
	je	.L30
	addl	%ebx, %ecx
	movl	20(%rsp), %ebx
	addl	%r11d, %esi
	movss	68(%rsp), %xmm7
	leal	1(%rcx), %eax
	pxor	%xmm13, %xmm13
	imull	%ebx, %eax
	movl	%eax, %r14d
	leal	(%rsi,%rax), %eax
	addl	%edx, %eax
	movl	%r14d, %r15d
	subl	88(%rsp), %r15d
	cltq
	movss	8(%rbp,%rax,4), %xmm10
	leal	(%rsi,%r15), %eax
	addl	%edx, %eax
	cltq
	movaps	%xmm10, %xmm3
	movss	8(%rbp,%rax,4), %xmm5
	leal	(%rbx,%r15), %eax
	leal	1(%rsi), %ebx
	leal	(%rax,%rbx), %r9d
	movl	%ebx, 28(%rsp)
	leal	-1(%rsi), %ebx
	addl	%edx, %r9d
	leal	(%rax,%rbx), %r11d
	subss	%xmm5, %xmm3
	movl	%ebx, 24(%rsp)
	addl	%edx, %r11d
	movslq	%r9d, %r9
	xorl	%ebx, %ebx
	movss	8(%rbp,%r9,4), %xmm9
	movslq	%r11d, %r11
	mulss	%xmm7, %xmm3
	movss	8(%rbp,%r11,4), %xmm6
	movaps	%xmm9, %xmm4
	subss	%xmm6, %xmm4
	mulss	%xmm7, %xmm4
	movaps	%xmm3, %xmm2
	xorps	.LC4(%rip), %xmm2
	cvtss2sd	%xmm2, %xmm13
	comisd	.LC5(%rip), %xmm13
	movaps	%xmm4, %xmm7
	xorps	.LC4(%rip), %xmm7
	jbe	.L18
	leal	-2(%r10), %r11d
	xorl	%ebx, %ebx
	cmpl	%r11d, %ecx
	setl	%bl
.L18:
	cmpl	$1, %ecx
	setg	92(%rsp)
	xorl	%r11d, %r11d
	movzbl	92(%rsp), %r9d
	comisd	%xmm13, %xmm12
	pxor	%xmm13, %xmm13
	cvtss2sd	%xmm7, %xmm13
	seta	%r11b
	andl	%r9d, %r11d
	subl	%r11d, %ebx
	xorl	%r11d, %r11d
	comisd	.LC5(%rip), %xmm13
	ja	.L151
.L20:
	cmpl	$1, %esi
	setg	92(%rsp)
	xorl	%r9d, %r9d
	comisd	%xmm13, %xmm12
	seta	%r9b
	andl	92(%rsp), %r9d
	subl	%r9d, %r11d
	movl	%ebx, %r9d
	orl	%r11d, %r9d
	je	.L30
	addl	%ebx, %ecx
	movl	20(%rsp), %ebx
	addl	%r11d, %esi
	movss	68(%rsp), %xmm7
	leal	1(%rcx), %eax
	pxor	%xmm13, %xmm13
	imull	%ebx, %eax
	movl	%eax, %r14d
	leal	(%rsi,%rax), %eax
	addl	%edx, %eax
	movl	%r14d, %r15d
	subl	88(%rsp), %r15d
	cltq
	movss	8(%rbp,%rax,4), %xmm10
	leal	(%rsi,%r15), %eax
	addl	%edx, %eax
	cltq
	movaps	%xmm10, %xmm3
	movss	8(%rbp,%rax,4), %xmm5
	leal	(%rbx,%r15), %eax
	leal	1(%rsi), %ebx
	leal	(%rax,%rbx), %r9d
	movl	%ebx, 28(%rsp)
	leal	-1(%rsi), %ebx
	addl	%edx, %r9d
	leal	(%rax,%rbx), %r11d
	subss	%xmm5, %xmm3
	movl	%ebx, 24(%rsp)
	addl	%edx, %r11d
	movslq	%r9d, %r9
	xorl	%ebx, %ebx
	movss	8(%rbp,%r9,4), %xmm9
	movslq	%r11d, %r11
	mulss	%xmm7, %xmm3
	movss	8(%rbp,%r11,4), %xmm6
	movaps	%xmm9, %xmm4
	subss	%xmm6, %xmm4
	mulss	%xmm7, %xmm4
	movaps	%xmm3, %xmm2
	xorps	.LC4(%rip), %xmm2
	cvtss2sd	%xmm2, %xmm13
	comisd	.LC5(%rip), %xmm13
	movaps	%xmm4, %xmm7
	xorps	.LC4(%rip), %xmm7
	jbe	.L22
	leal	-2(%r10), %r11d
	xorl	%ebx, %ebx
	cmpl	%r11d, %ecx
	setl	%bl
.L22:
	cmpl	$1, %ecx
	setg	92(%rsp)
	xorl	%r11d, %r11d
	movzbl	92(%rsp), %r9d
	comisd	%xmm13, %xmm12
	pxor	%xmm13, %xmm13
	cvtss2sd	%xmm7, %xmm13
	seta	%r11b
	andl	%r9d, %r11d
	subl	%r11d, %ebx
	xorl	%r11d, %r11d
	comisd	.LC5(%rip), %xmm13
	ja	.L152
.L24:
	cmpl	$1, %esi
	setg	92(%rsp)
	xorl	%r9d, %r9d
	comisd	%xmm13, %xmm12
	seta	%r9b
	andl	92(%rsp), %r9d
	subl	%r9d, %r11d
	movl	%ebx, %r9d
	orl	%r11d, %r9d
	je	.L30
	addl	%ebx, %ecx
	movl	20(%rsp), %ebx
	addl	%r11d, %esi
	movss	68(%rsp), %xmm7
	leal	1(%rcx), %eax
	imull	%ebx, %eax
	movl	%eax, %r14d
	leal	(%rax,%rsi), %eax
	addl	%edx, %eax
	movl	%r14d, %r15d
	subl	88(%rsp), %r15d
	cltq
	movss	8(%rbp,%rax,4), %xmm10
	leal	(%r15,%rsi), %eax
	addl	%edx, %eax
	cltq
	movaps	%xmm10, %xmm3
	movss	8(%rbp,%rax,4), %xmm5
	leal	(%r15,%rbx), %eax
	leal	1(%rsi), %ebx
	leal	(%rax,%rbx), %r9d
	movl	%ebx, 28(%rsp)
	leal	-1(%rsi), %ebx
	addl	%edx, %r9d
	leal	(%rax,%rbx), %r11d
	subss	%xmm5, %xmm3
	movl	%ebx, 24(%rsp)
	movslq	%r9d, %r9
	addl	%edx, %r11d
	movss	8(%rbp,%r9,4), %xmm9
	movslq	%r11d, %r11
	movss	8(%rbp,%r11,4), %xmm6
	mulss	%xmm7, %xmm3
	movaps	%xmm9, %xmm4
	subss	%xmm6, %xmm4
	mulss	%xmm7, %xmm4
	movaps	%xmm3, %xmm2
	xorps	.LC4(%rip), %xmm2
	movaps	%xmm4, %xmm7
	xorps	.LC4(%rip), %xmm7
	jmp	.L30
.L3:
	xorl	%esi, %esi
	movl	$3, %edi
	call	fMallocHandle@PLT
	movq	%rax, %r12
	jmp	.L59
.L79:
	movl	%eax, %ecx
	jmp	.L30
.L149:
	movl	20(%rsp), %r9d
	leal	-2(%r9), %r11d
	cmpl	%r11d, %esi
	setl	%r11b
	movzbl	%r11b, %r11d
	jmp	.L11
.L150:
	movl	20(%rsp), %r9d
	leal	-2(%r9), %r11d
	cmpl	%r11d, %esi
	setl	%r11b
	movzbl	%r11b, %r11d
	jmp	.L16
.L151:
	movl	20(%rsp), %r9d
	leal	-2(%r9), %r11d
	cmpl	%r11d, %esi
	setl	%r11b
	movzbl	%r11b, %r11d
	jmp	.L20
.L152:
	movl	20(%rsp), %r9d
	leal	-2(%r9), %r11d
	cmpl	%r11d, %esi
	setl	%r11b
	movzbl	%r11b, %r11d
	jmp	.L24
.L72:
	movl	%ecx, %eax
	jmp	.L30
	.cfi_endproc
.LFE39:
	.size	siftrefinemx, .-siftrefinemx
	.globl	max_iter
	.section	.rodata
	.align 4
	.type	max_iter, @object
	.size	max_iter, 4
max_iter:
	.long	5
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
	.long	1056964608
	.section	.rodata.cst16
	.align 16
.LC4:
	.long	2147483648
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	858993459
	.long	1071854387
	.align 8
.LC6:
	.long	858993459
	.long	-1075629261
	.align 8
.LC7:
	.long	0
	.long	1071644672
	.section	.rodata.cst4
	.align 4
.LC8:
	.long	1048576000
	.align 4
.LC10:
	.long	1069547520
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
