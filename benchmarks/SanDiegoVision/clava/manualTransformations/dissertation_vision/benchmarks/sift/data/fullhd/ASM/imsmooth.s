	.file	"imsmooth.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC9:
	.string	"t - \t%.3f\n"
	.text
	.p2align 4
	.globl	imsmooth
	.type	imsmooth, @function
imsmooth:
.LFB50:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movq	%rdi, %r12
	xorl	%edi, %edi
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 3, -56
	movq	%rsi, -72(%rbp)
	leaq	ruse(%rip), %rsi
	movss	%xmm0, -88(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	getrusage@PLT
	movq	24+ruse(%rip), %rax
	pxor	%xmm0, %xmm0
	addq	8+ruse(%rip), %rax
	cvtsi2sdq	%rax, %xmm0
	pxor	%xmm1, %xmm1
	movl	(%r12), %ebx
	movq	-72(%rbp), %r8
	mulsd	.LC1(%rip), %xmm0
	movq	16+ruse(%rip), %rax
	addq	ruse(%rip), %rax
	movss	-88(%rbp), %xmm2
	movl	%ebx, -80(%rbp)
	cvtsi2sdq	%rax, %xmm1
	comiss	.LC2(%rip), %xmm2
	movl	4(%r12), %eax
	movl	%eax, -76(%rbp)
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -104(%rbp)
	ja	.L2
	imull	%ebx, %eax
	testl	%eax, %eax
	jle	.L4
	subl	$1, %eax
	leaq	8(%r12), %rsi
	leaq	8(%r8), %rdi
	leaq	4(,%rax,4), %rdx
	call	memmove@PLT
.L4:
	xorl	%edi, %edi
	leaq	ruse(%rip), %rsi
	call	getrusage@PLT
	movq	24+ruse(%rip), %rax
	pxor	%xmm0, %xmm0
	addq	8+ruse(%rip), %rax
	cvtsi2sdq	%rax, %xmm0
	pxor	%xmm1, %xmm1
	movq	16+ruse(%rip), %rax
	addq	ruse(%rip), %rax
	mulsd	.LC1(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC9(%rip), %rsi
	addsd	%xmm1, %xmm0
	subsd	-104(%rbp), %xmm0
	mulsd	.LC8(%rip), %xmm0
	call	__printf_chk@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L53
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L2:
	.cfi_restore_state
	movss	.LC3(%rip), %xmm4
	movss	.LC5(%rip), %xmm3
	movq	%rsp, -120(%rbp)
	movss	.LC4(%rip), %xmm5
	mulss	%xmm2, %xmm4
	movaps	%xmm4, %xmm1
	movaps	%xmm4, %xmm0
	andps	%xmm3, %xmm1
	ucomiss	%xmm1, %xmm5
	ja	.L54
.L5:
	cvttss2sil	%xmm0, %ebx
	movq	%rsp, %rcx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -108(%rbp)
	addl	$1, %eax
	movl	%eax, -112(%rbp)
	cltq
	leaq	15(,%rax,4), %rdx
	movq	%rdx, %rax
	andq	$-4096, %rdx
	subq	%rdx, %rcx
	andq	$-16, %rax
	movq	%rcx, %rdx
	cmpq	%rdx, %rsp
	je	.L7
.L55:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rdx, %rsp
	jne	.L55
.L7:
	andl	$4095, %eax
	subq	%rax, %rsp
	testq	%rax, %rax
	jne	.L56
.L8:
	movl	-80(%rbp), %esi
	movl	-76(%rbp), %edi
	pxor	%xmm0, %xmm0
	movq	%r8, -96(%rbp)
	movss	%xmm2, -72(%rbp)
	movq	%rsp, -88(%rbp)
	call	fSetArray@PLT
	movl	-108(%rbp), %edx
	movss	-72(%rbp), %xmm2
	movq	-96(%rbp), %r8
	movq	%rax, %r11
	testl	%edx, %edx
	js	.L16
	mulss	%xmm2, %xmm2
	movl	-108(%rbp), %eax
	movq	-88(%rbp), %r14
	movl	%ebx, %r13d
	pxor	%xmm5, %xmm5
	movq	%r11, -136(%rbp)
	negl	%r13d
	subl	%ebx, %eax
	movl	%ebx, -124(%rbp)
	movq	%r14, %r15
	movq	%r12, -144(%rbp)
	movl	%eax, %ebx
	movl	%r13d, %r12d
	movq	%r14, %r13
	movq	%r8, %r14
	cvtss2sd	%xmm2, %xmm5
	pxor	%xmm2, %xmm2
	movsd	%xmm5, -96(%rbp)
	movss	%xmm2, -72(%rbp)
	.p2align 4,,10
	.p2align 3
.L12:
	pxor	%xmm1, %xmm1
	movsd	.LC7(%rip), %xmm0
	addq	$4, %r13
	cvtsi2sdl	%r12d, %xmm1
	mulsd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm0
	divsd	-96(%rbp), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	call	expf@PLT
	movl	%r12d, %ecx
	movss	%xmm0, -4(%r13)
	addss	-72(%rbp), %xmm0
	addl	$1, %r12d
	movss	%xmm0, -72(%rbp)
	cmpl	%ebx, %ecx
	jne	.L12
	cmpl	$2, -108(%rbp)
	movl	-124(%rbp), %ebx
	movaps	%xmm0, %xmm2
	movq	%r14, %r8
	movq	-136(%rbp), %r11
	movq	-144(%rbp), %r12
	jle	.L34
	movl	-112(%rbp), %eax
	movaps	%xmm0, %xmm1
	shufps	$0, %xmm1, %xmm1
	shrl	$2, %eax
	salq	$4, %rax
	addq	-88(%rbp), %rax
.L14:
	movups	(%r15), %xmm0
	addq	$16, %r15
	divps	%xmm1, %xmm0
	movups	%xmm0, -16(%r15)
	cmpq	%rax, %r15
	jne	.L14
	movl	-112(%rbp), %ecx
	movl	%ecx, %eax
	andl	$-4, %eax
	andl	$3, %ecx
	je	.L16
.L13:
	movq	-88(%rbp), %rcx
	movslq	%eax, %rdx
	movl	-108(%rbp), %edi
	leaq	(%rcx,%rdx,4), %rdx
	movss	(%rdx), %xmm0
	divss	%xmm2, %xmm0
	movss	%xmm0, (%rdx)
	leal	1(%rax), %edx
	cmpl	%edx, %edi
	jl	.L16
	movslq	%edx, %rdx
	addl	$2, %eax
	leaq	(%rcx,%rdx,4), %rdx
	movss	(%rdx), %xmm0
	divss	%xmm2, %xmm0
	movss	%xmm0, (%rdx)
	cmpl	%eax, %edi
	jl	.L16
	cltq
	leaq	(%rcx,%rax,4), %rax
	movss	(%rax), %xmm0
	divss	%xmm2, %xmm0
	movss	%xmm0, (%rax)
.L16:
	movl	-76(%rbp), %eax
	testl	%eax, %eax
	jle	.L11
	movl	-80(%rbp), %eax
	testl	%eax, %eax
	jle	.L11
	leal	-1(%rax), %r15d
	subl	%ebx, %eax
	movq	%r8, -96(%rbp)
	movq	-88(%rbp), %r10
	movl	%eax, -72(%rbp)
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L23:
	movl	%ebx, %r9d
	negl	%r9d
	.p2align 4,,10
	.p2align 3
.L19:
	leal	(%r9,%rbx), %edi
#APP
# 489 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#Start of Baseline Loop - Columns:
# 0 "" 2
#NO_APP
	testl	%r9d, %r9d
	leal	(%rbx,%rdi), %ecx
	movl	%r14d, %edx
	movl	%r9d, %eax
	cmovns	%r9d, %edx
	cmpl	%r15d, %ecx
	cmovg	%r15d, %ecx
	negl	%eax
	testl	%eax, %eax
	cmovs	%r14d, %eax
#APP
# 493 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#End of Baseline Loop - Columns:
# 0 "" 2
#NO_APP
	cmpl	%ecx, %edx
	jg	.L22
	movl	(%r11), %esi
	subl	%edx, %ecx
	cltq
	imull	%r13d, %esi
	addl	%edi, %esi
	movl	(%r12), %edi
	movslq	%esi, %rsi
	imull	%r13d, %edi
	leaq	(%r11,%rsi,4), %rsi
	movss	8(%rsi), %xmm1
	addl	%edi, %edx
	leaq	(%r10,%rax,4), %rdi
	xorl	%eax, %eax
	movslq	%edx, %rdx
	leaq	(%r12,%rdx,4), %r8
	.p2align 4,,10
	.p2align 3
.L21:
	movss	8(%r8,%rax,4), %xmm0
	mulss	(%rdi,%rax,4), %xmm0
	movq	%rax, %rdx
	addq	$1, %rax
	addss	%xmm0, %xmm1
	movss	%xmm1, 8(%rsi)
	cmpq	%rcx, %rdx
	jne	.L21
.L22:
	addl	$1, %r9d
	cmpl	-72(%rbp), %r9d
	jne	.L19
	addl	$1, %r13d
	cmpl	%r13d, -76(%rbp)
	jne	.L23
	movl	-76(%rbp), %eax
	movq	-96(%rbp), %r8
	movl	%ebx, %r15d
	movl	-80(%rbp), %r13d
	movl	%ebx, -80(%rbp)
	negl	%r15d
	movl	%eax, %ecx
	subl	$1, %eax
	movl	%eax, -76(%rbp)
	movq	-88(%rbp), %rax
	subl	%ebx, %ecx
	movl	%ecx, -72(%rbp)
	addq	$4, %rax
	movq	%rax, -96(%rbp)
	.p2align 4,,10
	.p2align 3
.L31:
	movl	-80(%rbp), %eax
	testl	%r15d, %r15d
	movl	$0, %r10d
	movl	$0, %ecx
	cmovns	%r15d, %r10d
	leal	(%r15,%rax), %r12d
	leal	(%rax,%r12), %ebx
	movl	-76(%rbp), %eax
	cmpl	%ebx, %eax
	cmovle	%eax, %ebx
	movl	%r15d, %eax
	negl	%eax
	testl	%eax, %eax
	movl	%ebx, %edx
	cmovs	%ecx, %eax
	movq	-88(%rbp), %rcx
	subl	%r10d, %edx
	xorl	%r9d, %r9d
	cltq
	leaq	(%rcx,%rax,4), %r14
	movq	-96(%rbp), %rcx
	addq	%rdx, %rax
	leaq	(%rcx,%rax,4), %rdi
	.p2align 4,,10
	.p2align 3
.L27:
#APP
# 506 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#Start of Baseline Loop - Rows:
# 0 "" 2
# 510 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#End of Baseline Loop - Rows:
# 0 "" 2
#NO_APP
	cmpl	%ebx, %r10d
	jg	.L30
	movl	(%r8), %edx
	movslq	(%r11), %rcx
	imull	%r12d, %edx
	movq	%rcx, %rax
	salq	$2, %rcx
	imull	%r10d, %eax
	addl	%r9d, %edx
	movslq	%edx, %rdx
	addl	%r9d, %eax
	leaq	(%r8,%rdx,4), %rsi
	cltq
	movss	8(%rsi), %xmm1
	leaq	(%r11,%rax,4), %rdx
	movq	%r14, %rax
	.p2align 4,,10
	.p2align 3
.L29:
	movss	8(%rdx), %xmm0
	mulss	(%rax), %xmm0
	addq	$4, %rax
	addq	%rcx, %rdx
	addss	%xmm0, %xmm1
	movss	%xmm1, 8(%rsi)
	cmpq	%rax, %rdi
	jne	.L29
.L30:
	addl	$1, %r9d
	cmpl	%r9d, %r13d
	jne	.L27
	addl	$1, %r15d
	cmpl	-72(%rbp), %r15d
	jne	.L31
.L11:
	movq	%r11, %rdi
	call	fFreeHandle@PLT
	movq	-120(%rbp), %rsp
	jmp	.L4
.L54:
	cvttss2sil	%xmm4, %eax
	pxor	%xmm1, %xmm1
	movss	.LC6(%rip), %xmm5
	andnps	%xmm4, %xmm3
	cvtsi2ssl	%eax, %xmm1
	cmpnless	%xmm1, %xmm0
	andps	%xmm5, %xmm0
	addss	%xmm1, %xmm0
	orps	%xmm3, %xmm0
	jmp	.L5
.L56:
	orq	$0, -8(%rsp,%rax)
	jmp	.L8
.L34:
	xorl	%eax, %eax
	jmp	.L13
.L53:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE50:
	.size	imsmooth, .-imsmooth
	.globl	threshold
	.section	.rodata
	.align 4
	.type	threshold, @object
	.size	threshold, 4
threshold:
	.long	1008981770
	.globl	nbins
	.align 4
	.type	nbins, @object
	.size	nbins, 4
nbins:
	.long	36
	.globl	win_factor
	.align 8
	.type	win_factor, @object
	.size	win_factor, 8
win_factor:
	.long	0
	.long	1073217536
	.comm	ruse,144,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	2696277389
	.long	1051772663
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC2:
	.long	1008981770
	.align 4
.LC3:
	.long	1082130432
	.align 4
.LC4:
	.long	1258291200
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC5:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst4
	.align 4
.LC6:
	.long	1065353216
	.section	.rodata.cst8
	.align 8
.LC7:
	.long	0
	.long	-1075838976
	.align 8
.LC8:
	.long	0
	.long	1083129856
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
