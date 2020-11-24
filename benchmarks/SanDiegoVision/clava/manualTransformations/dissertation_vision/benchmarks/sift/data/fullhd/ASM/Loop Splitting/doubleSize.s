	.file	"doubleSize.c"
	.text
	.p2align 4
	.globl	doubleSize
	.type	doubleSize, @function
doubleSize:
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
	movl	4(%rdi), %r14d
	movl	(%rdi), %r15d
	leal	(%r14,%r14), %edi
	leal	(%r15,%r15), %esi
	movl	%r14d, 12(%rsp)
	movl	%r15d, 28(%rsp)
	call	fSetArray@PLT
	testl	%r14d, %r14d
	jle	.L1
	testl	%r15d, %r15d
	jle	.L58
	movl	28(%rsp), %edi
	movl	(%rbx), %r14d
	movl	(%rax), %r15d
	leal	-1(%rdi), %r11d
	movl	%edi, %r10d
	movl	%r14d, 24(%rsp)
	movl	%edi, %r14d
	cmpl	$9, %r11d
	movl	%r11d, 32(%rsp)
	seta	%r13b
	cmpq	%rax, %rbx
	setne	%dl
	andl	$-4, %r10d
	xorl	%r9d, %r9d
	addq	$2, %r11
	andl	%edx, %r13d
	leal	1(%r10), %ebp
	leal	2(%r10), %r12d
	movl	%edi, %edx
	shrl	$2, %edx
	salq	$4, %rdx
	movq	%rdx, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L4:
	movl	24(%rsp), %edi
	movl	%r15d, %esi
	imull	%r9d, %esi
	imull	%r9d, %edi
	testb	%r13b, %r13b
	je	.L59
	movslq	%edi, %rdx
	movq	16(%rsp), %r8
	leaq	8(%rbx,%rdx,4), %rcx
	leal	(%rsi,%rsi), %edx
	movslq	%edx, %rdx
	addq	%rcx, %r8
	leaq	8(%rax,%rdx,4), %rdx
	.p2align 4,,10
	.p2align 3
.L5:
	movups	(%rcx), %xmm0
	addq	$16, %rcx
	addq	$32, %rdx
	movaps	%xmm0, %xmm1
	movss	%xmm0, -32(%rdx)
	shufps	$85, %xmm0, %xmm1
	movss	%xmm1, -24(%rdx)
	movaps	%xmm0, %xmm1
	unpckhps	%xmm0, %xmm1
	shufps	$255, %xmm0, %xmm0
	movss	%xmm0, -8(%rdx)
	movss	%xmm1, -16(%rdx)
	cmpq	%r8, %rcx
	jne	.L5
	cmpl	%r10d, %r14d
	je	.L8
	leal	(%rdi,%r10), %edx
	movslq	%edx, %rdx
	movss	8(%rbx,%rdx,4), %xmm0
	leal	(%rsi,%r10), %edx
	addl	%edx, %edx
	movslq	%edx, %rdx
	movss	%xmm0, 8(%rax,%rdx,4)
	cmpl	%ebp, %r14d
	jle	.L8
	leal	(%rdi,%rbp), %edx
	movslq	%edx, %rdx
	movss	8(%rbx,%rdx,4), %xmm0
	leal	(%rsi,%rbp), %edx
	addl	%edx, %edx
	movslq	%edx, %rdx
	movss	%xmm0, 8(%rax,%rdx,4)
	cmpl	%r12d, %r14d
	jle	.L8
	addl	%r12d, %edi
	leal	(%rsi,%r12), %edx
	movslq	%edi, %rdi
	addl	%edx, %edx
	movss	8(%rbx,%rdi,4), %xmm0
	movslq	%edx, %rdx
	movss	%xmm0, 8(%rax,%rdx,4)
.L8:
	addl	$1, %r9d
	cmpl	%r9d, 12(%rsp)
	jne	.L4
