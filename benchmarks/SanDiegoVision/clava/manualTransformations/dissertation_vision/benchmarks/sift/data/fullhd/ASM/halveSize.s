	.file	"halveSize.c"
	.text
	.p2align 4
	.globl	halveSize
	.type	halveSize, @function
halveSize:
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	(%rdi), %ebp
	movl	4(%rdi), %r12d
	leal	1(%rbp), %eax
	movl	%eax, %esi
	shrl	$31, %esi
	addl	%eax, %esi
	leal	1(%r12), %eax
	movl	%eax, %edi
	sarl	%esi
	shrl	$31, %edi
	addl	%eax, %edi
	sarl	%edi
	call	fSetArray@PLT
	testl	%r12d, %r12d
	jle	.L1
	testl	%ebp, %ebp
	jle	.L1
	leal	-1(%rbp), %r11d
	movl	(%rbx), %edi
	cmpl	$7, %r11d
	seta	%cl
	cmpq	%rax, %rbx
	movl	%edi, (%rsp)
	setne	%dl
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	andl	%edx, %ecx
	movl	%r11d, %edx
	shrl	$3, %r11d
	shrl	%edx
	movb	%cl, 7(%rsp)
	movl	%r11d, %r8d
	leal	1(%rdx), %edi
	salq	$4, %r8
	movl	%edi, 8(%rsp)
	leal	0(,%r11,4), %edi
	sall	$3, %r11d
	movl	%edi, 12(%rsp)
	leal	2(%r11), %r13d
	leal	4(%r11), %r14d
	leal	6(%r11), %r15d
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rsp), %esi
	imull	%r9d, %esi
	cmpb	$0, 7(%rsp)
	je	.L15
	movslq	%esi, %rdx
	leaq	8(%rbx,%rdx,4), %rcx
	movslq	%r10d, %rdx
	leaq	8(%rax,%rdx,4), %rdi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L4:
	movups	(%rcx,%rdx,2), %xmm0
	movups	16(%rcx,%rdx,2), %xmm1
	shufps	$136, %xmm1, %xmm0
	movups	%xmm0, (%rdi,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %r8
	jne	.L4
	movl	12(%rsp), %edi
	leal	(%rsi,%r11), %edx
	movslq	%edx, %rdx
	movss	8(%rbx,%rdx,4), %xmm0
	leal	(%r10,%rdi), %edx
	movslq	%edx, %rdx
	leaq	(%rax,%rdx,4), %rdx
	movss	%xmm0, 8(%rdx)
	cmpl	%r13d, %ebp
	jle	.L5
	leal	(%rsi,%r13), %ecx
	movslq	%ecx, %rcx
	movss	8(%rbx,%rcx,4), %xmm0
	movss	%xmm0, 12(%rdx)
	cmpl	%r14d, %ebp
	jle	.L5
	leal	(%rsi,%r14), %ecx
	movslq	%ecx, %rcx
	movss	8(%rbx,%rcx,4), %xmm0
	movss	%xmm0, 16(%rdx)
	cmpl	%r15d, %ebp
	jle	.L5
	addl	%r15d, %esi
	movslq	%esi, %rsi
	movss	8(%rbx,%rsi,4), %xmm0
	movss	%xmm0, 20(%rdx)
.L5:
	addl	$2, %r9d
	addl	8(%rsp), %r10d
	cmpl	%r9d, %r12d
	jg	.L3
.L1:
	addq	$24, %rsp
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
.L15:
	.cfi_restore_state
	movslq	%r10d, %rdx
	movslq	%esi, %rsi
	leaq	(%rax,%rdx,4), %rcx
	leaq	(%rbx,%rsi,4), %rsi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L6:
	movss	8(%rsi,%rdx,4), %xmm0
	movss	%xmm0, 8(%rcx,%rdx,2)
	addq	$2, %rdx
	cmpl	%edx, %ebp
	jg	.L6
	jmp	.L5
	.cfi_endproc
.LFE39:
	.size	halveSize, .-halveSize
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
