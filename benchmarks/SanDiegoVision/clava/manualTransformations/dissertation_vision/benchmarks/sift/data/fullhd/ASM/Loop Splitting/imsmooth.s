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
	.cfi_offset 15, -24
	movq	%rsi, %r15
	leaq	ruse(%rip), %rsi
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -72(%rbp)
	xorl	%edi, %edi
	movss	%xmm0, -76(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	getrusage@PLT
	movq	24+ruse(%rip), %rax
	pxor	%xmm0, %xmm0
	addq	8+ruse(%rip), %rax
	cvtsi2sdq	%rax, %xmm0
	pxor	%xmm1, %xmm1
	movq	16+ruse(%rip), %rax
	addq	ruse(%rip), %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-72(%rbp), %r9
	movss	-76(%rbp), %xmm2
	mulsd	.LC1(%rip), %xmm0
	comiss	.LC2(%rip), %xmm2
	movl	4(%r9), %eax
	movl	(%r9), %ebx
	movl	%eax, -96(%rbp)
	movl	%ebx, -72(%rbp)
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -112(%rbp)
	ja	.L2
	imull	%ebx, %eax
	testl	%eax, %eax
	jle	.L4
	subl	$1, %eax
	leaq	8(%r9), %rsi
	leaq	8(%r15), %rdi
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
	subsd	-112(%rbp), %xmm0
	mulsd	.LC8(%rip), %xmm0
	call	__printf_chk@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L97
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
	ja	.L98
.L5:
	cvttss2sil	%xmm0, %r8d
	movq	%rsp, %rbx
	leal	(%r8,%r8), %eax
	movl	%eax, -80(%rbp)
	addl	$1, %eax
	movl	%eax, -104(%rbp)
	cltq
	leaq	15(,%rax,4), %rdx
	movq	%rdx, %rax
	andq	$-4096, %rdx
	subq	%rdx, %rbx
	andq	$-16, %rax
	movq	%rbx, %rdx
	cmpq	%rdx, %rsp
	je	.L7
.L99:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rdx, %rsp
	jne	.L99
.L7:
	andl	$4095, %eax
	subq	%rax, %rsp
	testq	%rax, %rax
	jne	.L100
.L8:
	movl	-72(%rbp), %esi
	movl	-96(%rbp), %edi
	pxor	%xmm0, %xmm0
	movq	%r9, -88(%rbp)
	movl	%r8d, -76(%rbp)
	movq	%rsp, %rbx
	movss	%xmm2, -128(%rbp)
	call	fSetArray@PLT
	movl	-80(%rbp), %edx
	movl	-76(%rbp), %r8d
	movq	-88(%rbp), %r9
	movss	-128(%rbp), %xmm2
	movq	%rax, %r12
	testl	%edx, %edx
	js	.L16
	mulss	%xmm2, %xmm2
	movl	-80(%rbp), %edi
	movl	%r8d, %eax
	movl	%r8d, -128(%rbp)
	movq	%r9, -144(%rbp)
	negl	%eax
	movq	%rbx, %r14
	movq	%rbx, %r13
	subl	%r8d, %edi
	movq	%r12, -136(%rbp)
	movl	%eax, %r12d
	movq	%rbx, -152(%rbp)
	movl	%edi, %ebx
	movss	%xmm2, -88(%rbp)
	pxor	%xmm2, %xmm2
	movss	%xmm2, -76(%rbp)
	.p2align 4,,10
	.p2align 3
.L12:
	pxor	%xmm1, %xmm1
	movss	.LC7(%rip), %xmm0
	addq	$4, %r13
	cvtsi2ssl	%r12d, %xmm1
	mulss	%xmm1, %xmm0
	mulss	%xmm1, %xmm0
	divss	-88(%rbp), %xmm0
	call	expf@PLT
	movl	%r12d, %ecx
	addl	$1, %r12d
	movss	%xmm0, -4(%r13)
	addss	-76(%rbp), %xmm0
	movss	%xmm0, -76(%rbp)
	cmpl	%ebx, %ecx
	jne	.L12
	cmpl	$2, -80(%rbp)
	movl	-128(%rbp), %r8d
	movaps	%xmm0, %xmm2
	movq	-136(%rbp), %r12
	movq	-144(%rbp), %r9
	movq	-152(%rbp), %rbx
	jle	.L63
	movl	-104(%rbp), %eax
	movaps	%xmm0, %xmm1
	shufps	$0, %xmm1, %xmm1
	shrl	$2, %eax
	salq	$4, %rax
	addq	%rbx, %rax
.L14:
	movups	(%r14), %xmm0
	addq	$16, %r14
	divps	%xmm1, %xmm0
	movups	%xmm0, -16(%r14)
	cmpq	%rax, %r14
	jne	.L14
	movl	-104(%rbp), %edi
	movl	%edi, %eax
	andl	$-4, %eax
	andl	$3, %edi
	je	.L16
.L13:
	movslq	%eax, %rdx
	movl	-80(%rbp), %edi
	leaq	(%rbx,%rdx,4), %rdx
	movss	(%rdx), %xmm0
	divss	%xmm2, %xmm0
	movss	%xmm0, (%rdx)
	leal	1(%rax), %edx
	cmpl	%edx, %edi
	jl	.L16
	movslq	%edx, %rdx
	addl	$2, %eax
	leaq	(%rbx,%rdx,4), %rdx
	movss	(%rdx), %xmm0
	divss	%xmm2, %xmm0
	movss	%xmm0, (%rdx)
	cmpl	%eax, %edi
	jl	.L16
	cltq
	leaq	(%rbx,%rax,4), %rax
	movss	(%rax), %xmm0
	divss	%xmm2, %xmm0
	movss	%xmm0, (%rax)
.L16:
	movl	-96(%rbp), %eax
	testl	%eax, %eax
	jle	.L11
	movl	-72(%rbp), %edi
	movslq	%r8d, %rdx
	movq	%r15, -128(%rbp)
	xorl	%r14d, %r14d
	movl	%edi, %eax
	leal	-1(%rdi), %r13d
	subl	%r8d, %eax
	leal	-1(%rax), %esi
	subl	%r8d, %eax
	movl	%esi, -76(%rbp)
	leaq	(%rbx,%rdx,4), %rsi
	movl	%eax, -80(%rbp)
	subl	$1, %eax
	movq	%rsi, -88(%rbp)
	movl	%eax, -104(%rbp)
	.p2align 4,,10
	.p2align 3
.L18:
	movq	-88(%rbp), %rdx
	xorl	%r10d, %r10d
	testl	%r8d, %r8d
	jle	.L21
	.p2align 4,,10
	.p2align 3
.L20:
#APP
# 317 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#Start of Loop 1 - Columns:
# 0 "" 2
#NO_APP
	leal	(%r10,%r8), %eax
	cmpl	%r13d, %eax
	cmovg	%r13d, %eax
#APP
# 321 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#End of Loop 1 - Columns:
# 0 "" 2
#NO_APP
	testl	%eax, %eax
	js	.L23
	movl	(%r12), %ecx
	cltq
	leaq	4(,%rax,4), %rdi
	movl	(%r9), %eax
	imull	%r14d, %ecx
	imull	%r14d, %eax
	addl	%r10d, %ecx
	movslq	%ecx, %rcx
	cltq
	leaq	(%r12,%rcx,4), %rcx
	leaq	(%r9,%rax,4), %rsi
	xorl	%eax, %eax
	movss	8(%rcx), %xmm1
	.p2align 4,,10
	.p2align 3
.L22:
	movss	8(%rsi,%rax), %xmm0
	mulss	(%rdx,%rax), %xmm0
	addq	$4, %rax
	addss	%xmm0, %xmm1
	movss	%xmm1, 8(%rcx)
	cmpq	%rdi, %rax
	jne	.L22
.L23:
	addl	$1, %r10d
	subq	$4, %rdx
	cmpl	%r10d, %r8d
	jne	.L20
.L21:
	movl	-104(%rbp), %edi
	xorl	%r10d, %r10d
	cmpl	-76(%rbp), %r8d
	jge	.L29
	.p2align 4,,10
	.p2align 3
.L28:
	leal	(%r8,%r10), %edx
#APP
# 325 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#Start of Loop 2 - Columns:
# 0 "" 2
#NO_APP
	leal	(%r8,%rdx), %ecx
	cmpl	%r13d, %ecx
	cmovg	%r13d, %ecx
#APP
# 329 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#End of Loop 2 - Columns:
# 0 "" 2
#NO_APP
	cmpl	%ecx, %r10d
	jg	.L31
	movl	(%r12), %eax
	subl	%r10d, %ecx
	imull	%r14d, %eax
	addl	%edx, %eax
	cltq
	leaq	(%r12,%rax,4), %r11
	movl	(%r9), %eax
	movss	8(%r11), %xmm1
	imull	%r14d, %eax
	addl	%r10d, %eax
	cltq
	leaq	(%r9,%rax,4), %rsi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L30:
	movss	8(%rsi,%rax,4), %xmm0
	mulss	(%rbx,%rax,4), %xmm0
	movq	%rax, %rdx
	addq	$1, %rax
	addss	%xmm0, %xmm1
	movss	%xmm1, 8(%r11)
	cmpq	%rcx, %rdx
	jne	.L30
.L31:
	addl	$1, %r10d
	cmpl	%edi, %r10d
	jne	.L28
.L29:
	movl	-80(%rbp), %eax
	leal	-1(%rax), %r15d
	movl	-76(%rbp), %eax
	movl	%eax, %r11d
	cmpl	%eax, -72(%rbp)
	jle	.L26
	.p2align 4,,10
	.p2align 3
.L33:
#APP
# 333 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#Start of Loop 3 - Columns:
# 0 "" 2
#NO_APP
	movl	$0, %edx
	testl	%r15d, %r15d
	leal	(%r8,%r11), %ecx
	movl	%r8d, %eax
	cmovns	%r15d, %edx
	cmpl	%r13d, %ecx
	movl	$0, %edi
	cmovg	%r13d, %ecx
	subl	%r11d, %eax
	cmovs	%edi, %eax
#APP
# 337 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#End of Loop 3 - Columns:
# 0 "" 2
#NO_APP
	cmpl	%ecx, %edx
	jg	.L35
	movl	(%r12), %esi
	movl	(%r9), %edi
	subl	%edx, %ecx
	cltq
	imull	%r14d, %esi
	imull	%r14d, %edi
	addl	%r11d, %esi
	movslq	%esi, %rsi
	addl	%edi, %edx
	leaq	(%rbx,%rax,4), %rdi
	xorl	%eax, %eax
	leaq	(%r12,%rsi,4), %rsi
	movslq	%edx, %rdx
	movss	8(%rsi), %xmm1
	leaq	(%r9,%rdx,4), %r10
	.p2align 4,,10
	.p2align 3
.L34:
	movss	8(%r10,%rax,4), %xmm0
	mulss	(%rdi,%rax,4), %xmm0
	movq	%rax, %rdx
	addq	$1, %rax
	addss	%xmm0, %xmm1
	movss	%xmm1, 8(%rsi)
	cmpq	%rcx, %rdx
	jne	.L34
.L35:
	addl	$1, %r11d
	addl	$1, %r15d
	cmpl	%r11d, -72(%rbp)
	jg	.L33
.L26:
	addl	$1, %r14d
	cmpl	%r14d, -96(%rbp)
	jne	.L18
	movq	-128(%rbp), %r15
.L11:
	testl	%r8d, %r8d
	jle	.L37
	movl	-72(%rbp), %r11d
	testl	%r11d, %r11d
	jle	.L37
	movl	-96(%rbp), %edi
	movl	%r8d, -80(%rbp)
	movslq	%r8d, %rax
	xorl	%r13d, %r13d
	movq	%rbx, -104(%rbp)
	leaq	(%rbx,%rax,4), %r14
	subl	$1, %edi
	movl	%edi, -76(%rbp)
	leaq	4(%rbx), %rdi
	movq	%rax, %rbx
	movq	%rdi, -88(%rbp)
	.p2align 4,,10
	.p2align 3
.L39:
	movl	-80(%rbp), %eax
	movq	-88(%rbp), %rdi
	movq	%r12, %r9
	leal	(%rax,%r13), %r10d
	movl	-76(%rbp), %eax
	cmpl	%r10d, %eax
	cmovle	%eax, %r10d
	xorl	%r8d, %r8d
	movl	%r10d, %eax
	addq	%rbx, %rax
	leaq	(%rdi,%rax,4), %rdi
	.p2align 4,,10
	.p2align 3
.L41:
#APP
# 346 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#Start of Loop 1 - Rows
# 0 "" 2
# 350 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#End of Loop 1 - Rows
# 0 "" 2
#NO_APP
	testl	%r10d, %r10d
	js	.L44
	movl	(%r15), %eax
	movslq	(%r12), %rcx
	movq	%r9, %rdx
	imull	%r13d, %eax
	salq	$2, %rcx
	addl	%r8d, %eax
	cltq
	leaq	(%r15,%rax,4), %rsi
	movq	%r14, %rax
	movss	8(%rsi), %xmm1
	.p2align 4,,10
	.p2align 3
.L43:
	movss	8(%rdx), %xmm0
	mulss	(%rax), %xmm0
	addq	$4, %rax
	addq	%rcx, %rdx
	addss	%xmm0, %xmm1
	movss	%xmm1, 8(%rsi)
	cmpq	%rax, %rdi
	jne	.L43
.L44:
	addl	$1, %r8d
	addq	$4, %r9
	cmpl	%r8d, %r11d
	jne	.L41
	addl	$1, %r13d
	subq	$4, %r14
	subq	$1, %rbx
	cmpl	%r13d, -80(%rbp)
	jne	.L39
	movl	-80(%rbp), %r8d
	movq	-104(%rbp), %rbx
.L37:
	movl	-96(%rbp), %edi
	movl	%edi, %eax
	subl	%r8d, %eax
	leal	-1(%rax), %esi
	movl	%esi, -104(%rbp)
	cmpl	%esi, %r8d
	jge	.L45
	movl	-72(%rbp), %esi
	testl	%esi, %esi
	jle	.L45
	subl	%r8d, %eax
	xorl	%r10d, %r10d
	leal	-1(%rax), %r14d
	leal	-1(%rdi), %eax
	movl	%eax, -76(%rbp)
	leaq	4(%rbx), %rax
	movq	%rax, -88(%rbp)
	movl	%r14d, -80(%rbp)
	movl	%esi, %r14d
	.p2align 4,,10
	.p2align 3
.L47:
	movl	-76(%rbp), %eax
	leal	(%r8,%r10), %r13d
	movq	-88(%rbp), %rdi
	leal	(%r8,%r13), %r11d
	cmpl	%eax, %r11d
	cmovg	%eax, %r11d
	xorl	%r9d, %r9d
	movl	%r11d, %eax
	subl	%r10d, %eax
	leaq	(%rdi,%rax,4), %rdi
	.p2align 4,,10
	.p2align 3
.L49:
#APP
# 357 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#Start of Loop 2 - Rows
# 0 "" 2
# 361 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#End of Loop 2 - Rows
# 0 "" 2
#NO_APP
	cmpl	%r11d, %r10d
	jg	.L52
	movl	(%r15), %edx
	movslq	(%r12), %rcx
	imull	%r13d, %edx
	movq	%rcx, %rax
	salq	$2, %rcx
	imull	%r10d, %eax
	addl	%r9d, %edx
	movslq	%edx, %rdx
	addl	%r9d, %eax
	leaq	(%r15,%rdx,4), %rsi
	cltq
	movss	8(%rsi), %xmm1
	leaq	(%r12,%rax,4), %rdx
	movq	%rbx, %rax
	.p2align 4,,10
	.p2align 3
.L51:
	movss	8(%rdx), %xmm0
	mulss	(%rax), %xmm0
	addq	$4, %rax
	addq	%rcx, %rdx
	addss	%xmm0, %xmm1
	movss	%xmm1, 8(%rsi)
	cmpq	%rax, %rdi
	jne	.L51
.L52:
	addl	$1, %r9d
	cmpl	%r9d, %r14d
	jne	.L49
	addl	$1, %r10d
	cmpl	%r10d, -80(%rbp)
	jne	.L47
.L45:
	movl	-96(%rbp), %eax
	movl	-104(%rbp), %r14d
	cmpl	%r14d, %eax
	jle	.L53
	movl	-72(%rbp), %esi
	testl	%esi, %esi
	jle	.L53
	movl	%eax, %edi
	subl	$1, %eax
	movl	%r8d, -80(%rbp)
	subl	%r8d, %r14d
	movl	%eax, -76(%rbp)
	subl	%r8d, %edi
	leaq	4(%rbx), %rax
	movl	%edi, -72(%rbp)
	movq	%rax, -88(%rbp)
	movq	%rbx, -96(%rbp)
	movl	%esi, %ebx
	.p2align 4,,10
	.p2align 3
.L55:
	movl	-80(%rbp), %eax
	testl	%r14d, %r14d
	movl	$0, %r9d
	movl	$0, %edi
	cmovns	%r14d, %r9d
	leal	(%rax,%r14), %r11d
	leal	(%r11,%rax), %r10d
	movl	-76(%rbp), %eax
	cmpl	%r10d, %eax
	cmovle	%eax, %r10d
	movl	%r14d, %eax
	negl	%eax
	testl	%eax, %eax
	movl	%r10d, %edx
	cmovs	%edi, %eax
	movq	-96(%rbp), %rdi
	subl	%r9d, %edx
	xorl	%r8d, %r8d
	cltq
	leaq	(%rdi,%rax,4), %r13
	movq	-88(%rbp), %rdi
	addq	%rdx, %rax
	leaq	(%rdi,%rax,4), %rdi
	.p2align 4,,10
	.p2align 3
.L57:
#APP
# 367 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#Start of Loop 3 - Rows
# 0 "" 2
# 371 "/home/osboxes/Documents/dissertation_vision/benchmarks/sift/src/c/imsmooth.c" 1
	#End of Loop 3 - Rows
# 0 "" 2
#NO_APP
	cmpl	%r10d, %r9d
	jg	.L60
	movl	(%r15), %edx
	movslq	(%r12), %rcx
	imull	%r11d, %edx
	movq	%rcx, %rax
	salq	$2, %rcx
	imull	%r9d, %eax
	addl	%r8d, %edx
	movslq	%edx, %rdx
	addl	%r8d, %eax
	leaq	(%r15,%rdx,4), %rsi
	cltq
	movss	8(%rsi), %xmm1
	leaq	(%r12,%rax,4), %rdx
	movq	%r13, %rax
	.p2align 4,,10
	.p2align 3
.L59:
	movss	8(%rdx), %xmm0
	mulss	(%rax), %xmm0
	addq	$4, %rax
	addq	%rcx, %rdx
	addss	%xmm0, %xmm1
	movss	%xmm1, 8(%rsi)
	cmpq	%rax, %rdi
	jne	.L59
.L60:
	addl	$1, %r8d
	cmpl	%r8d, %ebx
	jne	.L57
	addl	$1, %r14d
	cmpl	%r14d, -72(%rbp)
	jne	.L55
.L53:
	movq	%r12, %rdi
	call	fFreeHandle@PLT
	movq	-120(%rbp), %rsp
	jmp	.L4
.L98:
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
.L100:
	orq	$0, -8(%rsp,%rax)
	jmp	.L8
.L63:
	xorl	%eax, %eax
	jmp	.L13
.L97:
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
	.align 4
.LC7:
	.long	3204448256
	.section	.rodata.cst8
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