.L3:
	cmpl	$1, 12(%rsp)
	je	.L10
	movl	32(%rsp), %edi
	testl	%edi, %edi
	jle	.L20
	movl	12(%rsp), %esi
	movl	%edi, %r12d
	movss	.LC2(%rip), %xmm3
	movl	$1, %r14d
	movaps	.LC1(%rip), %xmm2
	subl	$1, %esi
	movaps	%xmm3, %xmm4
	movl	%esi, 52(%rsp)
	movl	(%rbx), %esi
	movl	%esi, 36(%rsp)
	movl	(%rax), %esi
	movl	%esi, 48(%rsp)
	movl	28(%rsp), %esi
	leal	-2(%rsi), %edx
	cmpl	$2, %edx
	seta	%sil
	cmpq	%rax, %rbx
	setne	%cl
	andl	$-4, %edi
	shrl	$2, %r12d
	xorl	%r13d, %r13d
	movl	%edi, %r15d
	andl	%ecx, %esi
	leal	1(%rdi), %edi
	salq	$4, %r12
	leal	(%r15,%r15), %ecx
	movl	%edi, 24(%rsp)
	leal	1(%rcx), %edi
	movb	%sil, 40(%rsp)
	leal	5(%rcx), %esi
	movl	%edi, 56(%rsp)
	leal	2(%r15), %edi
	movl	%edi, 16(%rsp)
	leal	3(%rcx), %edi
	movl	%edi, 60(%rsp)
	leal	3(%r15), %edi
	movl	%edi, 64(%rsp)
	movl	%edx, %edi
	movl	%esi, 68(%rsp)
	movq	%rdi, 72(%rsp)
	.p2align 4,,10
	.p2align 3
.L17:
	movl	36(%rsp), %edi
	movl	%r13d, %esi
	movl	48(%rsp), %r8d
	addl	$1, %r13d
	imull	%edi, %esi
	imull	%r14d, %r8d
	addl	%esi, %edi
	cmpb	$0, 40(%rsp)
	je	.L60
	movslq	%esi, %rdx
	leaq	8(,%rdx,4), %rcx
	movslq	%edi, %rdx
	leaq	8(,%rdx,4), %rdx
	leaq	(%rbx,%rcx), %rbp
	leaq	(%rbx,%rdx), %r11
	leaq	4(%rbx,%rdx), %r9
	movslq	%r8d, %rdx
	leaq	4(%rbx,%rcx), %r10
	leaq	12(%rax,%rdx,4), %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L13:
	movups	0(%rbp,%rdx), %xmm0
	movups	(%r11,%rdx), %xmm5
	movups	(%r10,%rdx), %xmm6
	movups	(%r9,%rdx), %xmm7
	addps	%xmm5, %xmm0
	addps	%xmm6, %xmm0
	addps	%xmm7, %xmm0
	mulps	%xmm2, %xmm0
	movaps	%xmm0, %xmm1
	movss	%xmm0, (%rcx,%rdx,2)
	shufps	$85, %xmm0, %xmm1
	movss	%xmm1, 8(%rcx,%rdx,2)
	movaps	%xmm0, %xmm1
	unpckhps	%xmm0, %xmm1
	shufps	$255, %xmm0, %xmm0
	movss	%xmm0, 24(%rcx,%rdx,2)
	movss	%xmm1, 16(%rcx,%rdx,2)
	addq	$16, %rdx
	cmpq	%r12, %rdx
	jne	.L13
	movl	32(%rsp), %ebp
	cmpl	%r15d, %ebp
	je	.L16
	movl	24(%rsp), %ecx
	leal	(%rdi,%r15), %r9d
	movslq	%r9d, %r9
	leal	(%rsi,%rcx), %edx
	movss	8(%rbx,%r9,4), %xmm0
	movslq	%edx, %rdx
	leaq	(%rbx,%rdx,4), %r11
	leal	(%rdi,%rcx), %edx
	movslq	%edx, %rdx
	leal	(%rsi,%r15), %ecx
	leaq	(%rbx,%rdx,4), %r10
	movslq	%ecx, %rcx
	movl	56(%rsp), %edx
	addss	8(%rbx,%rcx,4), %xmm0
	addss	8(%r11), %xmm0
	addss	8(%r10), %xmm0
	addl	%r8d, %edx
	movl	24(%rsp), %ecx
	movslq	%edx, %rdx
	mulss	%xmm4, %xmm0
	movss	%xmm0, 8(%rax,%rdx,4)
	cmpl	%ebp, %ecx
	jge	.L16
	movl	16(%rsp), %ecx
	movss	8(%r11), %xmm0
	addss	8(%r10), %xmm0
	leal	(%rsi,%rcx), %edx
	movslq	%edx, %rdx
	leaq	(%rbx,%rdx,4), %r9
	leal	(%rdi,%rcx), %edx
	movslq	%edx, %rdx
	addss	8(%r9), %xmm0
	leaq	(%rbx,%rdx,4), %rcx
	movl	60(%rsp), %edx
	addss	8(%rcx), %xmm0
	addl	%r8d, %edx
	movslq	%edx, %rdx
	mulss	%xmm4, %xmm0
	movss	%xmm0, 8(%rax,%rdx,4)
	movl	16(%rsp), %edx
	cmpl	%edx, %ebp
	jle	.L16
	movss	8(%r9), %xmm0
	addss	8(%rcx), %xmm0
	movl	64(%rsp), %ecx
	addl	68(%rsp), %r8d
	movslq	%r8d, %r8
	addl	%ecx, %esi
	addl	%ecx, %edi
	movslq	%esi, %rsi
	movslq	%edi, %rdi
	addss	8(%rbx,%rsi,4), %xmm0
	addss	8(%rbx,%rdi,4), %xmm0
	mulss	%xmm4, %xmm0
	movss	%xmm0, 8(%rax,%r8,4)
