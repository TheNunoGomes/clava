	.file	"horzcat.c"
	.text
	.p2align 4
	.globl	horzcat
	.type	horzcat, @function
horzcat:
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
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movl	(%rdi), %ebp
	movl	(%rsi), %ebx
	movl	4(%rdx), %eax
	movl	(%rdx), %r15d
	movq	%rsi, 8(%rsp)
	leal	0(%rbp,%rbx), %esi
	movl	%eax, %r14d
	addl	%r15d, %esi
	movl	%eax, %edi
	movl	%eax, 24(%rsp)
	movl	%r15d, 20(%rsp)
	call	fMallocHandle@PLT
	testl	%r14d, %r14d
	jle	.L1
	leal	-1(%rbp), %esi
	movl	%ebp, %r11d
	leal	-1(%rbx), %r8d
	movl	%ebx, %r10d
	cmpl	$3, %esi
	movq	%rsi, 72(%rsp)
	movl	%r8d, %esi
	seta	%cl
	cmpq	%rax, %r12
	movq	%rsi, 80(%rsp)
	setne	%dl
	shrl	$2, %r11d
	andl	%edx, %ecx
	movl	%ebp, %edx
	salq	$4, %r11
	andl	$-4, %edx
	movb	%cl, 35(%rsp)
	movl	%edx, 44(%rsp)
	leal	1(%rdx), %ecx
	addl	$2, %edx
	cmpl	$3, %r8d
	movl	%ecx, 56(%rsp)
	seta	%cl
	cmpq	%rax, 8(%rsp)
	movl	%edx, 68(%rsp)
	setne	%dl
	shrl	$2, %r10d
	andl	%edx, %ecx
	movl	%ebx, %edx
	salq	$4, %r10
	andl	$-4, %edx
	movb	%cl, 34(%rsp)
	leal	-1(%r15), %ecx
	leal	1(%rdx), %edi
	cmpl	$3, %ecx
	movl	%edx, 40(%rsp)
	movl	%ecx, %esi
	movl	%edi, 52(%rsp)
	leal	2(%rdx), %edi
	movl	%edi, 64(%rsp)
	seta	%dil
	cmpq	%rax, %r13
	setne	%dl
	movq	%rsi, 88(%rsp)
	andl	%edx, %edi
	movl	%r15d, %edx
	andl	$-4, %r15d
	movb	%dil, 33(%rsp)
	leal	1(%r15), %edi
	shrl	$2, %edx
	movl	%r15d, 36(%rsp)
	salq	$4, %rdx
	movl	%edi, 48(%rsp)
	leal	2(%r15), %edi
	movl	%edi, 60(%rsp)
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L3:
	xorl	%esi, %esi
	testl	%ebp, %ebp
	jle	.L22
	movl	(%r12), %r8d
	movl	(%rax), %esi
	imull	%edi, %r8d
	imull	%edi, %esi
	cmpb	$0, 35(%rsp)
	je	.L4
	movslq	%r8d, %rcx
	leaq	8(%r12,%rcx,4), %r14
	movslq	%esi, %rcx
	leaq	8(%rax,%rcx,4), %r9
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L5:
	movups	(%r14,%rcx), %xmm1
	movups	%xmm1, (%r9,%rcx)
	addq	$16, %rcx
	cmpq	%r11, %rcx
	jne	.L5
	movl	44(%rsp), %r15d
	cmpl	%r15d, %ebp
	je	.L8
	leal	(%r8,%r15), %ecx
	movslq	%ecx, %rcx
	movss	8(%r12,%rcx,4), %xmm0
	leal	(%rsi,%r15), %ecx
	movl	56(%rsp), %r15d
	movslq	%ecx, %rcx
	movss	%xmm0, 8(%rax,%rcx,4)
	cmpl	%r15d, %ebp
	jle	.L8
	leal	(%r8,%r15), %ecx
	movslq	%ecx, %rcx
	movss	8(%r12,%rcx,4), %xmm0
	leal	(%rsi,%r15), %ecx
	movslq	%ecx, %rcx
	movss	%xmm0, 8(%rax,%rcx,4)
	movl	68(%rsp), %ecx
	cmpl	%ecx, %ebp
	jle	.L8
	addl	%ecx, %r8d
	addl	%ecx, %esi
	movslq	%r8d, %r8
	movslq	%esi, %rsi
	movss	8(%r12,%r8,4), %xmm0
	movss	%xmm0, 8(%rax,%rsi,4)
.L8:
	movl	%ebp, %esi
