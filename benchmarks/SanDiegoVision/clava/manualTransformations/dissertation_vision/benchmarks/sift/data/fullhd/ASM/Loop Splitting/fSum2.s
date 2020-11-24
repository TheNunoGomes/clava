	.file	"fSum2.c"
	.text
	.p2align 4
	.globl	fSum2
	.type	fSum2, @function
fSum2:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	4(%rdi), %ebx
	movl	(%rdi), %r12d
	cmpl	$1, %esi
	je	.L21
	pxor	%xmm0, %xmm0
	movl	$1, %esi
	movl	%ebx, %edi
	call	fSetArray@PLT
	testl	%ebx, %ebx
	jle	.L1
	movslq	(%rax), %r11
	movl	%r12d, %r10d
	movl	%r12d, %r9d
	leaq	8(%rax), %r8
	shrl	$2, %r10d
	leal	-1(%r12), %r13d
	andl	$-4, %r9d
	xorl	%edi, %edi
	salq	$2, %r11
	salq	$4, %r10
	pxor	%xmm3, %xmm3
	.p2align 4,,10
	.p2align 3
.L14:
	movaps	%xmm3, %xmm1
	testl	%r12d, %r12d
	jle	.L12
	movl	0(%rbp), %ecx
	imull	%edi, %ecx
	cmpl	$2, %r13d
	jbe	.L15
	movslq	%ecx, %rdx
	movaps	%xmm3, %xmm1
	leaq	8(%rbp,%rdx,4), %rdx
	leaq	(%rdx,%r10), %rsi
	.p2align 4,,10
	.p2align 3
.L9:
	movups	(%rdx), %xmm0
	addq	$16, %rdx
	addss	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	shufps	$85, %xmm0, %xmm2
	addss	%xmm2, %xmm1
	movaps	%xmm0, %xmm2
	unpckhps	%xmm0, %xmm2
	shufps	$255, %xmm0, %xmm0
	addss	%xmm2, %xmm1
	addss	%xmm0, %xmm1
	cmpq	%rsi, %rdx
	jne	.L9
	movl	%r9d, %edx
	cmpl	%r12d, %r9d
	je	.L12
.L8:
	leal	(%rcx,%rdx), %esi
	movslq	%esi, %rsi
	addss	8(%rbp,%rsi,4), %xmm1
	leal	1(%rdx), %esi
	cmpl	%esi, %r12d
	jle	.L12
	addl	%ecx, %esi
	addl	$2, %edx
	movslq	%esi, %rsi
	addss	8(%rbp,%rsi,4), %xmm1
	cmpl	%edx, %r12d
	jle	.L12
	addl	%edx, %ecx
	movslq	%ecx, %rcx
	addss	8(%rbp,%rcx,4), %xmm1
.L12:
	addl	$1, %edi
	movss	%xmm1, (%r8)
	addq	%r11, %r8
	cmpl	%edi, %ebx
	jne	.L14
.L1:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	movaps	%xmm3, %xmm1
	xorl	%edx, %edx
	jmp	.L8
.L21:
	pxor	%xmm0, %xmm0
	movl	%r12d, %esi
	movl	$1, %edi
	call	fSetArray@PLT
	testl	%r12d, %r12d
	jle	.L1
	leal	-1(%r12), %r8d
	xorl	%edi, %edi
	pxor	%xmm3, %xmm3
	.p2align 4,,10
	.p2align 3
.L13:
	movaps	%xmm3, %xmm0
	testl	%ebx, %ebx
	jle	.L7
	movslq	0(%rbp), %rsi
	leaq	0(%rbp,%rdi,4), %rcx
	movaps	%xmm3, %xmm0
	xorl	%edx, %edx
	salq	$2, %rsi
	.p2align 4,,10
	.p2align 3
.L4:
	addl	$1, %edx
	addss	8(%rcx), %xmm0
	addq	%rsi, %rcx
	cmpl	%edx, %ebx
	jne	.L4
.L7:
	movss	%xmm0, 8(%rax,%rdi,4)
	leaq	1(%rdi), %rdx
	cmpq	%r8, %rdi
	je	.L1
	movq	%rdx, %rdi
	jmp	.L13
	.cfi_endproc
.LFE39:
	.size	fSum2, .-fSum2
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