.L16:
	addl	$2, %r14d
	cmpl	52(%rsp), %r13d
	jne	.L17
.L20:
	movl	28(%rsp), %esi
	testl	%esi, %esi
	jle	.L18
	movl	12(%rsp), %edi
	movl	%esi, %r11d
	movl	(%rbx), %r15d
	movl	$1, %r12d
	movl	32(%rsp), %r14d
	movss	.LC4(%rip), %xmm3
	subl	$1, %edi
	cmpq	%rax, %rbx
	movaps	.LC3(%rip), %xmm2
	setne	%cl
	movl	%edi, 36(%rsp)
	cmpl	$2, %r14d
	movl	(%rax), %edi
	seta	%dl
	andl	$-4, %esi
	shrl	$2, %r11d
	xorl	%ebp, %ebp
	movl	%esi, %r13d
	movl	%edi, 24(%rsp)
	leal	(%rsi,%rsi), %edi
	leal	1(%rsi), %esi
	movl	%esi, 40(%rsp)
	leal	2(%rdi), %esi
	andl	%edx, %ecx
	salq	$4, %r11
	movl	%edi, 48(%rsp)
	addl	$4, %edi
	addq	$2, %r14
	movaps	%xmm3, %xmm4
	movl	%esi, 52(%rsp)
	leal	2(%r13), %esi
	movb	%cl, 16(%rsp)
	movl	%esi, 56(%rsp)
	movl	%edi, 60(%rsp)
	.p2align 4,,10
	.p2align 3
.L19:
	movl	%ebp, %esi
	movl	24(%rsp), %r8d
	addl	$1, %ebp
	imull	%r15d, %esi
	imull	%r12d, %r8d
	cmpb	$0, 16(%rsp)
	leal	(%r15,%rsi), %edi
	je	.L61
	movslq	%esi, %rdx
	leaq	8(%rbx,%rdx,4), %r10
	movslq	%edi, %rdx
	leaq	8(%rbx,%rdx,4), %r9
	movslq	%r8d, %rdx
	leaq	8(%rax,%rdx,4), %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L23:
	movups	(%r10,%rdx), %xmm0
	movups	(%r9,%rdx), %xmm5
	addps	%xmm5, %xmm0
	mulps	%xmm2, %xmm0
	movaps	%xmm0, %xmm1
	movss	%xmm0, (%rcx,%rdx,2)
	shufps	$85, %xmm0, %xmm1
	movss	%xmm1, 8(%rcx,%rdx,2)
	movaps	%xmm0, %xmm1
	unpckhps	%xmm0, %xmm1
	shufps	$255, %xmm0, %xmm0
	movss	%xmm0, 24(%rcx,%rdx,2)
	movss	%xmm1, 16(%rcx,%rdx,2)
	addq	$16, %rdx
	cmpq	%r11, %rdx
	jne	.L23
	movl	28(%rsp), %r10d
	cmpl	%r13d, %r10d
	je	.L26
	movl	48(%rsp), %ecx
	leal	(%rsi,%r13), %r9d
	movslq	%r9d, %r9
	leal	(%r8,%rcx), %edx
	leal	(%rdi,%r13), %ecx
	movss	8(%rbx,%r9,4), %xmm0
	movslq	%ecx, %rcx
	movslq	%edx, %rdx
	addss	8(%rbx,%rcx,4), %xmm0
	movl	40(%rsp), %ecx
	mulss	%xmm4, %xmm0
	movss	%xmm0, 8(%rax,%rdx,4)
	cmpl	%r10d, %ecx
	jge	.L26
	leal	(%rcx,%rsi), %r9d
	addl	%edi, %ecx
	movl	52(%rsp), %edx
	movslq	%ecx, %rcx
	movslq	%r9d, %r9
	movss	8(%rbx,%r9,4), %xmm0
	addss	8(%rbx,%rcx,4), %xmm0
	addl	%r8d, %edx
	movl	56(%rsp), %ecx
	movslq	%edx, %rdx
	mulss	%xmm4, %xmm0
	movss	%xmm0, 8(%rax,%rdx,4)
	cmpl	%ecx, %r10d
	jle	.L26
	addl	%ecx, %esi
	addl	%ecx, %edi
	addl	60(%rsp), %r8d
	movslq	%esi, %rsi
	movslq	%edi, %rdi
	movslq	%r8d, %r8
	movss	8(%rbx,%rsi,4), %xmm0
	addss	8(%rbx,%rdi,4), %xmm0
	mulss	%xmm4, %xmm0
	movss	%xmm0, 8(%rax,%r8,4)