.L22:
	testl	%ebx, %ebx
	jle	.L9
	movq	8(%rsp), %r14
	movl	(%rax), %r15d
	movl	(%r14), %r8d
	imull	%edi, %r15d
	imull	%edi, %r8d
	cmpb	$0, 34(%rsp)
	je	.L10
	movslq	%r8d, %rcx
	movslq	%esi, %r9
	leaq	8(%r14,%rcx,4), %r14
	movslq	%r15d, %rcx
	leaq	2(%rcx,%r9), %rcx
	leaq	(%rax,%rcx,4), %r9
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L11:
	movups	(%r14,%rcx), %xmm2
	movups	%xmm2, (%r9,%rcx)
	addq	$16, %rcx
	cmpq	%r10, %rcx
	jne	.L11
	movl	40(%rsp), %r14d
	leal	(%rsi,%r14), %ecx
	cmpl	%r14d, %ebx
	je	.L14
	leal	(%r8,%r14), %r9d
	movq	8(%rsp), %r14
	movl	%ecx, 28(%rsp)
	movslq	%r9d, %r9
	movss	8(%r14,%r9,4), %xmm0
	leal	(%r15,%rcx), %r9d
	movslq	%r9d, %r9
	movss	%xmm0, 8(%rax,%r9,4)
	leal	1(%rcx), %r9d
	movl	52(%rsp), %ecx
	cmpl	%ecx, %ebx
	jle	.L14
	leal	(%r8,%rcx), %r14d
	movq	8(%rsp), %rcx
	addl	%r15d, %r9d
	movslq	%r14d, %r14
	movslq	%r9d, %r9
	movss	8(%rcx,%r14,4), %xmm0
	movl	28(%rsp), %ecx
	movss	%xmm0, 8(%rax,%r9,4)
	movl	64(%rsp), %r9d
	addl	$2, %ecx
	cmpl	%r9d, %ebx
	jle	.L14
	movq	8(%rsp), %r14
	addl	%r9d, %r8d
	addl	%r15d, %ecx
	movslq	%r8d, %r8
	movslq	%ecx, %rcx
	movss	8(%r14,%r8,4), %xmm0
	movss	%xmm0, 8(%rax,%rcx,4)
.L14:
	addl	%ebx, %esi
.L9:
	movl	20(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L15
	movl	0(%r13), %r8d
	movl	(%rax), %r15d
	imull	%edi, %r8d
	imull	%edi, %r15d
	cmpb	$0, 33(%rsp)
	je	.L16
	movslq	%r8d, %rcx
	movslq	%esi, %r9
	leaq	8(%r13,%rcx,4), %r14
	movslq	%r15d, %rcx
	leaq	2(%rcx,%r9), %rcx
	leaq	(%rax,%rcx,4), %r9
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L17:
	movups	(%r14,%rcx), %xmm3
	movups	%xmm3, (%r9,%rcx)
	addq	$16, %rcx
	cmpq	%rcx, %rdx
	jne	.L17
	movl	36(%rsp), %ecx
	movl	20(%rsp), %r14d
	addl	%ecx, %esi
	cmpl	%ecx, %r14d
	je	.L15
	addl	%r8d, %ecx
	movl	48(%rsp), %r9d
	movslq	%ecx, %rcx
	movss	8(%r13,%rcx,4), %xmm0
	leal	(%r15,%rsi), %ecx
	movslq	%ecx, %rcx
	movss	%xmm0, 8(%rax,%rcx,4)
	leal	1(%rsi), %ecx
	cmpl	%r14d, %r9d
	jge	.L15
	addl	%r8d, %r9d
	addl	%r15d, %ecx
	addl	$2, %esi
	movslq	%r9d, %r9
	movslq	%ecx, %rcx
	movss	8(%r13,%r9,4), %xmm0
	movss	%xmm0, 8(%rax,%rcx,4)
	movl	60(%rsp), %ecx
	cmpl	%r14d, %ecx
	jge	.L15
	addl	%ecx, %r8d
	addl	%r15d, %esi
	movslq	%r8d, %r8
	movslq	%esi, %rsi
	movss	8(%r13,%r8,4), %xmm0
	movss	%xmm0, 8(%rax,%rsi,4)
.L15:
	addl	$1, %edi
	cmpl	%edi, 24(%rsp)
	jne	.L3
.L1:
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
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
	addl	%r15d, %esi
	movslq	%r8d, %r8
	movq	88(%rsp), %r14
	xorl	%ecx, %ecx
	movslq	%esi, %rsi
	leaq	0(%r13,%r8,4), %r8
	leaq	(%rax,%rsi,4), %r9
	.p2align 4,,10
	.p2align 3
.L19:
	movss	8(%r8,%rcx,4), %xmm0
	movq	%rcx, %rsi
	movss	%xmm0, 8(%r9,%rcx,4)
	addq	$1, %rcx
	cmpq	%rsi, %r14
	jne	.L19
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L4:
	movslq	%r8d, %r8
	movslq	%esi, %rsi
	movq	72(%rsp), %r14
	xorl	%ecx, %ecx
	leaq	(%r12,%r8,4), %r8
	leaq	(%rax,%rsi,4), %r9
	.p2align 4,,10
	.p2align 3
.L7:
	movss	8(%r8,%rcx,4), %xmm0
	movq	%rcx, %rsi
	movss	%xmm0, 8(%r9,%rcx,4)
	addq	$1, %rcx
	cmpq	%r14, %rsi
	jne	.L7
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L10:
	addl	%esi, %r15d
	movslq	%r8d, %r8
	xorl	%ecx, %ecx
	movslq	%r15d, %r15
	leaq	(%r14,%r8,4), %r9
	leaq	(%rax,%r15,4), %r14
	movq	80(%rsp), %r15
	.p2align 4,,10
	.p2align 3
.L13:
	movss	8(%r9,%rcx,4), %xmm0
	movq	%rcx, %r8
	movss	%xmm0, 8(%r14,%rcx,4)
	addq	$1, %rcx
	cmpq	%r15, %r8
	jne	.L13
	jmp	.L14
	.cfi_endproc
.LFE39:
	.size	horzcat, .-horzcat
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