.L26:
	addl	$2, %r12d
	cmpl	36(%rsp), %ebp
	jne	.L19
.L18:
	movl	12(%rsp), %edx
	testl	%edx, %edx
	jle	.L1
.L10:
	movl	32(%rsp), %esi
	testl	%esi, %esi
	jle	.L1
	movl	28(%rsp), %edx
	movl	%esi, %ebp
	movl	(%rax), %edi
	movl	%esi, %r10d
	movl	(%rbx), %r15d
	movss	.LC4(%rip), %xmm3
	subl	$2, %edx
	cmpq	%rax, %rbx
	movl	%edi, 24(%rsp)
	movaps	.LC3(%rip), %xmm2
	setne	%r12b
	cmpl	$2, %edx
	movl	%r15d, 16(%rsp)
	movaps	%xmm3, %xmm4
	seta	%cl
	andl	$-4, %ebp
	shrl	$2, %r10d
	xorl	%r11d, %r11d
	andl	%ecx, %r12d
	leal	(%rbp,%rbp), %ecx
	salq	$4, %r10
	leal	1(%rbp), %r13d
	leal	1(%rcx), %edi
	leal	2(%rbp), %r14d
	movl	%esi, %r15d
	movl	%edi, 28(%rsp)
	leal	3(%rcx), %edi
	movl	%edi, 32(%rsp)
	leal	3(%rbp), %edi
	movl	%edi, 48(%rsp)
	leal	5(%rcx), %edi
	movl	%edi, 36(%rsp)
	leaq	1(%rdx), %rdi
	movq	%rdi, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L30:
	movl	24(%rsp), %esi
	movl	16(%rsp), %edi
	imull	%r11d, %esi
	imull	%r11d, %edi
	addl	%esi, %esi
	testb	%r12b, %r12b
	je	.L62
	movslq	%edi, %rdx
	leaq	8(,%rdx,4), %rdx
	leaq	(%rbx,%rdx), %r9
	leaq	4(%rbx,%rdx), %r8
	movslq	%esi, %rdx
	leaq	12(%rax,%rdx,4), %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L31:
	movups	(%r8,%rdx), %xmm0
	movups	(%r9,%rdx), %xmm6
	addps	%xmm6, %xmm0
	mulps	%xmm2, %xmm0
	movaps	%xmm0, %xmm1
	movss	%xmm0, (%rcx,%rdx,2)
	shufps	$85, %xmm0, %xmm1
	movss	%xmm1, 8(%rcx,%rdx,2)
	movaps	%xmm0, %xmm1
	unpckhps	%xmm0, %xmm1
	shufps	$255, %xmm0, %xmm0
	movss	%xmm0, 24(%rcx,%rdx,2)
	movss	%xmm1, 16(%rcx,%rdx,2)
	addq	$16, %rdx
	cmpq	%r10, %rdx
	jne	.L31
	cmpl	%r15d, %ebp
	je	.L34
	movl	28(%rsp), %ecx
	leal	0(%r13,%rdi), %edx
	movslq	%edx, %rdx
	leaq	(%rbx,%rdx,4), %r8
	leal	(%rcx,%rsi), %edx
	leal	(%rdi,%rbp), %ecx
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	movss	8(%rbx,%rcx,4), %xmm0
	addss	8(%r8), %xmm0
	mulss	%xmm4, %xmm0
	movss	%xmm0, 8(%rax,%rdx,4)
	cmpl	%r15d, %r13d
	jge	.L34
	leal	(%r14,%rdi), %edx
	movss	8(%r8), %xmm0
	movslq	%edx, %rdx
	leaq	(%rbx,%rdx,4), %rcx
	movl	32(%rsp), %edx
	addss	8(%rcx), %xmm0
	addl	%esi, %edx
	movslq	%edx, %rdx
	mulss	%xmm4, %xmm0
	movss	%xmm0, 8(%rax,%rdx,4)
	cmpl	%r15d, %r14d
	jge	.L34
	addl	48(%rsp), %edi
	addl	36(%rsp), %esi
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	movss	8(%rbx,%rdi,4), %xmm0
	addss	8(%rcx), %xmm0
	mulss	%xmm4, %xmm0
	movss	%xmm0, 8(%rax,%rsi,4)
.L34:
	addl	$1, %r11d
	cmpl	%r11d, 12(%rsp)
	jne	.L30
.L1:
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
	.p2align 4,,10
	.p2align 3
.L59:
	.cfi_restore_state
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	movl	$1, %edx
	leaq	(%rbx,%rdi,4), %rcx
	leaq	(%rax,%rsi,8), %rsi
	.p2align 4,,10
	.p2align 3
.L7:
	movss	4(%rcx,%rdx,4), %xmm0
	movss	%xmm0, (%rsi,%rdx,8)
	addq	$1, %rdx
	cmpq	%r11, %rdx
	jne	.L7
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L60:
	movslq	%esi, %rsi
	movslq	%edi, %rdi
	movslq	%r8d, %r8
	movq	72(%rsp), %r9
	leaq	(%rbx,%rsi,4), %rsi
	leaq	(%rbx,%rdi,4), %rcx
	xorl	%edx, %edx
	leaq	(%rax,%r8,4), %r8
	.p2align 4,,10
	.p2align 3
.L15:
	movss	8(%rsi,%rdx,4), %xmm0
	addss	8(%rcx,%rdx,4), %xmm0
	movq	%rdx, %rdi
	addss	12(%rsi,%rdx,4), %xmm0
	addss	12(%rcx,%rdx,4), %xmm0
	mulss	%xmm3, %xmm0
	movss	%xmm0, 12(%r8,%rdx,8)
	addq	$1, %rdx
	cmpq	%r9, %rdi
	jne	.L15
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L62:
	movq	40(%rsp), %rcx
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	leaq	0(,%rdi,4), %rdx
	salq	$2, %rsi
	addq	%rdi, %rcx
	negq	%rdi
	leaq	(%rsi,%rdi,8), %rsi
	salq	$2, %rcx
	addq	%rax, %rsi
	.p2align 4,,10
	.p2align 3
.L33:
	movss	12(%rbx,%rdx), %xmm0
	addss	8(%rbx,%rdx), %xmm0
	mulss	%xmm3, %xmm0
	movss	%xmm0, 12(%rsi,%rdx,2)
	addq	$4, %rdx
	cmpq	%rcx, %rdx
	jne	.L33
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L61:
	movslq	%esi, %rsi
	movslq	%edi, %rdi
	movslq	%r8d, %r8
	movl	$1, %edx
	leaq	(%rbx,%rsi,4), %rcx
	leaq	(%rbx,%rdi,4), %rsi
	leaq	(%rax,%r8,4), %rdi
	.p2align 4,,10
	.p2align 3
.L25:
	movss	4(%rsi,%rdx,4), %xmm0
	addss	4(%rcx,%rdx,4), %xmm0
	mulss	%xmm3, %xmm0
	movss	%xmm0, (%rdi,%rdx,8)
	addq	$1, %rdx
	cmpq	%r14, %rdx
	jne	.L25
	jmp	.L26
.L58:
	movl	28(%rsp), %esi
	subl	$1, %esi
	movl	%esi, 32(%rsp)
	jmp	.L3
	.cfi_endproc
.LFE39:
	.size	doubleSize, .-doubleSize
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	1048576000
	.long	1048576000
	.long	1048576000
	.long	1048576000
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC2:
	.long	1048576000
	.section	.rodata.cst16
	.align 16
.LC3:
	.long	1056964608
	.long	1056964608
	.long	1056964608
	.long	1056964608
	.section	.rodata.cst4
	.align 4
.LC4:
	.long	1056964608
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
